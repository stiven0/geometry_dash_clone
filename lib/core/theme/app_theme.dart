import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color(0xFF077187),
    scaffoldBackgroundColor: const Color(0xFF0D0D0D),
    fontFamily: 'Orbitron',
  );

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: const Color(0xFF077187),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    fontFamily: 'Orbitron',
  );
}