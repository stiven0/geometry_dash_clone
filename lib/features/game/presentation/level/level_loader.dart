import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:geometry_dash/core/constants/levels/game_levels.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/core/constants/levels/level_object.dart';
import 'package:geometry_dash/features/game/presentation/widgets/diamond_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/ground_block_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_pad_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_ring_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/platform_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/speed_portal_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/spike_widget.dart';

class LevelLoader {
  final GeometryGame game;
  final List<SpikeWidget> obstacles;
  final List<PlatformWidget> platforms;
  final List<GroundBlockWidget> groundBlocks;
  final List<JumpPadWidget> jumpPads;
  final List<DiamondWidget> diamonds;
  final List<JumpRingWidget> jumpRings;
  final List<SpeedPortalWidget> speedPortals;
  final double Function() groundLevel;
  final double Function(double column) toX;
  final double Function(double row) toY;
  final double Function(double columns) toWidth;
  final double Function(double rows) toHeight;
  final VoidCallback onDiamondCollected;

  LevelLoader({
    required this.game,
    required this.obstacles,
    required this.platforms,
    required this.groundBlocks,
    required this.jumpPads,
    required this.diamonds,
    required this.jumpRings,
    required this.speedPortals,
    required this.groundLevel,
    required this.toX,
    required this.toY,
    required this.toWidth,
    required this.toHeight,
    required this.onDiamondCollected,
  });

  double loadLevel(int index) {
    if (index < 0 || index >= gameLevels.length) {
      return 0;
    }

    final level = gameLevels[index];
    double levelEndX = 0;

    for (final object in level.objects) {
      levelEndX = toX(level.endColumn);

      switch (object.type) {
        case LevelObjectType.spike:
          _addSpike(toX(object.column));
          break;
        case LevelObjectType.platform:
          _addPlatform(
            x: toX(object.column),
            y: groundLevel() - toHeight(object.rows) - toY(object.row),
            height: toHeight(object.rows),
            width: toWidth(object.columns),
          );
          break;
        case LevelObjectType.jumpPad:
          _addJumpPad(x: toX(object.column));
          break;
        case LevelObjectType.diamond:
          _addDiamond(
            x: toX(object.column),
            y: groundLevel() - toY(object.row),
          );
          break;
        case LevelObjectType.jumpRing:
          _addJumpRing(
            x: toX(object.column),
            y: groundLevel() - toY(object.row),
          );
          break;
        case LevelObjectType.speedPortal:
          _addSpeedPortal(
            x: toX(object.column),
            y: groundLevel() - toHeight(4) - toY(object.row),
            fast: true,
          );
          break;
      }
    }

    levelEndX += 80;
    _createGroundBlocks();

    return levelEndX;
  }

  void clearLevel() {
    for (final spike in obstacles) {
      spike.removeFromParent();
    }
    obstacles.clear();

    for (final platform in platforms) {
      platform.removeFromParent();
    }
    platforms.clear();

    for (final jumpPad in jumpPads) {
      jumpPad.removeFromParent();
    }
    jumpPads.clear();

    for (final diamond in diamonds) {
      diamond.removeFromParent();
    }
    diamonds.clear();

    for (final jumpRing in jumpRings) {
      jumpRing.removeFromParent();
    }
    jumpRings.clear();

    for (final portal in speedPortals) {
      portal.removeFromParent();
    }
    speedPortals.clear();

    for (final block in groundBlocks) {
      block.removeFromParent();
    }
    groundBlocks.clear();
  }

  void _createGroundBlocks() {
    groundBlocks.clear();
    const blockWidth = 64.0;
    final count = (game.size.x / blockWidth).ceil() + 2;

    for (int i = 0; i < count; i++) {
      final block = GroundBlockWidget(
        game: game,
        position: Vector2(
          i * blockWidth,
          groundLevel(),
        ),
        size: Vector2(blockWidth, blockWidth),
      );

      groundBlocks.add(block);
      game.add(block);
    }
  }

  void _addSpike(double x) {
    final spike = SpikeWidget(
      game: game,
      position: Vector2(x, groundLevel() - 26),
    );
    obstacles.add(spike);
    game.add(spike);
  }

  void _addPlatform({
    required double x,
    required double y,
    required double height,
    double width = 30,
  }) {
    final platform = PlatformWidget(
      game: game,
      position: Vector2(x, y),
      height: height,
      width: width,
    );
    platforms.add(platform);
    game.add(platform);
  }

  void _addJumpPad({required double x}) {
    final jumpPad = JumpPadWidget(
      game: game,
      position: Vector2(
        x,
        groundLevel() - 15,
      ),
    );
    jumpPads.add(jumpPad);
    game.add(jumpPad);
  }

  void _addDiamond({
    required double x,
    required double y,
  }) {
    final diamond = DiamondWidget(
      game: game,
      position: Vector2(x, y),
      onCollect: onDiamondCollected,
    );
    diamonds.add(diamond);
    game.add(diamond);
  }

  void _addJumpRing({
    required double x,
    required double y,
  }) {
    final jumpRing = JumpRingWidget(
      game: game,
      position: Vector2(x, y),
    );
    jumpRings.add(jumpRing);
    game.add(jumpRing);
  }

  void _addSpeedPortal({
    required double x,
    required double y,
    bool fast = true,
  }) {
    final portal = SpeedPortalWidget(
      game: game,
      position: Vector2(x, y),
      fast: fast,
    );
    speedPortals.add(portal);
    game.add(portal);
  }
}
