import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';

class GroundBlockWidget extends PositionComponent {

  final GeometryGame game;

  GroundBlockWidget({
    required this.game,
    required Vector2 position,
    required Vector2 size,
  }) {
    this.position = position;
    this.size = size;
  }

  @override
  void render(Canvas canvas) {

    final background = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          game.palette.ground.withValues(alpha: .95),
          game.palette.platformBody,
        Colors.black,
        ],
      ).createShader(
        Rect.fromLTWH(
          0,
          0,
          size.x,
          size.y,
        ),
      );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x,
        size.y,
      ),
      background,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x,
        5,
      ),
      Paint()..color = game.palette.platformTop,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        5,
        size.x,
        2,
      ),
      Paint()
        ..color = Colors.white.withValues(alpha: .35),
    );

    final plate = Rect.fromLTWH(
      8,
      12,
      size.x - 16,
      size.y - 20,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        plate,
        const Radius.circular(4),
      ),
      Paint()
        ..color = Colors.white.withValues(alpha: .04),
    );

    canvas.drawLine(
      Offset(plate.left, plate.top),
      Offset(plate.right, plate.top),
      Paint()
        ..color = Colors.white.withValues(alpha: .20)
        ..strokeWidth = 1,
    );

    canvas.drawLine(
      Offset(plate.left, plate.bottom),
      Offset(plate.right, plate.bottom),
      Paint()
        ..color = Colors.black.withValues(alpha: .45)
        ..strokeWidth = 1,
    );

    final screwPaint = Paint()
      ..color = Colors.grey.shade400;

    final screwBorder = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black54;

    const r = 2.5;

    final screws = [
      Offset(12, 16),
      Offset(size.x - 12, 16),
      Offset(12, size.y - 12),
      Offset(size.x - 12, size.y - 12),
    ];

    for (final p in screws) {
      canvas.drawCircle(
        p,
        r,
        screwPaint,
      );

      canvas.drawCircle(
        p,
        r,
        screwBorder,
      );

      canvas.drawLine(
        Offset(p.dx - 1.5, p.dy),
        Offset(p.dx + 1.5, p.dy),
        screwBorder,
      );
    }

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.x,
        size.y,
      ),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.black87,
    );
  }
}