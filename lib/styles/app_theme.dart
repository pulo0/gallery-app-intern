import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 133, 46, 233),
        brightness: Brightness.dark,
      );

ThemeData mainTheme() => ThemeData(
      colorScheme: colorScheme,
      textTheme: GoogleFonts.abelTextTheme().copyWith(
        titleLarge: GoogleFonts.abel(
          color: colorScheme.primary,
          fontSize: 26,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surfaceContainerLow,
      ),
    );
