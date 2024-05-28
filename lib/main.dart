import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final mainTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 133, 46, 233),
  ),
  textTheme: GoogleFonts.abelTextTheme(),
);

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallerify',
      theme: mainTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('A tab bar'),
        ),
      ),
    );
  }
}
