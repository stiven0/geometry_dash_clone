import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'dart:math';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import 'package:geometry_dash/features/game/presentation/pages/geometry_game.dart';
import 'package:geometry_dash/features/game/presentation/widgets/player_widget.dart';

class DiamondWidget extends PositionComponent with CollisionCallbacks {

  final GeometryGame game;
  final VoidCallback? onCollect;
  bool isCollected = false;
  double time = 0;
  late double baseY;

  DiamondWidget({
    required this.game,
    required Vector2 position,
    this.onCollect
  }) {
    this.position = position;
    size = Vector2(24, 24);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    baseY = position.y;
    add(
      PolygonHitbox([
        Vector2(size.x / 2, 0),
        Vector2(size.x, size.y / 2),
        Vector2(size.x / 2, size.y),
        Vector2(0, size.y / 2),
      ]),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    time += dt;
    angle += dt;
    position.y = baseY + sin(time * 3) * 3;
  }

  @override
  void render(Canvas canvas) {

    final fillPaint = Paint()
      ..color = game.palette.diamond;

    final lightPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.45);

    final shadowPaint = Paint()
      ..color = game.palette.diamondShadow.withValues(alpha: .45);

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final diamond = Path()
      ..moveTo(size.x / 2, 0)
      ..lineTo(size.x, size.y / 2)
      ..lineTo(size.x / 2, size.y)
      ..lineTo(0, size.y / 2)
      ..close();
    
    canvas.drawPath(
      diamond,
      Paint()
        ..color = game.palette.diamond.withValues(alpha: .15)
        ..maskFilter = const MaskFilter.blur(
          BlurStyle.normal,
          10,
        ),
    );

    canvas.drawPath(diamond, fillPaint);

    final topFacet = Path()
      ..moveTo(size.x / 2, 0)
      ..lineTo(size.x, size.y / 2)
      ..lineTo(size.x / 2, size.y / 2)
      ..lineTo(0, size.y / 2)
      ..close();

    canvas.drawPath(topFacet, lightPaint);

    final bottomFacet = Path()
      ..moveTo(0, size.y / 2)
      ..lineTo(size.x / 2, size.y)
      ..lineTo(size.x, size.y / 2)
      ..lineTo(size.x / 2, size.y / 2)
      ..close();

    canvas.drawPath(bottomFacet, shadowPaint);

    canvas.drawLine(
      Offset(size.x / 2, 0),
      Offset(size.x / 2, size.y),
      borderPaint,
    );

    canvas.drawLine(
      Offset(0, size.y / 2),
      Offset(size.x, size.y / 2),
      borderPaint,
    );

    canvas.drawPath(diamond, borderPaint);

    canvas.drawCircle(
      Offset(size.x / 2, size.y / 2),
      2,
      Paint()..color = Colors.white,
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