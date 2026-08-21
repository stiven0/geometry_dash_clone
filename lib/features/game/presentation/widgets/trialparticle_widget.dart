import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';

class TrailParticleWidget extends PositionComponent {

  final GeometryGame game;
  double life;
  final double speed;

  TrailParticleWidget({
    required this.game,
    required Vector2 position,
    required this.speed,
    this.life = 0.3
  }) {
    this.position = position;
    size = Vector2.all(12);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.x -= speed * dt;
    life -= dt;

    if (life <= 0) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final factor = (life / 0.3).clamp(0.0, 1.0);

    final paint = Paint()
      ..color = game.palette.trail.withValues(alpha: factor);

    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      (size.x / 2) * factor,
      paint,
    );
  }
}