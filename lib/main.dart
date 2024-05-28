import 'package:flutter/material.dart';
import 'package:gallery_app/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final mainColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 133, 46, 233),
  brightness: Brightness.dark,
);

final mainTheme = ThemeData(
  colorScheme: mainColorScheme,
  textTheme: GoogleFonts.abelTextTheme(),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: mainColorScheme.surfaceContainerLow,
  ),
);

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallerify',
      theme: mainTheme,
      home: const TabsScreen(),
    );
  }
}
