import 'package:flutter/material.dart';

/// DarkTheme class
final class CustomDarkTheme {
  CustomDarkTheme._();

  /// App's main dark themedata
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF1c2125),
      surface: Color(0xFF272c30),
    ),
  );
}
