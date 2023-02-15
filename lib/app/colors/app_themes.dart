import 'package:ecommerce/app/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppTheme.lightColorScheme,
    textTheme: GoogleFonts.quicksandTextTheme(Typography.blackCupertino),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppTheme.darkColorScheme,
    textTheme: GoogleFonts.quicksandTextTheme(Typography.whiteCupertino),
  );

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0B5CB9),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD7E2FF),
    onPrimaryContainer: Color(0xFF001B3F),
    secondary: Color(0xFF295EA7),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD6E3FF),
    onSecondaryContainer: Color(0xFF001B3E),
    tertiary: Color(0xFF0B5CB9),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFD7E2FF),
    onTertiaryContainer: Color(0xFF001B3F),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFDFBFF),
    onBackground: Color(0xFF1A1B1F),
    surface: Color(0xFFFDFBFF),
    onSurface: Color(0xFF1A1B1F),
    surfaceVariant: Color(0xFFE0E2EC),
    onSurfaceVariant: Color(0xFF44474E),
    outline: Color(0xFF74777F),
    onInverseSurface: Color(0xFFF2F0F4),
    inverseSurface: Color(0xFF2F3033),
    inversePrimary: Color(0xFFABC7FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF0B5CB9),
    outlineVariant: Color(0xFFC4C6D0),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFABC7FF),
    onPrimary: Color(0xFF002F66),
    primaryContainer: Color(0xFF004590),
    onPrimaryContainer: Color(0xFFD7E2FF),
    secondary: Color(0xFFAAC7FF),
    onSecondary: Color(0xFF003064),
    secondaryContainer: Color(0xFF00468C),
    onSecondaryContainer: Color(0xFFD6E3FF),
    tertiary: Color(0xFFABC7FF),
    onTertiary: Color(0xFF002F66),
    tertiaryContainer: Color(0xFF004590),
    onTertiaryContainer: Color(0xFFD7E2FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1B1F),
    onBackground: Color(0xFFE3E2E6),
    surface: Color(0xFF1A1B1F),
    onSurface: Color(0xFFE3E2E6),
    surfaceVariant: Color(0xFF44474E),
    onSurfaceVariant: Color(0xFFC4C6D0),
    outline: Color(0xFF8E9099),
    onInverseSurface: Color(0xFF1A1B1F),
    inverseSurface: Color(0xFFE3E2E6),
    inversePrimary: Color(0xFF0B5CB9),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFABC7FF),
    outlineVariant: Color(0xFF44474E),
    scrim: Color(0xFF000000),
  );
}
