import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';

class JumpRingWidget extends PositionComponent with CollisionCallbacks {

  final GeometryGame game;
  double timer = 0;
  bool activated = false;

  JumpRingWidget({
    required this.game,
    required Vector2 position,
  }) {
    this.position = position;
    size = Vector2.all(42);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(
      CircleHitbox(
        radius: size.x * .35,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    timer += dt;

    if (!activated) {
      scale = Vector2.all(
        1 + sin(timer * 5) * .03,
      );
    }
  }

  @override
  void render(Canvas canvas) {

    if (activated) {
      canvas.drawCircle(
        Offset(size.x / 2, size.y / 2),
        size.x * .8,
        Paint()
          ..color = game.palette.jumpRingGlow
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            15,
          ),
      );
    }

    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x * .42,
      Paint()
        ..color = game.palette.jumpRing
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6,
    );

    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x * .28,
      Paint()
        ..color = Colors.white.withValues(alpha: .15),
    );

    canvas.drawCircle(
      Offset(size.x / 2 - 6, size.y / 2 - 8),
      3,
      Paint()
        ..color = Colors.white,
    );

    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      size.x * .22,
      Paint()
        ..color = game.palette.jumpRingInner
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
            Vector2.all(.75),
            EffectController(
              duration: .05,
            ),
          ),
          ScaleEffect.to(
            Vector2.all(1),
            EffectController(
              duration: .18,
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