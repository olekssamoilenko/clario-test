import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  const ApplicationTheme();

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        fontFamily: GoogleFonts.inter().fontFamily,
        inputDecorationTheme: inputDecorationTheme(colorScheme),
        elevatedButtonTheme: elevatedButtonTheme(colorScheme),
        textTheme: textTheme(colorScheme),
      );

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF151D51),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF6F91BC),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFFF8080),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF4A4E71),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.primary.withOpacity(0.1);
        }
        return colorScheme.surface;
      }),
      errorStyle: TextStyle(
        color: colorScheme.error,
        fontSize: 13,
      ),
      hintStyle: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 16,
      ),
      floatingLabelStyle: TextStyle(
        color: colorScheme.secondary,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: colorScheme.outline, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.2), width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
    );
  }

  ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 90.5, vertical: 17),
        elevation: 0,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      ),
    );
  }

  TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      titleLarge: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: colorScheme.onSurface,
      ),
      bodyLarge: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 13,
        color: colorScheme.onSurface,
      ),
    );
  }
}
