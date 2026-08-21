import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:geometry_dash/core/constants/background_block.dart';
import 'package:geometry_dash/core/constants/game_palette.dart';

  class BackgroundWidget extends PositionComponent {

    GamePalette palette;
    final random = Random();
    late final List<BackgroundBlock> blocks;

    BackgroundWidget({
      required this.palette,
      required Vector2 size,
    }) {
      this.size = size;
      priority = -1000;

      blocks = [
        BackgroundBlock(
          x: 40,
          y: 40,
          width: 180,
          height: 140,
          speed: 8,
        ),

        BackgroundBlock(
          x: 260,
          y: 30,
          width: 120,
          height: 70,
          speed: 12,
        ),

        BackgroundBlock(
          x: 430,
          y: 60,
          width: 220,
          height: 110,
          speed: 10,
        ),

        BackgroundBlock(
          x: 700,
          y: 25,
          width: 180,
          height: 180,
          speed: 7,
        ),

        BackgroundBlock(
          x: 980,
          y: 55,
          width: 250,
          height: 120,
          speed: 14,
        ),

        BackgroundBlock(
          x: 120,
          y: 250,
          width: 160,
          height: 90,
          speed: 11,
        ),

        BackgroundBlock(
          x: 420,
          y: 280,
          width: 240,
          height: 120,
          speed: 8,
        ),

        BackgroundBlock(
          x: 760,
          y: 240,
          width: 170,
          height: 90,
          speed: 13,
        ),

        BackgroundBlock(
          x: 1100,
          y: 210,
          width: 260,
          height: 150,
          speed: 9,
        ),
      ];

    }

    @override
    void render(Canvas canvas) {
      super.render(canvas);

      final backgroundPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: palette.backgroundGradient,
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
        backgroundPaint,
      );

      final blockFill = Paint()
        ..color = Colors.white.withValues(alpha: .035);

      final blockBorder = Paint()
        ..color = Colors.white.withValues(alpha: .08)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      for (final block in blocks) {
        canvas.drawRect(
          block.rect,
          blockFill,
        );

        canvas.drawRect(
          block.rect,
          blockBorder,
        );
      }

      const grid = 64.0;

      final gridPaint = Paint()
        ..color = Colors.white.withValues(alpha: .05)
        ..strokeWidth = 1;

      for (double x = 0; x <= size.x; x += grid) {
        canvas.drawLine(
          Offset(x, 0),
          Offset(x, size.y),
          gridPaint,
        );
      }

      for (double y = 0; y <= size.y; y += grid) {
        canvas.drawLine(
          Offset(0, y),
          Offset(size.x, y),
          gridPaint,
        );
      }
    }
    
    @override
    void update(double dt) {
      super.update(dt);

      for (final block in blocks) {

        block.x -= block.speed * dt;

        if (block.x + block.width < 0) {

          double rightMost = 0;

          for (final current in blocks) {
            if (current.x > rightMost) {
              rightMost = current.x;
            }
          }

          block
            ..x = rightMost + random.nextDouble() * 220 + 120
            ..y = random.nextDouble() * (size.y * .55)
            ..width = 120 + random.nextDouble() * 180
            ..height = 60 + random.nextDouble() * 140
            ..speed = 7 + random.nextDouble() * 8;
        }
      }
    }

    setPalette(GamePalette newPalette) {
      palette = newPalette;
    }

  }