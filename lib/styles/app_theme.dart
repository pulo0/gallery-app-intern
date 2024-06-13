import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mainTheme() => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 133, 46, 233),
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.abelTextTheme().copyWith(
        titleLarge: GoogleFonts.abel(
          color: mainTheme().colorScheme.primary,
          fontSize: 26,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: mainTheme().colorScheme.surfaceContainerLow,
      ),
    );