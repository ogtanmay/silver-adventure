import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark({bool amoldBoost = false}) {
    const baseSurface = Color(0xFF0B0B0F);
    final bg = amoldBoost ? Colors.black : baseSurface;

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF9FB5FF),
        brightness: Brightness.dark,
        surface: bg,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.2),
        titleMedium: TextStyle(fontWeight: FontWeight.w600),
      ),
      useMaterial3: true,
    );
  }
}
