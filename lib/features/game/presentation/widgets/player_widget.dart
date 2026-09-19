import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:geometry_dash/core/constants/game_palette.dart';
import 'package:geometry_dash/features/game/presentation/widgets/diamond_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_pad_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_ring_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/platform_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/speed_portal_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/spike_widget.dart';

class PlayerWidget extends PositionComponent with CollisionCallbacks {
  final GamePalette Function() palette;
  final VoidCallback? onSpikeCollision;
  final VoidCallback? onDiamondCollision;
  final VoidCallback? onSpeedPortalCollision;

  bool isDead = false;
  bool canUseJumpRing = false;
  double velocityY = 0;
  bool isJumping = false;
  double gravity = 2800;
  double previousY = 0;
  double previousX = 0;
  bool isOnPlatform = false;
  PlatformWidget? currentPlatform;
  JumpRingWidget? currentJumpRing;

  static const double jumpForce = -850;
  static const double jumpPadForce = -900;

  PlayerWidget({
    required this.palette,
    required Vector2 position,
    required double height,
    required this.onSpikeCollision,
    required this.onSpeedPortalCollision,
    required this.onDiamondCollision,
  }) : super(
    position: position,
    size: Vector2(30, height),
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isJumping) {
      angle += 12 * dt;
    }
  }

  @override
  void render(Canvas canvas) {
    if (isDead) {
      return;
    }

    final currentPalette = palette();
    final rect = Rect.fromLTWH(0, 0, size.x, size.y);
    final body = RRect.fromRectAndRadius(rect, const Radius.circular(4));
    final accent = Color.lerp(currentPalette.player, currentPalette.playerAccent, 0.28)!;

    canvas.drawRRect(
      body.inflate(3),
      Paint()
        ..color = currentPalette.playerAccent.withValues(alpha: 0.32)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    canvas.drawRRect(
      body,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            currentPalette.player,
            accent,
          ],
        ).createShader(rect),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(2, 2, size.x * 0.48, size.y * 0.3),
        const Radius.circular(2),
      ),
      Paint()..color = Colors.white.withValues(alpha: 0.28),
    );

    final face = Rect.fromLTWH(7, 7, size.x - 14, size.y - 14);
    canvas.drawRRect(
      RRect.fromRectAndRadius(face, const Radius.circular(2)),
      Paint()
        ..color = currentPalette.playerAccent.withValues(alpha: 0.28)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    final dotPaint = Paint()..color = currentPalette.playerAccent;
    const dotRadius = 1.6;
    const inset = 3.5;
    final dots = [
      Offset(face.left + inset, face.top + inset),
      Offset(face.right - inset, face.top + inset),
      Offset(face.left + inset, face.bottom - inset),
      Offset(face.right - inset, face.bottom - inset),
    ];
    for (final dot in dots) {
      canvas.drawCircle(dot, dotRadius, dotPaint);
    }

    canvas.drawRRect(
      body,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.black87,
    );
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {

    if (other is SpikeWidget) {
      onSpikeCollision?.call();
    }

    if (other is JumpPadWidget) {
      other.activate();

      currentPlatform = null;
      isOnPlatform = false;

      velocityY = jumpPadForce;
      isJumping = true;
    }

    if(other is JumpRingWidget){
      currentJumpRing = other;
      canUseJumpRing = true;
    }

    if(other is SpeedPortalWidget){
      if(!other.activated){
        other.activate();
        onSpeedPortalCollision?.call();
      }
    }

    if(other is DiamondWidget) {
      onDiamondCollision?.call();
    }

    super.onCollisionStart(
      intersectionPoints,
      other,
    );
  }

  void applyGravity(double dt) {
    previousX = position.x;
    previousY = position.y;
    if (currentPlatform != null) {
      final right = currentPlatform!.position.x + currentPlatform!.size.x;

      if (position.x >= right) {
        currentPlatform = null;
        isOnPlatform = false;
      } else {
        position.y = currentPlatform!.position.y - size.y;
        velocityY = 0;
        return;
      }
    }
    velocityY += gravity * dt;
    position.y += velocityY * dt;
  }

  void jump() {
    if (!isJumping) {
      currentPlatform = null;
      isOnPlatform = false;
      isJumping = true;
      velocityY = jumpForce;
    }
  }

  void jumpFromRing() {
    currentPlatform = null;
    isOnPlatform = false;
    currentJumpRing?.activate();
    currentJumpRing = null;
    canUseJumpRing = false;
    velocityY = -950;
    isJumping = true;
  }

  void die() {
    if (isDead) return;
    isDead = true;
  }

  void revive() {
    isDead = false;
  }

  void reset(double groundLevel) {
    position = Vector2(
      size.x * 0.10 + 50,
      groundLevel - size.y,
    );

    angle = 0;
    velocityY = 0;
    isJumping = false;
  }

  void landOnGround(double groundY) {
    position.y = groundY;
    velocityY = 0;
    isJumping = false;
    currentPlatform = null;
    isOnPlatform = false;
    angle = 0;
  }

}