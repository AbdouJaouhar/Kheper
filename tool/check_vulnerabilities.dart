import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final policyFile = File('tool/dependency_policy.json');
  if (!policyFile.existsSync()) {
    stderr.writeln('Run this check from the repository root.');
    exitCode = 2;
    return;
  }

  final policy =
      jsonDecode(policyFile.readAsStringSync()) as Map<String, dynamic>;
  final hosted = policy['hostedPackages'] as Map<String, dynamic>? ?? const {};
  final packages = hosted.entries.toList()
    ..sort((left, right) => left.key.compareTo(right.key));
  final queries = packages
      .map(
        (entry) => {
          'package': {'ecosystem': 'Pub', 'name': entry.key},
          'version': (entry.value as Map<String, dynamic>)['version'],
        },
      )
      .toList();

  final client = HttpClient()..connectionTimeout = const Duration(seconds: 20);
  try {
    final request = await client.postUrl(
      Uri.parse('https://api.osv.dev/v1/querybatch'),
    );
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode({'queries': queries}));
    final response = await request.close().timeout(const Duration(seconds: 30));
    final body = await utf8.decoder.bind(response).join();

    if (response.statusCode != HttpStatus.ok) {
      stderr.writeln(
        'OSV query failed with HTTP ${response.statusCode}: $body',
      );
      exitCode = 2;
      return;
    }

    final decoded = jsonDecode(body) as Map<String, dynamic>;
    final results = decoded['results'] as List<dynamic>?;
    if (results == null || results.length != packages.length) {
      stderr.writeln('OSV returned an incomplete batch response.');
      exitCode = 2;
      return;
    }

    final findings = <String>[];
    for (var index = 0; index < results.length; index++) {
      final result = results[index] as Map<String, dynamic>;
      final vulnerabilities = result['vulns'] as List<dynamic>? ?? const [];
      for (final vulnerability in vulnerabilities) {
        final record = vulnerability as Map<String, dynamic>;
        findings.add(
          '${packages[index].key}@${queries[index]['version']}: '
          '${record['id'] ?? 'unknown advisory'}',
        );
      }
    }

    if (findings.isNotEmpty) {
      stderr.writeln('OSV vulnerability check failed:');
      for (final finding in findings) {
        stderr.writeln('- $finding');
      }
      exitCode = 1;
      return;
    }

    stdout.writeln(
      'OSV vulnerability check passed: ${packages.length} exact hosted '
      'versions, 0 advisories.',
    );
  } on Object catch (error) {
    stderr.writeln('OSV vulnerability check could not complete: $error');
    exitCode = 2;
  } finally {
    client.close(force: true);
  }
}
