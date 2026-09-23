import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/features/game/presentation/widgets/player_widget.dart';

class ShieldWidget extends PositionComponent with CollisionCallbacks {
  final GeometryGame game;
  final VoidCallback? onCollect;
  bool isCollected = false;
  double time = 0;
  late double baseY;

  ShieldWidget({
    required this.game,
    required Vector2 position,
    this.onCollect,
  }) {
    this.position = position;
    size = Vector2(28, 32);
  }

  Path _shieldPath() {
    final w = size.x;
    final h = size.y;

    return Path()
      ..moveTo(w * 0.5, 0)
      ..cubicTo(w * 0.85, 0, w, h * 0.12, w, h * 0.28)
      ..cubicTo(w, h * 0.55, w * 0.78, h * 0.82, w * 0.5, h)
      ..cubicTo(w * 0.22, h * 0.82, 0, h * 0.55, 0, h * 0.28)
      ..cubicTo(0, h * 0.12, w * 0.15, 0, w * 0.5, 0)
      ..close();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    baseY = position.y;
    add(
      PolygonHitbox([
        Vector2(size.x * 0.5, 0),
        Vector2(size.x, size.y * 0.28),
        Vector2(size.x * 0.78, size.y * 0.82),
        Vector2(size.x * 0.5, size.y),
        Vector2(size.x * 0.22, size.y * 0.82),
        Vector2(0, size.y * 0.28),
      ]),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    time += dt;
    angle = sin(time * 2) * 0.15;
    position.y = baseY + sin(time * 3) * 3;
  }

  @override
  void render(Canvas canvas) {
    final shield = _shieldPath();

    canvas.drawPath(
      shield,
      Paint()
        ..color = game.palette.shieldGlow
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          12,
        ),
    );

    canvas.drawPath(
      shield,
      Paint()..color = game.palette.shield,
    );

    final highlight = Path()
      ..moveTo(size.x * 0.5, size.y * 0.08)
      ..cubicTo(
        size.x * 0.72,
        size.y * 0.08,
        size.x * 0.82,
        size.y * 0.18,
        size.x * 0.82,
        size.y * 0.32,
      )
      ..cubicTo(
        size.x * 0.82,
        size.y * 0.48,
        size.x * 0.68,
        size.y * 0.68,
        size.x * 0.5,
        size.y * 0.78,
      )
      ..cubicTo(
        size.x * 0.55,
        size.y * 0.55,
        size.x * 0.55,
        size.y * 0.28,
        size.x * 0.5,
        size.y * 0.08,
      )
      ..close();

    canvas.drawPath(
      highlight,
      Paint()..color = Colors.white.withValues(alpha: 0.35),
    );

    canvas.drawPath(
      shield,
      Paint()
        ..color = Colors.black.withValues(alpha: 0.55)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    canvas.drawLine(
      Offset(size.x * 0.5, size.y * 0.12),
      Offset(size.x * 0.5, size.y * 0.78),
      Paint()
        ..color = Colors.white.withValues(alpha: 0.4)
        ..strokeWidth = 1.5,
    );
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (isCollected) return;

    if (other is PlayerWidget) {
      isCollected = true;
      onCollect?.call();

      add(
        ScaleEffect.to(
          Vector2.zero(),
          EffectController(duration: 0.25),
        ),
      );
    }

    super.onCollisionStart(intersectionPoints, other);
  }
}
