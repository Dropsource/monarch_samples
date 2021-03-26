import 'package:flutter/material.dart';
import 'package:monarch_annotations/monarch_annotations.dart';

const Color teal = Color(0xFF00CFD4);
const Color darkTeal = Color(0xFF00B7BA);

const Color orange = Color(0xFFFE9609);

const Color lightGrey = Color(0xFFEFF2F5);
const Color secondaryGrey = Color(0xFF9FA7B0);
const Color darkGrey = Color(0xFFA7B0C3);

const Color lightTeal = Color(0xFFEFF2F5);

const Color black = Color(0xFF1F1F1F);
const Color blackSemiTransparent = Color(0xAA1F1F1F);
const Color dark = Color(0xff313131);
const Color lightBlack = Color(0xff4A4A4A);

const Color secondaryTabColor = Color(0xFFEFF2F5);
const Color secondaryTabLabelColor = Color(0xFFCACACA);

const Color red = Color(0xFFEB3520);

const Color green = Color(0xFFA0C360);
const Color successColor = Color(0xFF76C043);
const Color failureColor = Color((0xFFEB3520));

const Color inputBorderColor = Color(0xFFCACACA);
const Color inputHintColor = Color(0xFFCACACA);

const Color gray = Color(0xFFCACACA);
const BorderRadius inputBorderRadius = BorderRadius.all(Radius.circular(30.0));

const settingsBackground = Color(0xFF00B7BA);

const tertiary = Color(0xFF76C043);
const tertiaryFaded = Color(0xFFBADFA0);

@MonarchTheme('Custom Theme', isDefault: false)
final ThemeData theme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: teal,
  accentColor: darkTeal,
  splashColor: Colors.transparent,
  errorColor: red,
  buttonColor: orange,
  scaffoldBackgroundColor: Colors.white,
  cardTheme: CardTheme(
    shadowColor: Color(0x3300001A),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: lightGrey,
  ),
  textTheme: TextTheme(
    headline5: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 24.0,
      color: black,
      fontWeight: FontWeight.w600,
    ),
    headline6: TextStyle(
      fontFamily: 'OpenSans',
      color: black,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
    bodyText1: TextStyle(
      fontFamily: 'OpenSans',
      color: secondaryGrey,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    subtitle2: TextStyle(
      fontFamily: 'OpenSans',
      color: black,
      fontWeight: FontWeight.w500,
      fontSize: 15,
    ),
    caption: TextStyle(
      fontFamily: 'OpenSans',
      color: black,
      fontWeight: FontWeight.w500,
      fontSize: 9,
    ),
    overline: TextStyle(
      fontFamily: 'OpenSans',
      color: black,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    button: TextStyle(
      fontFamily: 'OpenSans',
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomAppBarColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 1.5,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: black),
  ),
);
