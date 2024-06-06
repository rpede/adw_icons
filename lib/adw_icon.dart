import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that renders an icon from Adwaita icon theme.
/// It uses the [flutter_svg] package to render icons, provided by the GNOME team.
class AdwIcon extends StatelessWidget {
  /// The icon to show. See `adw_icon_data.dart` for available icons.
  final String icon;

  /// The size of the icon in logical pixels.
  ///
  /// Defaults to [IconTheme] size.
  ///
  /// When placing it inside an [IconButton], then use [IconButton.iconSize]
  /// instead.
  final double? size;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the current [IconTheme] color, if any.
  ///
  final Color? color;

  /// The [Semantics.label] for this icon.
  ///
  /// The value indicates the purpose of the icon, and will be
  /// read out by screen readers.
  final String? semanticLabel;

  const AdwIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return SvgPicture.string(
      icon,
      width: size ?? iconTheme.size,
      height: size ?? iconTheme.size,
      color: color ?? iconTheme.color,
      semanticsLabel: semanticLabel,
    );
  }
}
