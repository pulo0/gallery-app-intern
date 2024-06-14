import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/screens/tabs_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallerify',
      theme: mainTheme(),
      home: const TabsScreen(),
    );
  }
}
