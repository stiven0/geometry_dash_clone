import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geometry_dash/core/constants/levels/game_levels.dart';
import 'package:geometry_dash/features/game/presentation/pages/game_page.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'progress_bar_widget.dart';

class GameHubWidget extends ConsumerWidget {

  final GeometryGame game;
  final GameState gameState;
  final VoidCallback onPausePressed;

  const GameHubWidget({
    super.key, 
    required this.game,
    required this.gameState,
    required this.onPausePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final hub = ref.watch(gameHubProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [

            Row(
              children: [
            
                const Icon(
                  Icons.diamond,
                  color: Colors.cyan,
                ),
            
                const SizedBox(width: 8),
            
                Text(
                  "${hub.diamonds}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
            
                const SizedBox(width: 20),
            
                const Icon(
                  Icons.flag,
                  color: Colors.green,
                ),
            
                Text(
                  "${hub.currentLevel}/${gameLevels.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
            
                const SizedBox(width: 20),

                Text(
                  "${(hub.progress * 100).toStringAsFixed(0)}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),

                const Spacer(),
            
                IconButton(
                  onPressed: onPausePressed,
                  icon: Icon(
                    gameState == GameState.paused
                        ? Icons.play_arrow
                        : Icons.pause_circle_outline,
                  ),
                )
                
              ],
            ),

            const SizedBox(height: 15),

            ProgressBarWidget(
              progress: hub.progress,
            ),


          ],
        ),
      ),
    );
  }
}