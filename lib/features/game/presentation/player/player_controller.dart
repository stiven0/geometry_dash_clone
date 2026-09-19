import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/features/game/presentation/widgets/player_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/platform_widget.dart';

class PlayerController {
  static const double playerSize = 30;

  final double initialX;
  final double Function() groundLevel;
  final GamePalette Function() palette;
  final List<PlatformWidget> platforms;
  final VoidCallback onGameOver;
  final VoidCallback onSpeedPortalCollision;
  final VoidCallback onDiamondCollected;

  late final PlayerWidget player;

  PlayerController({
    required this.initialX,
    required this.groundLevel,
    required this.palette,
    required this.platforms,
    required this.onGameOver,
    required this.onSpeedPortalCollision,
    required this.onDiamondCollected,
  });

  PlayerWidget createPlayer() {
    player = PlayerWidget(
      palette: palette,
      position: Vector2(
        initialX,
        groundLevel() - playerSize,
      ),
      height: playerSize,
      onSpikeCollision: onGameOver,
      onSpeedPortalCollision: onSpeedPortalCollision,
      onDiamondCollision: onDiamondCollected,
    );

    return player;
  }

  void onTapDown() {
    if (player.canUseJumpRing) {
      player.jumpFromRing();
    } else {
      player.jump();
    }
  }

  void update(double dt) {
    player.applyGravity(dt);
    _checkPlatformCollision();

    final playerGround = groundLevel() - player.size.y;
    if (player.position.y >= playerGround) {
      player.landOnGround(playerGround);
    }
  }

  void reset() {
    player.reset(groundLevel());
  }

  bool get isDead => player.isDead;

  void _checkPlatformCollision() {
    if (player.currentPlatform != null) {
      return;
    }

    final playerLeft = player.position.x;
    final playerRight = player.position.x + player.size.x;

    final previousBottom = player.previousY + player.size.y;
    final currentBottom = player.position.y + player.size.y;

    for (final platform in platforms) {
      final platformLeft = platform.position.x;
      final platformRight = platform.position.x + platform.size.x;

      final overlapsX = playerRight > platformLeft && playerLeft < platformRight;

      final playerCenterY = player.position.y + player.size.y / 2;
      final insideHeight = playerCenterY > platform.position.y && playerCenterY < platform.position.y + platform.size.y;

      if (overlapsX && insideHeight) {
        onGameOver();
        return;
      }

      if (!overlapsX) {
        continue;
      }

      final platformTop = platform.position.y;
      final landed = player.velocityY > 0 && previousBottom <= platformTop && currentBottom >= platformTop;

      if (landed) {
        player.position.y = platformTop - player.size.y;
        player.velocityY = 0;
        player.isJumping = false;
        player.isOnPlatform = true;
        player.currentPlatform = platform;
        player.angle = 0;
        return;
      }

      final previousTop = player.previousY;
      final currentTop = player.position.y;
      final platformBottom = platform.position.y + platform.size.y;
      final hitBottom = player.velocityY < 0 && previousTop >= platformBottom && currentTop <= platformBottom;

      if (hitBottom) {
        player.position.y = platformBottom;
        player.velocityY = 0;
        return;
      }
    }
  }
}
