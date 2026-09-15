import 'package:flutter/material.dart';

import 'package:geometry_dash/core/constants/levels/game_levels.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/features/game/presentation/managers/effects_manager.dart';
import 'package:geometry_dash/features/game/presentation/managers/palette_manager.dart';
import 'package:geometry_dash/features/game/presentation/level/level_loader.dart';
import 'package:geometry_dash/features/game/presentation/providers/game_hub_provider.dart';
import 'package:geometry_dash/features/menu/presentation/providers/progress_state_provider.dart';

class GameLifecycleManager {
  final GeometryGame game;
  final LevelLoader levelLoader;
  final GameHubNotifier gameHubNotifier;
  final ProgressStateNotifier progressNotifier;
  final PaletteManager paletteManager;
  final EffectsManager effectsManager;
  final VoidCallback onGameCompleted;
  final Function(int level) onLevelCompleted;

  bool isGameCompleted = false;
  bool isChangingLevel = false;

  GameLifecycleManager({
    required this.game,
    required this.levelLoader,
    required this.gameHubNotifier,
    required this.progressNotifier,
    required this.paletteManager,
    required this.effectsManager,
    required this.onGameCompleted,
    required this.onLevelCompleted,
  });

  void resetGame() {
    game.currentDistance = 0;
    Future(() {
      gameHubNotifier.resetProgress();
    });
    game.resetWorldSpeed();
    game.playerController.reset();
    game.levelTimer.reset();
    levelLoader.clearLevel();
    game.levelEndX = levelLoader.loadLevel(game.currentLevel);
    game.levelTimer = Stopwatch()..start();
    game.progress = 0;
    game.lastProgress = 0;
    isGameCompleted = false;
    isChangingLevel = false;
  }

  Future<void> nextLevel() async {
    if (isChangingLevel) return;
    isChangingLevel = true;
    game.resetWorldSpeed();

    if (game.currentLevel == gameLevels.length - 1) {
      isGameCompleted = true;
      onGameCompleted();
      isChangingLevel = false;
      return;
    }

    await progressNotifier.unlockLevel(game.currentLevel + 2);
    

    game.playerController.reset();
    game.levelTimer.stop();

    final elapsedSeconds = game.levelTimer.elapsedMilliseconds / 1000.0;
    gameHubNotifier.updateFastestLevelTime(elapsedSeconds);
    gameHubNotifier.updateFastestLevelCompleted(game.currentLevel + 1, elapsedSeconds);

    onLevelCompleted(game.currentLevel + 2);

    await Future.delayed(
      const Duration(seconds: 1),
    );

    game.currentLevel++;
    gameHubNotifier.setLevel(game.currentLevel + 1);
    
    game.palette = paletteManager.getPaletteForLevel(game.currentLevel);
    levelLoader.clearLevel();
    game.levelEndX = levelLoader.loadLevel(game.currentLevel);
    game.levelTimer = Stopwatch()..start();
    game.updateBackgroundPalette();

    game.currentDistance = 0;
    game.progress = 0;
    game.lastProgress = 0;

    Future(() {
      gameHubNotifier.resetProgress();
    });

    isGameCompleted = false;
    isChangingLevel = false;
  }

  void onGameOver() {
    if (game.player.isDead) return;

    effectsManager.createDeathExplosion(game.player.position);
    game.player.die();

    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        resetGame();
        game.player.revive();
      },
    );
  }
}
