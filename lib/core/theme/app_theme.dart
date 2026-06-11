import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFFD3A117);
  static const bgCream = Color(0xFFFAF7F2);
  static const navy = Color(0xFF1A3C6E);
  static const white = Color(0xFFFFFFFF);
  static const muted = Color(0xFF7C8B9D);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bgCream,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.white,
        onSurface: AppColors.navy,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
        displayLarge: GoogleFonts.dmSerifDisplay(color: AppColors.navy),
        displayMedium: GoogleFonts.dmSerifDisplay(color: AppColors.navy),
        displaySmall: GoogleFonts.dmSerifDisplay(color: AppColors.navy),
        headlineLarge: GoogleFonts.dmSerifDisplay(color: AppColors.navy),
        headlineMedium: GoogleFonts.dmSerifDisplay(color: AppColors.navy),
        headlineSmall: GoogleFonts.dmSerifDisplay(color: AppColors.navy),
        titleLarge: GoogleFonts.dmSerifDisplay(color: AppColors.navy),
        titleMedium: GoogleFonts.plusJakartaSans(color: AppColors.navy),
        titleSmall: GoogleFonts.plusJakartaSans(color: AppColors.navy),
      ),
    );
  }
}
