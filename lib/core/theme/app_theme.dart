import 'package:flutter/material.dart';

class AppTheme {
  static const _defaultSeedColor = Colors.indigo;

  static ThemeData light({Color seedColor = _defaultSeedColor}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData dark({Color seedColor = _defaultSeedColor}) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
    );
  }

  static const Map<String, Color> colorThemes = {
    'indigo': Colors.indigo,
    'blue': Colors.blue,
    'teal': Colors.teal,
    'green': Colors.green,
    'orange': Colors.orange,
    'pink': Colors.pink,
    'purple': Colors.purple,
  };
}
