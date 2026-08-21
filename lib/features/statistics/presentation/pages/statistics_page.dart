import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';
import 'package:geometry_dash/features/menu/presentation/widgets/menu_background_game.dart';
import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/features/statistics/presentation/widgets/statistics_content.dart';

class StatisticsPage extends ConsumerWidget {
  final GamePalette palette;
  const StatisticsPage({
    super.key,
    required this.palette
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressStateProvider);
    final gameHub = ref.watch(gameHubProvider);

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
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            "STATISTICS",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
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
                  child: StatisticsContent(
                    progress: progress,
                    gameHub: gameHub,
                    palette: palette,
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