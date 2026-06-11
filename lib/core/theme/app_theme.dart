import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2E5BFF), // A nice vibrant blue
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.interTextTheme(),
    );
  }
}
