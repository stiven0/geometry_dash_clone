

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';

class DiamondParticleWidget extends PositionComponent {

  final GeometryGame game;
  Vector2 velocity;
  double life;

  DiamondParticleWidget({
    required this.game,
    required Vector2 position,
    required this.velocity,
    this.life = 0.8,
  }) {
    this.position = position;
    size = Vector2.all(8);
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    position += velocity * dt;
    life -= dt;
    if (life <= 0) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()

    ..color = game.palette.diamond.withValues(
      alpha: life.clamp(0, 1),
    );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x,
        size.y,
      ),
      paint,
    );
  }

}