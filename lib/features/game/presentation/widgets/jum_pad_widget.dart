import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';

class JumpPadWidget extends PositionComponent with CollisionCallbacks {

  final GeometryGame game;
  double timer = 0;
  bool activated = false;

  JumpPadWidget({
    required this.game,
    required Vector2 position,
  }) {
    this.position = position;

    size = Vector2(48, 18);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(
      RectangleHitbox(
        size: Vector2(size.x, 8),
        position: Vector2(0, 0),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    timer += dt;

    if (!activated) {
      scale.y = 1 + sin(timer * 5) * .02;
    }
  }

  @override
  void render(Canvas canvas) {

    if (activated) {
      canvas.drawCircle(
        Offset(size.x / 2, size.y / 2),
        size.x * .75,
        Paint()
          ..color = game.palette.jumpPadGlow
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            12,
          ),
      );
    }

    final rect = Rect.fromLTWH(
      0,
      0,
      size.x,
      size.y * 2,
    );

    final fill = Paint()
      ..shader = RadialGradient(
        center: Alignment.topCenter,
        radius: 1,
        colors: game.palette.jumpPadGradient,
      ).createShader(rect);

    canvas.drawArc(
      rect,
      pi,
      pi,
      true,
      fill,
    );

    canvas.drawArc(
      rect,
      pi,
      pi,
      false,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );

    final triangle = Path()
      ..moveTo(size.x / 2, -5)
      ..lineTo(size.x / 2 - 8, 2)
      ..lineTo(size.x / 2 + 8, 2)
      ..close();

    canvas.drawPath(
      triangle,
      Paint()..color = Colors.white,
    );

    canvas.drawArc(
      Rect.fromLTWH(
        6,
        5,
        size.x - 12,
        size.y * 1.2,
      ),
      pi,
      pi,
      false,
      Paint()
        ..color = Colors.white.withValues(alpha: .35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  void activate() {
    if (activated) return;

    activated = true;

    add(
      SequenceEffect(
        [
          ScaleEffect.to(
            Vector2(1.15, .75),
            EffectController(
              duration: .06,
              curve: Curves.easeOut,
            ),
          ),
          ScaleEffect.to(
            Vector2.all(1),
            EffectController(
              duration: .15,
              curve: Curves.elasticOut,
            ),
          ),
        ],
        onComplete: () {
          activated = false;
        },
      ),
    );
  }
}