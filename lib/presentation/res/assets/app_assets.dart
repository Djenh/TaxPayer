import 'package:flutter/foundation.dart';

import 'icons.dart';
import 'imgs.dart';
import 'svgs.dart';

final AppAssets $appAssets = AppAssets();

@immutable
class AppAssets {
  /// Svg files
  final Svgs svgs = Svgs();

  /// All other images
  final Imgs imgs = Imgs();

  /// All other icons
  final Icons icons = Icons();
}
