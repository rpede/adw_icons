class DartEmitter {
  static Future<String> convertToClassConst(
      String className, Map<String, String> properties) async {
    final declarations = properties.entries
        .map((prop) =>
            "static const ${pathToPropertyName(prop.key)} = '''${prop.value}''';")
        .toList();
    final source = """
  class $className {
    ${declarations.join('\n')}
  }
  """;
    return source;
  }

  static String pathToPropertyName(String path) {
    String toIdentifier(String path) => path
        .split('.')[0]
        .replaceAll('/', "_")
        .replaceAll('-', "_")
        .replaceAll('+', "_");
    String toCamelCase(String text) => text.replaceAllMapped(
        RegExp(r'([-_][a-z])'),
        (m) => m[0]!.toUpperCase().replaceAll('-', '').replaceAll('_', ''));
    return toCamelCase(toIdentifier(path));
  }
}
