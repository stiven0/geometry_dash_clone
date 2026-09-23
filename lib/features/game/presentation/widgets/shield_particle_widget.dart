import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';

class ShieldParticleWidget extends PositionComponent {
  final GeometryGame game;
  Vector2 velocity;
  double life;

  ShieldParticleWidget({
    required this.game,
    required Vector2 position,
    required this.velocity,
    this.life = 0.7,
  }) {
    this.position = position;
    size = Vector2.all(7);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += velocity * dt;
    velocity.y += 280 * dt;
    life -= dt;
    if (life <= 0) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final alpha = life.clamp(0.0, 1.0);
    final center = Offset(size.x / 2, size.y / 2);

    canvas.drawCircle(
      center,
      size.x * 0.7,
      Paint()
        ..color = game.palette.shieldGlow.withValues(alpha: alpha * 0.55)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    canvas.drawCircle(
      center,
      size.x * 0.35,
      Paint()..color = game.palette.shield.withValues(alpha: alpha),
    );
  }
}
