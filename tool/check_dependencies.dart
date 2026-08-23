import 'dart:convert';
import 'dart:io';

final class LockedPackage {
  const LockedPackage({
    required this.name,
    required this.dependency,
    required this.source,
    required this.version,
    required this.hasChecksum,
  });

  final String name;
  final String dependency;
  final String source;
  final String version;
  final bool hasChecksum;
}

void main() {
  final root = Directory.current;
  final lockFile = File('${root.path}/app/pubspec.lock');
  final policyFile = File('${root.path}/tool/dependency_policy.json');

  if (!lockFile.existsSync() || !policyFile.existsSync()) {
    stderr.writeln(
      'Dependency check must run from the repository root and requires '
      'app/pubspec.lock plus tool/dependency_policy.json.',
    );
    exitCode = 2;
    return;
  }

  final policy =
      jsonDecode(policyFile.readAsStringSync()) as Map<String, dynamic>;
  final packages = _parseLockfile(lockFile.readAsLinesSync());
  final errors = <String>[];

  final allowedLicenses = _stringSet(policy['allowedLicenses']);
  final allowedSdkPackages = _stringSet(policy['allowedSdkPackages']);
  final allowedRuntimePackages = _stringSet(
    policy['allowedRuntimeHostedPackages'],
  );
  final forbiddenPackages = _stringSet(policy['forbiddenPackages']);
  final blockedVersions = _stringSet(policy['blockedPackageVersions']);
  final approvedHosted =
      (policy['hostedPackages'] as Map<String, dynamic>? ?? const {});

  for (final package in packages) {
    if (forbiddenPackages.contains(package.name)) {
      errors.add('${package.name} is forbidden by the offline/privacy policy.');
    }

    if (blockedVersions.contains('${package.name}@${package.version}')) {
      errors.add(
        '${package.name}@${package.version} is blocked by the vulnerability '
        'policy.',
      );
    }

    switch (package.source) {
      case 'sdk':
        if (!allowedSdkPackages.contains(package.name)) {
          errors.add('${package.name} is not an approved SDK package.');
        }
      case 'hosted':
        if (!package.hasChecksum) {
          errors.add(
            '${package.name}@${package.version} has no lock checksum.',
          );
        }

        final approval = approvedHosted[package.name];
        if (approval is! Map<String, dynamic>) {
          errors.add('${package.name}@${package.version} lacks policy review.');
          continue;
        }

        final approvedVersion = approval['version'] as String?;
        final license = approval['license'] as String?;
        if (approvedVersion != package.version) {
          errors.add(
            '${package.name} is locked at ${package.version}, but policy '
            'approves ${approvedVersion ?? 'no version'}.',
          );
        }
        if (license == null || !allowedLicenses.contains(license)) {
          errors.add(
            '${package.name}@${package.version} has missing or incompatible '
            'license ${license ?? '(none)'}.',
          );
        }
        if (package.dependency == 'direct main' &&
            !allowedRuntimePackages.contains(package.name)) {
          errors.add(
            '${package.name} is a hosted runtime dependency but has no '
            'explicit production approval.',
          );
        }
      default:
        errors.add(
          '${package.name} uses unsupported source ${package.source}; only '
          'locked hosted packages and approved Flutter SDK packages are '
          'allowed.',
        );
    }
  }

  final lockedNames = packages.map((package) => package.name).toSet();
  for (final approvedName in approvedHosted.keys) {
    if (!lockedNames.contains(approvedName)) {
      errors.add(
        '$approvedName is approved by policy but absent from the lock.',
      );
    }
  }

  if (errors.isNotEmpty) {
    stderr.writeln('Dependency policy failed:');
    for (final error in errors) {
      stderr.writeln('- $error');
    }
    exitCode = 1;
    return;
  }

  final hostedCount = packages
      .where((package) => package.source == 'hosted')
      .length;
  stdout.writeln(
    'Dependency policy passed: ${packages.length} locked packages '
    '($hostedCount hosted), 0 hosted runtime packages.',
  );
}

Set<String> _stringSet(Object? value) =>
    (value as List<dynamic>? ?? const []).cast<String>().toSet();

List<LockedPackage> _parseLockfile(List<String> lines) {
  final packages = <LockedPackage>[];
  String? name;
  String? dependency;
  String? source;
  String? version;
  var hasChecksum = false;

  void finishPackage() {
    if (name == null) return;
    if (dependency == null || source == null || version == null) {
      throw FormatException('Incomplete lock entry for $name.');
    }
    packages.add(
      LockedPackage(
        name: name,
        dependency: dependency,
        source: source,
        version: version,
        hasChecksum: hasChecksum,
      ),
    );
  }

  var inPackages = false;
  for (final line in lines) {
    if (line == 'packages:') {
      inPackages = true;
      continue;
    }
    if (line == 'sdks:') {
      finishPackage();
      break;
    }
    if (!inPackages) continue;

    final packageMatch = RegExp(r'^  ([a-zA-Z0-9_]+):$').firstMatch(line);
    if (packageMatch != null) {
      finishPackage();
      name = packageMatch.group(1)!;
      dependency = null;
      source = null;
      version = null;
      hasChecksum = false;
      continue;
    }

    final fieldMatch = RegExp(r'^    (dependency|source|version):\s+(.+)$')
        .firstMatch(line);
    if (fieldMatch != null) {
      final value = fieldMatch.group(2)!.trim().replaceAll('"', '');
      switch (fieldMatch.group(1)) {
        case 'dependency':
          dependency = value;
        case 'source':
          source = value;
        case 'version':
          version = value;
      }
    }
    if (RegExp(r'^      sha256:').hasMatch(line)) {
      hasChecksum = true;
    }
  }

  if (packages.isEmpty) {
    throw const FormatException('No package entries found in pubspec.lock.');
  }
  return packages;
}
