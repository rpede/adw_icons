import 'dart:io';

class Git {
  static Future<bool> available() async {
    final result = await Process.run('which', ['git']);
    return result.exitCode == 0;
  }

  static Future<bool> clone({required String repository, String? tag}) async {
    final arguments = [
      'clone',
      '--depth',
      '1',
      if (tag != null) ...['--branch', tag],
      repository
    ];
    final result = await Process.run("git", arguments);
    print(result.stdout);
    print(result.stderr);
    return result.exitCode == 0;
  }

  static Future<bool> checkout(String branchTagOrCommit) async {
    final result = await Process.run("git", ['checkout', branchTagOrCommit]);
    print(result.stdout);
    print(result.stderr);
    return result.exitCode == 0;
  }
}
