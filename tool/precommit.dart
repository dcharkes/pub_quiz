/// To set up this script as a pre-commit hook, create a file named `pre-commit`
/// in the `.git/hooks/` directory with the following content:
///
/// ```
/// #!/bin/sh
/// dart tool/precommit.dart
/// ```
///
/// Then, make the hook executable: chmod +x .git/hooks/pre-commit
library;

import 'dart:io';

void main() {
  final analyzeResult = Process.runSync(Platform.executable, [
    'analyze',
    '--fatal-infos',
    '.',
  ]);
  print(analyzeResult.stdout);
  print(analyzeResult.stderr);
  if (analyzeResult.exitCode != 0) {
    exit(1);
  }

  final formatResult = Process.runSync(Platform.executable, [
    'format',
    '--set-exit-if-changed',
    '.',
  ]);

  print(formatResult.stdout);
  print(formatResult.stderr);
  if (formatResult.exitCode != 0) {
    exit(1);
  }
}
