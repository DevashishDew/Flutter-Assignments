import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
    titleLarge: TextStyle(
        color: Colors.black, fontSize: 36, fontWeight: FontWeight.w700),
    displayLarge: TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: Colors.grey,
        decorationThickness: .5,
        color: Colors.transparent,
        shadows: [
          Shadow(
              offset: Offset(0, -20), color: Color.fromARGB(255, 102, 103, 171))
        ],
        fontSize: 72,
        fontWeight: FontWeight.w400),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, background:
  Colors.white, tertiaryContainer: Colors.black26),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
    titleLarge: TextStyle(
        color: Colors.white, fontSize: 36, fontWeight: FontWeight.w700),
    displayLarge: TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: Colors.grey,
        decorationThickness: .5,
        color: Colors.transparent,
        shadows: [
          Shadow(
              offset: Offset(0, -20), color: Color.fromARGB(255, 102, 103, 171))
        ],
        fontSize: 72,
        fontWeight: FontWeight.w400),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, background: Colors
      .white, tertiaryContainer: Colors.black54)
      .copyWith(brightness: Brightness.dark),
);
