import 'package:flutter/material.dart';
import 'package:monarch_annotations/monarch_annotations.dart';

@MonarchTheme('Booking Light')
ThemeData get bookingLightTheme => BookingAppTheme.buildLightTheme();

@MonarchTheme('Booking Dark')
ThemeData get bookingDarkTheme => BookingAppTheme.buildDarkTheme();


const monarchPrimaryColor = Color(0xff00b3b8);
const monarchAccentColor = Color(0xff00c5ca);

// const primaryColor = Color(0xFF54D3C2);
const primaryColor = monarchPrimaryColor;

class BookingAppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      headlineLarge: base.headlineLarge?.copyWith(fontFamily: fontName),
      headlineMedium: base.headlineMedium?.copyWith(fontFamily: fontName),
      headlineSmall: base.headlineSmall?.copyWith(fontFamily: fontName),
      labelMedium: base.labelMedium?.copyWith(fontFamily: fontName),
      bodyLarge: base.bodyLarge?.copyWith(fontFamily: fontName),
      bodyMedium: base.bodyMedium?.copyWith(fontFamily: fontName),
      titleLarge: base.titleLarge?.copyWith(fontFamily: fontName),
      titleMedium: base.titleMedium?.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData buildLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
    );
    final ThemeData base = ThemeData.light();
    return _buildTheme(colorScheme, base, Colors.grey);
  }

  static ThemeData buildDarkTheme() { 
    final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
      primary: primaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return _buildTheme(colorScheme, base, Colors.black);
  }

  static ThemeData _buildTheme(ColorScheme colorScheme, ThemeData base, Color shadowColor) {
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      shadowColor: shadowColor,
      splashFactory: InkRipple.splashFactory,
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}
