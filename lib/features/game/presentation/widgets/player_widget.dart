import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:geometry_dash/features/game/presentation/widgets/diamond_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_pad_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/jum_ring_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/platform_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/speed_portal_widget.dart';
import 'package:geometry_dash/features/game/presentation/widgets/spike_widget.dart';

class PlayerWidget extends RectangleComponent with CollisionCallbacks {

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
    required Vector2 position,
    required double height,
    required Paint paint,
    required this.onSpikeCollision,
    required this.onSpeedPortalCollision,
    required this.onDiamondCollision,
  }) : super(
    position: position,
    size: Vector2(30, height),
    paint: paint,
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
    setOpacity(0);
  }

  void revive() {
    isDead = false;
    setOpacity(1);
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