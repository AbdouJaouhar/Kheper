import 'dart:io';

void main() {
  const plannedRoots = ['schemas', 'content'];
  final unexpected = <String>[];

  for (final root in plannedRoots) {
    final directory = Directory(root);
    if (!directory.existsSync()) continue;
    final files = directory
        .listSync(recursive: true, followLinks: false)
        .whereType<File>()
        .map((file) => file.path)
        .toList();
    if (files.isNotEmpty) {
      unexpected.addAll(files);
    }
  }

  if (unexpected.isNotEmpty) {
    stderr.writeln(
      'Schema/content inputs exist before their validators are implemented. '
      'Extend this check in the selected schema/content ticket:',
    );
    for (final path in unexpected) {
      stderr.writeln('- $path');
    }
    exitCode = 1;
    return;
  }

  stdout.writeln(
    'Schema/content baseline passed: no versioned inputs exist yet. Future '
    'inputs must arrive with their selected-ticket validators.',
  );
}
