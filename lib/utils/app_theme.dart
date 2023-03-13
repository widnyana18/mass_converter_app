import 'package:flutter/material.dart';

final _theme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFE7862B),
  // hoverColor: Color(0xFFFFC895),
  useMaterial3: true,
  fontFamily: 'Poppins',
  // primarySwatch: Colors.orange,
);

class AppTheme {
  static TextTheme txtTheme = _theme.textTheme.copyWith(
    bodyMedium: _theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
    bodySmall: _theme.textTheme.bodySmall?.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: _theme.textTheme.titleLarge?.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.normal,
    ),
    titleMedium: _theme.textTheme.titleMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: _theme.textTheme.titleSmall?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: _theme.textTheme.headlineMedium?.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.normal,
    ),
    headlineSmall: _theme.textTheme.headlineSmall?.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.normal,
    ),
  );

  static ThemeData light = _theme.copyWith(
    textTheme: txtTheme,
    canvasColor: Color(0xFFECECEC),
    backgroundColor: const Color(0XFFf7f7f7),
    scaffoldBackgroundColor: const Color(0XFFf7f7f7),
    iconTheme: IconThemeData(color: Colors.black),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.black,
        onSurface: Color(0xFFA7A7A7),
        textStyle: txtTheme.headlineMedium,
      ),
    ),
  );
}
