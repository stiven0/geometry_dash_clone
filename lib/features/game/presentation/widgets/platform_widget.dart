import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../pages/geometry_game.dart';

class PlatformWidget extends PositionComponent with CollisionCallbacks {

  final GeometryGame game;
  double previousX = 0;

  PlatformWidget({
    required this.game,
    required Vector2 position,
    required double height,
    double width = 30,
  }) {
    this.position = position;
    size = Vector2(width, height);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {

    final palette = game.palette;

    final background = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          palette.platformBody.withValues(alpha: .95),
          palette.platformBody,
          palette.platformBody.withValues(alpha: .65),
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
      Paint()
        ..color = palette.platformTop,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        5,
        size.x,
        2,
      ),
      Paint()
        ..color = Colors.white.withValues(alpha: .30),
    );

    final panel = Rect.fromLTWH(
      8,
      10,
      size.x - 16,
      size.y - 18,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        panel,
        const Radius.circular(4),
      ),
      Paint()
        ..color = Colors.white.withValues(alpha: .05),
    );

    canvas.drawLine(
      Offset(panel.left, panel.top),
      Offset(panel.right, panel.top),
      Paint()
        ..color = Colors.white.withValues(alpha: .18)
        ..strokeWidth = 1,
    );

    canvas.drawLine(
      Offset(panel.left, panel.bottom),
      Offset(panel.right, panel.bottom),
      Paint()
        ..color = Colors.black.withValues(alpha: .45)
        ..strokeWidth = 1,
    );

    if (size.x >= 40 && size.y >= 35) {

      final screwPaint = Paint()
        ..color = Colors.grey.shade400;

      final screwBorder = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1
        ..color = Colors.black54;

      const r = 2.5;

      final screws = [
        Offset(12, 12),
        Offset(size.x - 12, 12),
        Offset(12, size.y - 12),
        Offset(size.x - 12, size.y - 12),
      ];

      for (final s in screws) {

        canvas.drawCircle(s, r, screwPaint);

        canvas.drawCircle(s, r, screwBorder);

        canvas.drawLine(
          Offset(s.dx - 1.5, s.dy),
          Offset(s.dx + 1.5, s.dy),
          screwBorder,
        );
      }
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