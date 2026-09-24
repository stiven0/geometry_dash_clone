import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/core/constants/palettes.dart';

class PaletteManager {
  final int levelsPerPalette;

  const PaletteManager({this.levelsPerPalette = 5});

  GamePalette getPaletteForLevel(int level) {
    final group = level ~/ levelsPerPalette;

    switch (group) {
      case 0:
        return Palettes.classic;
      case 1:
        return Palettes.lava;
      case 2:
        return Palettes.neon;
      case 3:
        return Palettes.ice;
      case 4:
        return Palettes.forest;
      case 5:
        return Palettes.space;
      case 6:
        return Palettes.desert;
      case 7:
        return Palettes.lava;
      case 8:
        return Palettes.neon;
      case 9:
        return Palettes.ice;
      case 10:
        return Palettes.forest;
      case 11:
        return Palettes.classic;
      case 12:
        return Palettes.lava;
      case 13:
        return Palettes.neon;
      case 14:
        return Palettes.ice;
      case 15:
        return Palettes.forest;
      case 16:
        return Palettes.space;
      case 17:
        return Palettes.desert;
      case 18:
        return Palettes.lava;
      case 19:
        return Palettes.neon;
      case 20:
        return Palettes.ice;
      default:
        return Palettes.classic;
    }
  }
}
