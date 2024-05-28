import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  int _currentIndex = 0;
  String _currentPageName = '';
  final Widget _activeContent = Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'TODO: A list of thumbnails, don\'t worry...',
            textAlign: TextAlign.center,
            style: mainTheme.textTheme.titleLarge!.copyWith(
              color: mainColorScheme.primary,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 16),
          const CircularProgressIndicator(),
        ],
      ),
    ),
  );

  void setPage(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentIndex) {
      case 1:
        _currentPageName = 'Comments';
        break;
      default:
        _currentPageName = 'Album';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageName),
        elevation: 2,
      ),
      body: _activeContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: setPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library_rounded),
            label: 'Album',
            tooltip: 'Display album of photos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Comments',
            tooltip: 'Comment Section of photos',
          ),
        ],
      ),
    );
  }
}
