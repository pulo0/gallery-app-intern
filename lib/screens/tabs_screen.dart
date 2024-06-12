import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/screens/album_screen.dart';
import 'package:gallery_app/screens/comments_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

final TextTheme textTheme = mainTheme.textTheme;

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  String _currentPageName = '';
  Widget _activeContent = Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'TODO: A list of thumbnails, don\'t worry...',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
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
        _activeContent = const CommentsScreen();
        break;
      default:
        _currentPageName = 'Album';
        _activeContent = const AlbumScreen();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageName),
        elevation: 1,
      ),
      body: _activeContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: setPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_library_rounded),
              label: 'Album',
              tooltip: 'Display album of photos'),
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
