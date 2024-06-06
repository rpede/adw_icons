import 'dart:io';

import 'git.dart';

typedef FileContent = ({String path, Future<String> content});

class IconSet {
  final String uri;
  final String version;
  final String svgFolder;
  const IconSet(
      {required this.uri, required this.version, required this.svgFolder});

  String get path => uri.split("/").last;
  String get scanPath => "$path/$svgFolder";

  Future<void> fetchUpstream() async {
    if (!await Git.available()) {
      throw 'GIT is required to generate this package!';
    }
    final dir = Directory(path);
    if (await dir.exists()) {
      print("Removing ${dir.absolute}");
      await dir.delete(recursive: true);
    }
    await Git.clone(repository: uri, tag: version);
  }

  Stream<FileContent> getIcons() {
    final svgFiles = Directory(scanPath)
        .list(recursive: true)
        .where((entity) => entity is File)
        .map((entity) => entity as File)
        .where((file) => file.path.endsWith('.svg'))
        .asyncMap((icon) async => (
              path: icon.path.replaceFirstMapped("$scanPath/", (m) => ''),
              content: icon.readAsString()
            ));
    return svgFiles;
  }
}
