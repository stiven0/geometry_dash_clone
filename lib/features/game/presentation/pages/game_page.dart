
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geometry_dash/features/game/presentation/pages/game_completed_page.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'package:geometry_dash/features/game/presentation/widgets/game_hub_widget.dart';
import 'package:geometry_dash/features/menu/presentation/pages/menu_page.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';

enum GameState {
  playing,
  paused,
  levelCompleted,
  gameOver,
}

class GamePage extends ConsumerStatefulWidget {
  final int selectedLevel;

  const GamePage({
    super.key,
    required this.selectedLevel,
  });

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {

  late final GeometryGame game;
  late GameState gameState = GameState.playing;

  @override
  void initState() {
    super.initState();
    game = GeometryGame(
      initialLevel: widget.selectedLevel,
      gameHubNotifier: ref.read(gameHubProvider.notifier),
      progressNotifier: ref.read(progressStateProvider.notifier),
      onGameCompleted: showGameCompleted,
      onLevelCompleted: onLevelCompleted,
    );
  }

  void onLevelCompleted(int level) {
    setState(() {
      gameState = GameState.levelCompleted;
    });

     Future.delayed(
      const Duration(seconds: 1),
      () {
        if (!mounted) return;
        setState(() {
          gameState = GameState.playing;
        });
      },
    );
  }

  void togglePause() async {
    setState(() {
      if (gameState == GameState.paused) {
        game.resumeEngine();
        gameState = GameState.playing;
      } else {
        game.pauseEngine();
        gameState = GameState.paused;
      }
    });
  }

  void goToMenu() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const MenuPage(),
      ),
      (route) => false,
    );
  }

  void showGameCompleted() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const GameCompletedPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [

          GameWidget(
            game: game,
          ),

          GameHubWidget(
            game: game,
            gameState: gameState,
            onPausePressed: togglePause,
          ),

          if (gameState == GameState.paused)
            Container(
                color: Colors.black54,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'ON PAUSE',
                        style: TextStyle(fontSize: 40, color: Colors.white60, decoration: TextDecoration.none),
                      ),

                      ElevatedButton(
                        onPressed: togglePause,
                        child: const Text('Resume'),
                      ),

                      ElevatedButton(
                        onPressed: goToMenu,
                        child: const Text('Exit'),
                      ),
                    ],
                  ),
                ),
              ),
            if (gameState == GameState.levelCompleted)
              LevelCompletedOverlay(
                level: game.currentLevel + 1,
              )
          ],
      ),
    );
  }
}


class LevelCompletedOverlay extends StatelessWidget {

  final int level;

  const LevelCompletedOverlay({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {

    return ColoredBox(

      color: Colors.black54,

      child: Center(

        child: TweenAnimationBuilder(

          duration: const Duration(milliseconds: 350),

          tween: Tween(begin: .8, end: 1),

          builder: (_, scale, child) {
            return Transform.scale(
              scale: scale.toDouble(),
              child: child,
            );

          },
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color(0xff2b2b2b),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.cyanAccent,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withValues(alpha: .25),
                  blurRadius: 25,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 70,
                  color: Colors.greenAccent,
                ),
                const SizedBox(height: 20),
                const Text(
                  "LEVEL COMPLETED",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Level $level unlocked",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}