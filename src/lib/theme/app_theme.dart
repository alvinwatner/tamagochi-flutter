import 'package:flutter/material.dart';
import 'package:tamagotchi_stev/theme/custom_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: CustomColors.primarySwatch,
      scaffoldBackgroundColor: CustomColors.background,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: CustomColors.primarySwatch,
        backgroundColor: CustomColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.cardBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: CustomColors.textPrimary),
        titleTextStyle: TextStyle(
          color: CustomColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        color: CustomColors.cardBackground,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: CustomColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: CustomColors.textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: CustomColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: CustomColors.textPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: CustomColors.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}
