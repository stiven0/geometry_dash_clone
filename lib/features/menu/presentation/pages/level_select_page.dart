import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/core/constants/levels/game_levels.dart';
import 'package:geometry_dash/core/constants/palettes.dart';
import 'package:geometry_dash/features/game/presentation/pages/game_page.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';
import 'package:geometry_dash/features/menu/presentation/widgets/menu_background_game.dart';

class LevelSelectPage extends ConsumerWidget {
  final GamePalette palette;

  const LevelSelectPage({
    super.key,
    required this.palette,
  });

  GamePalette paletteForLevel(int level) {

    final world = (level - 1) ~/ 5;

    switch (world) {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final progress = ref.watch(progressStateProvider);

    return Scaffold(

      body: Stack(

        children: [

          Positioned.fill(
            child: GameWidget(
              game: MenuBackgroundGame(
                palette: palette,
              ),
            ),
          ),

          SafeArea(

            child: Column(

              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            "SELECT LEVEL",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                Expanded(

                  child: GridView.builder(
                    padding: const EdgeInsets.all(24),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.15,
                    ),
                    itemCount: gameLevels.length,
                    itemBuilder: (_, index) {

                      final level = index + 1;
                      final unlocked = level <= progress.unlockedLevel;
                      final palette = paletteForLevel(level);

                      return ElevatedButton(

                        onPressed: unlocked
                            ? () {
                                ref.read(
                                  progressStateProvider.notifier,
                                )
                                .selectLevel(level);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => GamePage(
                                      selectedLevel: level,
                                    ),
                                  ),
                                );
                              }
                            : null,

                        style: ElevatedButton.styleFrom(
                          elevation: unlocked ? 8 : 2,
                          backgroundColor: unlocked
                              ? palette.platformTop
                              : Colors.grey.shade700,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: unlocked
                                  ? Colors.white54
                                  : Colors.black45,
                              width: 2,
                            ),
                          ),
                        ),

                        child: unlocked

                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Text(

                                    "$level",
                                    style: const TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    "LEVEL $level",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white.withValues(alpha: .9),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )

                            : Column(

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.lock,
                                    size: 34,
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    "LOCKED",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white.withValues(),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}