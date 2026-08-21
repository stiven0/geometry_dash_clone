import 'package:flame/game.dart';

import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/features/game/presentation/widgets/background_widget.dart';

class MenuBackgroundGame extends FlameGame {

  final GamePalette palette;

  MenuBackgroundGame({
    required this.palette,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    Future.delayed(const Duration(milliseconds: 500), () {
      add(
        BackgroundWidget(
          palette: palette,
          size: size,
        ),
      );
    });
    
  }
}