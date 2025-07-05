import 'package:flutter/material.dart';

final Color primaryColor = const Color(0xFF00B8A9); // Chirpley green
final Color secondaryColor = const Color(0xFF00F6ED); // Cyan accent
final Color backgroundColor = const Color(0xFF0D1B2A); // Deep navy
final Color glassColor = const Color(0x80FFFFFF); // Semi-transparent white
final Color accentColor = const Color(0xFF45B7C1); // Chirpley blue

final ThemeData futuristicTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
    background: backgroundColor,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white70,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 32,
      letterSpacing: 1.2,
      shadows: [
        Shadow(
          offset: const Offset(2, 2),
          blurRadius: 4,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: glassColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: accentColor.withOpacity(0.2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: accentColor),
    ),
    hintStyle: TextStyle(
      color: Colors.white38,
      fontSize: 16,
      shadows: [
        Shadow(
          offset: const Offset(1, 1),
          blurRadius: 2,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: accentColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
      elevation: 8,
      shadowColor: accentColor.withOpacity(0.3),
    ),
  ),
);
