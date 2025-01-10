import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/presentation/album/album_screen.dart';
import 'package:gallery_app/presentation/comment/comments_screen.dart';
import 'package:gallery_app/presentation/comment_post/comment_post_screen.dart';

final TextTheme textTheme = mainTheme().textTheme;

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

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
            'current page (this text wont be visible)',
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
    final locale = AppLocalizations.of(context);

    switch (_currentIndex) {
      case 1:
        _currentPageName = locale.commentsLabel;
        _activeContent = const CommentsScreen();
        break;
      case 2:
        _currentPageName = locale.commentPostLabel;
        _activeContent = const CommentPostScreen();
      default:
        _currentPageName = locale.albumLabel;
        _activeContent = const AlbumScreen();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageName),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        elevation: 1,
      ),
      body: _activeContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: setPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.photo_library_rounded),
            label: locale.albumLabel,
            tooltip: locale.albumTooltip,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.comment),
            label: locale.commentsLabel,
            tooltip: locale.commentsTooltip,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_comment),
            label: locale.commentPostLabel,
            tooltip: locale.commentPostTooltip,
          )
        ],
      ),
    );
  }
}
