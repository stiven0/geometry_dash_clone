import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';

class SpeedPortalWidget extends PositionComponent with CollisionCallbacks {
  double timer = 0;
  bool activated = false;

  final bool fast;
  final GeometryGame game;

  SpeedPortalWidget({
    required this.game,
    required Vector2 position,
    this.fast = true,
  }) {
    this.position = position;
    size = Vector2(46, 82);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    timer += dt;

    scale.setValues(
      1,
      1 + sin(timer * 4) * .03,
    );
  }

  @override
  void render(Canvas canvas) {
    final portalColor = fast
    ? game.palette.portal
    : Color.lerp(game.palette.portal, Colors.red, .65)!;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          -8,
          -8,
          size.x + 16,
          size.y + 16,
        ),
        const Radius.circular(22),
      ),
      Paint()
        ..color = portalColor.withValues(alpha: .15)
        ..maskFilter =
            const MaskFilter.blur(BlurStyle.normal, 20),
    );

    final border = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          portalColor.withValues(alpha: .9),
          portalColor,
          portalColor.withValues(alpha: .7),
        ],
      ).createShader(
        Rect.fromLTWH(
          0,
          0,
          size.x,
          size.y,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final frame = Path()
      ..moveTo(size.x * .25, 0)
      ..lineTo(size.x * .75, 0)
      ..lineTo(size.x, size.y * .25)
      ..lineTo(size.x, size.y * .75)
      ..lineTo(size.x * .75, size.y)
      ..lineTo(size.x * .25, size.y)
      ..lineTo(0, size.y * .75)
      ..lineTo(0, size.y * .25)
      ..close();

    canvas.drawPath(frame, border);

    final inner = Path()
      ..moveTo(size.x * .28, 6)
      ..lineTo(size.x * .72, 6)
      ..lineTo(size.x - 6, size.y * .28)
      ..lineTo(size.x - 6, size.y * .72)
      ..lineTo(size.x * .72, size.y - 6)
      ..lineTo(size.x * .28, size.y - 6)
      ..lineTo(6, size.y * .72)
      ..lineTo(6, size.y * .28)
      ..close();

    canvas.drawPath(
      inner,
      Paint()..color = Colors.black.withValues(alpha: .75),
    );

    canvas.drawPath(
      inner,
      Paint()
        ..shader = RadialGradient(
          colors: [
            portalColor.withValues(alpha: .25),
            Colors.transparent,
          ],
        ).createShader(
          Rect.fromLTWH(
            6,
            6,
            size.x - 12,
            size.y - 12,
          ),
        ),
    );

    final arrowPaint = Paint()
    ..shader = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.white,
        portalColor,
      ],
    ).createShader(
      Rect.fromLTWH(
        0,
        0,
        size.x,
        size.y,
      ),
    );

    const arrowWidth = 8.0;
    const arrowHeight = 10.0;
    const spacing = 9.0;

    for (int i = 0; i < 3; i++) {
      final startX =
          size.x / 2 - spacing + i * spacing;

      final path = Path()
        ..moveTo(startX, size.y / 2 - arrowHeight / 2)
        ..lineTo(startX + arrowWidth, size.y / 2)
        ..lineTo(startX, size.y / 2 + arrowHeight / 2)
        ..close();

      canvas.drawPath(path, arrowPaint);
    }

    final energyPaint = Paint()
      ..strokeWidth = 2
      ..color = portalColor.withValues(alpha: .5);

    for (int i = 0; i < 4; i++) {
      final offset =
          ((timer * 40) + i * 20) % size.y;

      canvas.drawLine(
        Offset(9, offset),
        Offset(size.x - 9, offset - 10),
        energyPaint,
      );
    }
  }

  void activate() {
    if (activated) return;

    activated = true;

    scale.setValues(1.15, 1.15);

    Future.delayed(
      const Duration(milliseconds: 120),
      () {
        scale.setValues(1, 1);
        activated = false;
      },
    );
  }
}