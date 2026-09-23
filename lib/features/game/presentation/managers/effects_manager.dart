import 'package:flame/components.dart';
import 'dart:math'; 

import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/features/game/presentation/widgets/death_particle_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/diamond_particle_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/shield_particle_widget.dart';

class EffectsManager {
  final GeometryGame game;
  final double pi = 3.141592653589793;

  EffectsManager(this.game);

  void createDeathExplosion(Vector2 position) {
    for (int i = 0; i < 25; i++) {
      final angle = game.random.nextDouble() * pi * 2;
      final speed = 100 + game.random.nextDouble() * 300;
      final velocity = Vector2(
        cos(angle) * speed,
        sin(angle) * speed,
      );

      game.add(
        DeathParticleWidget(
          position: position.clone(),
          velocity: velocity,
        ),
      );
    }
  }

  void createDiamondExplosion(Vector2 position) {
    for (int i = 0; i < 15; i++) {
      final angle = game.random.nextDouble() * pi * 2;
      final speed = 100 + game.random.nextDouble() * 200;
      final velocity = Vector2(
        cos(angle) * speed,
        sin(angle) * speed,
      );

      game.add(
        DiamondParticleWidget(
          game: game,
          position: position.clone(),
          velocity: velocity,
        ),
      );
    }
  }

  void createShieldExplosion(Vector2 position) {
    for (int i = 0; i < 18; i++) {
      final angle = game.random.nextDouble() * pi * 2;
      final speed = 80 + game.random.nextDouble() * 220;
      final velocity = Vector2(
        cos(angle) * speed,
        sin(angle) * speed,
      );

      game.add(
        ShieldParticleWidget(
          game: game,
          position: position.clone(),
          velocity: velocity,
        ),
      );
    }
  }
}
