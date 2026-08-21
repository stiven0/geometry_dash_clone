import 'package:flame/components.dart';

import 'package:geometry_dash/features/game/presentation/widgets/ground_block_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_pad_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_ring_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/platform_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/speed_portal_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/spike_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/diamond_widget.dart';

class WorldMovementSystem {
  final RectangleComponent ground1;
  final RectangleComponent ground2;
  final List<GroundBlockWidget> groundBlocks;
  final List<SpikeWidget> obstacles;
  final List<PlatformWidget> platforms;
  final List<JumpPadWidget> jumpPads;
  final List<DiamondWidget> diamonds;
  final List<JumpRingWidget> jumpRings;
  final List<SpeedPortalWidget> speedPortals;
  final double Function() worldSpeed;

  WorldMovementSystem({
    required this.ground1,
    required this.ground2,
    required this.groundBlocks,
    required this.obstacles,
    required this.platforms,
    required this.jumpPads,
    required this.diamonds,
    required this.jumpRings,
    required this.speedPortals,
    required this.worldSpeed,
  });

  void update(double dt) {
    updateGround(dt);
    updateObstacles(dt);
    updatePlatforms(dt);
    updateGroundBlocks(dt);
    updateJumpPads(dt);
    updateDiamonds(dt);
    updateJumpRings(dt);
    updateSpeedPortals(dt);
  }

  void updateGround(double dt) {
    final speed = worldSpeed();
    ground1.position.x -= speed * dt;
    ground2.position.x -= speed * dt;

    if (ground1.position.x + ground1.size.x < 0) {
      ground1.position.x = ground2.position.x + ground2.size.x;
    }

    if (ground2.position.x + ground2.size.x < 0) {
      ground2.position.x = ground1.position.x + ground1.size.x;
    }
  }

  void updateObstacles(double dt) {
    final speed = worldSpeed();
    for (final obstacle in obstacles) {
      obstacle.position.x -= speed * dt;
    }
  }

  void updatePlatforms(double dt) {
    final speed = worldSpeed();
    for (final platform in platforms) {
      platform.previousX = platform.position.x;
      platform.position.x -= speed * dt;
    }
  }

  void updateGroundBlocks(double dt) {
    final speed = worldSpeed();
    for (final block in groundBlocks) {
      block.position.x -= speed * dt;
    }

    while (groundBlocks.isNotEmpty &&
        groundBlocks.first.position.x + groundBlocks.first.size.x < 0) {
      final first = groundBlocks.removeAt(0);
      first.position.x = groundBlocks.last.position.x + groundBlocks.last.size.x;
      groundBlocks.add(first);
    }
  }

  void updateJumpPads(double dt) {
    final speed = worldSpeed();
    for (final jumpPad in jumpPads) {
      jumpPad.position.x -= speed * dt;
    }
  }

  void updateDiamonds(double dt) {
    final speed = worldSpeed();
    for (final diamond in diamonds) {
      diamond.position.x -= speed * dt;
    }
  }

  void updateJumpRings(double dt) {
    final speed = worldSpeed();
    for (final jumpRing in jumpRings) {
      jumpRing.position.x -= speed * dt;
    }
  }

  void updateSpeedPortals(double dt) {
    final speed = worldSpeed();
    for (final portal in speedPortals) {
      portal.position.x -= speed * dt;
    }
  }
}
