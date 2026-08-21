import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';

import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';

class SpikeWidget extends PositionComponent with CollisionCallbacks {

  final GeometryGame game;

  SpikeWidget({
    required this.game,
    required Vector2 position,
  }) {
    this.position = position;
    size = Vector2(26, 26);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      PolygonHitbox([
        Vector2(size.x / 2, 3),
        Vector2(4, size.y - 6),
        Vector2(size.x - 4, size.y - 6),
      ]),
    );
  }

  @override
  void render(Canvas canvas) {

    canvas.drawPath(
      Path()
        ..moveTo(size.x / 2, 0)
        ..lineTo(0, size.y * .72)
        ..lineTo(size.x, size.y * .72)
        ..close(),
      Paint()
        ..color = game.palette.spikeGlow
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          10,
        ),
    );

    final baseRect = Rect.fromLTWH(
      0,
      size.y * .72,
      size.x,
      size.y * .28,
    );

    final basePaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF404040),
          Color(0xFF1E1E1E),
        ],
      ).createShader(baseRect);

    canvas.drawRect(baseRect, basePaint);

    final spike = Path()
      ..moveTo(size.x / 2, 0)
      ..lineTo(0, size.y * .72)
      ..lineTo(size.x, size.y * .72)
      ..close();

    final bodyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: game.palette.spikeGradient,
      ).createShader(
        Rect.fromLTWH(
          0,
          0,
          size.x,
          size.y,
        ),
      );

    canvas.drawPath(
      spike,
      bodyPaint,
    );

    final leftFace = Path()
      ..moveTo(size.x / 2, 0)
      ..lineTo(0, size.y * .72)
      ..lineTo(size.x / 2, size.y * .72)
      ..close();

    canvas.drawPath(
      leftFace,
      Paint()
        ..color = Colors.white.withValues(alpha: .20),
    );

    final rightFace = Path()
      ..moveTo(size.x / 2, 0)
      ..lineTo(size.x, size.y * .72)
      ..lineTo(size.x / 2, size.y * .72)
      ..close();

    canvas.drawPath(
      rightFace,
      Paint()
        ..color = Colors.black.withValues(alpha: .12),
    );

    canvas.drawLine(
      Offset(size.x / 2, 3),
      Offset(size.x / 2, size.y * .72),
      Paint()
        ..color = Colors.white.withValues(alpha: .25)
        ..strokeWidth = 1,
    );

    canvas.drawCircle(
      const Offset(13, 3),
      1.8,
      Paint()..color = Colors.white,
    );

    final border = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black87;

    canvas.drawPath(
      spike,
      border,
    );

    canvas.drawRect(
      baseRect,
      border,
    );
  }
}