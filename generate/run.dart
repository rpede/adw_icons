import 'dart:io';

import 'dart_emitter.dart';
import 'icon_set.dart';

const iconSet = IconSet(
  uri: "https://gitlab.gnome.org/GNOME/adwaita-icon-theme",
  version: "46.2",
  svgFolder: "Adwaita/symbolic",
);

void main() async {
  await iconSet.fetchUpstream();
  final icons = iconSet.getIcons();

  final properties = Map.fromEntries(
    await icons
        .asyncMap((icon) async => MapEntry(
            DartEmitter.pathToPropertyName(icon.path), await icon.content))
        .toList(),
  );
  final source =
      await DartEmitter.convertToClassConst("AdwIconData", properties);

  final outFile = File('lib/adw_icon_data.dart');
  if (await outFile.exists()) outFile.delete();
  outFile.writeAsString(source);
}
