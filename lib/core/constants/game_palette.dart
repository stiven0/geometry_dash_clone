import 'package:flutter/material.dart';

class GamePalette {
  final List<Color> backgroundGradient;
  final Color ground;
  final Color platformTop;
  final Color platformBody;
  final List<Color> spikeGradient;
  final Color spikeGlow;
  final Color diamond;
  final Color diamondShadow;
  final Color portal;
  final Color trail;
  final List<Color> jumpPadGradient;
  final Color jumpPadGlow;
  final Color jumpRing;
  final Color jumpRingInner;
  final Color jumpRingGlow;
  final Color player;
  final Color playerAccent;

  const GamePalette({
    required this.backgroundGradient,
    required this.ground,
    required this.platformTop,
    required this.platformBody,
    required this.spikeGradient,
    required this.spikeGlow,
    required this.diamond,
    required this.diamondShadow,
    required this.portal,
    required this.trail,
    required this.jumpPadGradient,
    required this.jumpPadGlow,
    required this.jumpRing,
    required this.jumpRingInner,
    required this.jumpRingGlow,
    required this.player,
    required this.playerAccent,
  });

}