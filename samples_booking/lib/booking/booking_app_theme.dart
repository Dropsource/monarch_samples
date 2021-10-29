import 'package:flutter/material.dart';
import 'package:monarch_annotations/monarch_annotations.dart';

@MonarchTheme('Booking Light Theme')
var bookingLightTheme = BookingAppTheme.buildLightTheme();

@MonarchTheme('Booking Dark Theme')
var bookingDarkTheme = BookingAppTheme.buildDarkTheme();


const monarchPrimaryColor = Color(0xff00b3b8);
const monarchAccentColor = Color(0xff00c5ca);

// const primaryColor = Color(0xFF54D3C2);
const primaryColor = monarchPrimaryColor;

class BookingAppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      headline1: base.headline1?.copyWith(fontFamily: fontName),
      headline2: base.headline2?.copyWith(fontFamily: fontName),
      headline3: base.headline3?.copyWith(fontFamily: fontName),
      headline4: base.headline4?.copyWith(fontFamily: fontName),
      headline5: base.headline5?.copyWith(fontFamily: fontName),
      headline6: base.headline6?.copyWith(fontFamily: fontName),
      button: base.button?.copyWith(fontFamily: fontName),
      caption: base.caption?.copyWith(fontFamily: fontName),
      bodyText1: base.bodyText1?.copyWith(fontFamily: fontName),
      bodyText2: base.bodyText2?.copyWith(fontFamily: fontName),
      subtitle1: base.subtitle1?.copyWith(fontFamily: fontName),
      subtitle2: base.subtitle2?.copyWith(fontFamily: fontName),
      overline: base.overline?.copyWith(fontFamily: fontName),
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
