import 'package:flutter/material.dart';
import 'game_palette.dart';

class Palettes {

  static const classic = GamePalette(
    backgroundGradient: [
      Color(0xFF16213E),
      Color(0xFF2A5F96),
      Color(0xFF53A7E8),
    ],
    ground: Color(0xff4CAF50),
    platformTop: Colors.cyanAccent,
    platformBody: Color(0xff3B3B3B),
    spikeGradient: [
      Color(0xff7DF9FF),
      Color(0xff00B8FF),
    ],
    spikeGlow: Color(0x147DF9FF),
    diamond: Colors.cyanAccent,
    diamondShadow: Colors.blueAccent,
    shield: Color(0xFF5CDBFF),
    shieldGlow: Color(0x335CDBFF),
    portal: Colors.cyanAccent,
    trail: Colors.white,
    jumpPadGradient: [
      Color(0xFF76AFFF),
      Color(0xFF0022FF),
    ],
    jumpPadGlow: Color(0x330022FF),
    jumpRing: Colors.yellow,
    jumpRingInner: Colors.orange,
    jumpRingGlow: Color(0x33FFFF00),
    player: Color(0xFFF4F7FB),
    playerAccent: Colors.cyanAccent,
  );

  static const lava = GamePalette(
    backgroundGradient: [
      Color(0xFF1A0000),
      Color(0xFF5C1408),
      Color(0xFFB33B17),
    ],
    ground: Color(0xFF7A1E10),
    platformTop: Colors.deepOrange,
    platformBody: Color(0xff5A2D2D),
    spikeGradient: [
      Colors.deepOrangeAccent,
      Colors.redAccent,
    ],
    spikeGlow: Color(0x14FF5722),
    diamond: Colors.amberAccent,
    diamondShadow: Colors.deepOrange,
    shield: Color(0xFFFFB347),
    shieldGlow: Color(0x33FFB347),
    portal: Colors.redAccent,
    trail: Colors.orange,
    jumpPadGradient: [
      Color(0xFFFFB347),
      Color(0xFFFF4500),
    ],
    jumpPadGlow: Color(0x33FF4500),
    jumpRing: Colors.orangeAccent,
    jumpRingInner: Colors.deepOrange,
    jumpRingGlow: Color(0x33FF8C00),
    player: Color(0xFFFFF3E8),
    playerAccent: Colors.deepOrangeAccent,
  );

  static const neon = GamePalette(
    backgroundGradient: [
      Color(0xFF0B0620),
    Color(0xFF2A1465),
    Color(0xFF6633CC),
    ],
    ground: Color(0xff101010),
    platformTop: Colors.pinkAccent,
    platformBody: Color(0xff2B2B2B),
    spikeGradient: [
      Colors.pinkAccent,
      Colors.purpleAccent,
    ],
    spikeGlow: Color(0x14FF4081),
    diamond: Colors.greenAccent,
    diamondShadow: Colors.purple,
    shield: Color(0xFFE040FB),
    shieldGlow: Color(0x33E040FB),
    portal: Colors.purpleAccent,
    trail: Colors.cyanAccent,
    jumpPadGradient: [
      Colors.cyanAccent,
      Colors.purpleAccent,
    ],
    jumpPadGlow: Color(0x3300FFFF),
    jumpRing: Colors.pinkAccent,
    jumpRingInner: Colors.purpleAccent,
    jumpRingGlow: Color(0x33FF4081),
    player: Color(0xFFF7F2FF),
    playerAccent: Colors.pinkAccent,
  );

  static const ice = GamePalette(
    backgroundGradient: [
      Color(0xFF0B1A33),
      Color(0xFF1A3D66),
      Color(0xFF4D94FF),
    ],
    ground: Color(0xFF4A90C2),
    platformTop: Colors.lightBlueAccent,
    platformBody: Color(0xFF5E7FA6),
    spikeGradient: [
      Colors.lightBlueAccent,
      Colors.blueAccent,
    ],
    spikeGlow: Color(0x1400BFFF),
    diamond: Colors.white,
    diamondShadow: Colors.lightBlueAccent,
    shield: Color(0xFF90CAF9),
    shieldGlow: Color(0x3390CAF9),
    portal: Colors.blueAccent,
    trail: Colors.lightBlueAccent,
    jumpPadGradient: [
      Colors.white,
      Colors.lightBlueAccent,
    ],
    jumpPadGlow: Color(0x3300BFFF),
    jumpRing: Colors.cyanAccent,
    jumpRingInner: Colors.blueAccent,
    jumpRingGlow: Color(0x3300FFFF),
    player: Color(0xFFF2F8FF),
    playerAccent: Colors.lightBlueAccent,
  );

  static const forest = GamePalette(
    backgroundGradient: [
      Color(0xFF0B1A0B),
      Color(0xFF1A3D1A),
      Color(0xFF4D944D),
    ],
    ground: Color(0xFF2E7D32),
    platformTop: Colors.greenAccent,
    platformBody: Color(0xFF4A3822),
    spikeGradient: [
      Colors.greenAccent,
      Colors.lightGreenAccent,
    ],
    spikeGlow: Color(0x1400FF00),
    diamond: Colors.yellowAccent,
    diamondShadow: Colors.green,
    shield: Color(0xFF69F0AE),
    shieldGlow: Color(0x3369F0AE),
    portal: Colors.greenAccent,
    trail: Colors.lightGreenAccent,
    jumpPadGradient: [
      Colors.lightGreenAccent,
      Colors.green,
    ],
    jumpPadGlow: Color(0x3300FF00),
    jumpRing: Colors.yellowAccent,
    jumpRingInner: Colors.greenAccent,
    jumpRingGlow: Color(0x33ADFF2F),
    player: Color(0xFFF3FFEF),
    playerAccent: Colors.greenAccent,
  );

  static const space = GamePalette(
    backgroundGradient: [
      Color(0xFF00000B),
      Color(0xFF000033),
      Color(0xFF000066),
    ],
    ground: Color(0xFF111122),
    platformTop: Colors.deepPurpleAccent,
    platformBody: Color(0xFF1B1B35),
    spikeGradient: [
      Colors.deepPurpleAccent,
      Colors.purpleAccent,
    ],
    spikeGlow: Color(0x140D47A1),
    diamond: Colors.cyanAccent,
    diamondShadow: Colors.deepPurpleAccent,
    shield: Color(0xFFB388FF),
    shieldGlow: Color(0x33B388FF),
    portal: Colors.deepPurpleAccent,
    trail: Colors.purpleAccent,
    jumpPadGradient: [
      Colors.deepPurpleAccent,
      Colors.indigoAccent,
    ],
    jumpPadGlow: Color(0x334B0082),
    jumpRing: Colors.cyanAccent,
    jumpRingInner: Colors.deepPurpleAccent,
    jumpRingGlow: Color(0x3300FFFF),
    player: Color(0xFFF4F0FF),
    playerAccent: Colors.deepPurpleAccent,
  );

  static const desert = GamePalette(
    backgroundGradient: [
      Color(0xFF331A00),
      Color(0xFF663300),
      Color(0xFFCC6600),
    ],
    ground: Color(0xFFC2A46D),
    platformTop: Colors.orangeAccent,
    platformBody: Color(0xFFA1887F),
    spikeGradient: [
      Colors.orangeAccent,
      Colors.deepOrangeAccent,
    ],
    spikeGlow: Color(0x14FF8C00),
    diamond: Colors.yellowAccent,
    diamondShadow: Colors.orangeAccent,
    shield: Color(0xFFFFD54F),
    shieldGlow: Color(0x33FFD54F),
    portal: Colors.orangeAccent,
    trail: Colors.deepOrangeAccent,
    jumpPadGradient: [
      Colors.orangeAccent,
      Colors.deepOrange,
    ],
    jumpPadGlow: Color(0x33FF8C00),
    jumpRing: Colors.amberAccent,
    jumpRingInner: Colors.orange,
    jumpRingGlow: Color(0x33FFD54F),
    player: Color(0xFFFFF6E8),
    playerAccent: Colors.orangeAccent,
  );

}