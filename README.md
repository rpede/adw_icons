Adwaita icon theme for Flutter.

Is is based on the official [Adwaita Icon Theme](https://gitlab.gnome.org/GNOME/adwaita-icon-theme).

There is also [adwaita_icons](https://pub.dev/packages/adwaita_icons) which
serves a similar goal, but is not up to date.
I created this project to make it easy to update with upstream changes to icons.
In fact the project is just some code to generate Dart source with the icons.

## Features

- Use Adwaita Icon Theme in Flutter
- Automation for updating the package.

## Getting started

To re-generate the package with newest icons just run:

```sh
dart run generate/run.dart
```

## Usage

```dart
class WidgetWithAdwIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AdwIcon(AdwIconData.uiRadioSymbolic);
  }
}
```

## Additional information

Checkout the upstream package [Adwaita Icon Theme](https://gitlab.gnome.org/GNOME/adwaita-icon-theme).
You can preview and search through the icons using [
Icon Library](https://gitlab.gnome.org/World/design/icon-library).
