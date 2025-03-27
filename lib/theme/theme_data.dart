import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: GoogleFonts.getTextTheme("Atkinson Hyperlegible"),
);

final darkTheme = ThemeData.dark().copyWith(
  textTheme: GoogleFonts.getTextTheme("Atkinson Hyperlegible"),
);
