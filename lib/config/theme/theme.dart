import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sophis/config/theme/color_schemes.g.dart';
import 'package:sophis/config/theme/dark_scheme.g.dart';

final lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: GoogleFonts.poppinsTextTheme(),
);

final darkTheme = ThemeData(
  colorScheme: darkScheme,
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: GoogleFonts.poppinsTextTheme(),
);
