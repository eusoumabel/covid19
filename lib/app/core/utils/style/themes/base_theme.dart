import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

ThemeData baseTheme = ThemeData(
  primaryColor: primaryColor,
  primaryColorLight: primaryColorLight,
  primaryColorDark: primaryColorDark,
  accentColor: accentColor,
  splashColor: splashColor,
  disabledColor: disabledColor,
  dividerColor: dividerColor,
  errorColor: errorColor,
  backgroundColor: primaryColorDark,
  scaffoldBackgroundColor: backgroundColor,

  /// Sub themes
  textTheme: _textTheme,
  iconTheme: _iconTheme,
  inputDecorationTheme: _inputDecoration,
  dividerTheme: _dividerTheme,
);

TextTheme _textTheme = TextTheme(
  headline2: GoogleFonts.poppins(
    color: primaryTextColor,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.poppins(
    color: primaryTextColor,
    fontWeight: FontWeight.w400,
  ),
  headline5: GoogleFonts.poppins(
    color: primaryTextColor,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.poppins(
    color: primaryTextColor,
    fontWeight: FontWeight.w400,
  ),
  subtitle1: GoogleFonts.poppins(
    color: primaryTextColor,
    fontWeight: FontWeight.w200,
  ),
  bodyText1: GoogleFonts.poppins(
    color: primaryTextColor,
    fontWeight: FontWeight.w200,
  ),
  bodyText2: GoogleFonts.poppins(
    color: primaryTextColor,
    fontWeight: FontWeight.w200,
  ),
  button: GoogleFonts.poppins(
    color: primaryTextColor.withOpacity(0.8),
    fontWeight: FontWeight.bold,
  ),
);

IconThemeData _iconTheme = IconThemeData(
  color: accentColor,
  size: 25,
);

InputDecorationTheme _inputDecoration = InputDecorationTheme(
  hintStyle: GoogleFonts.raleway(
    color: primaryTextColor,
    fontWeight: FontWeight.w500,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColorLight,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: accentColor,
    ),
  ),
);

DividerThemeData _dividerTheme = DividerThemeData(
  color: dividerColor,
  indent: 30,
  endIndent: 30,
);
