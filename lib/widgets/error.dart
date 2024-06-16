import 'package:flutter/material.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/logic/album_cubit.dart';
import 'package:gallery_app/logic/comment_cubit.dart';
import 'package:gallery_app/logic/album_state.dart';
import 'package:gallery_app/logic/comment_state.dart';

class Error extends StatelessWidget {
  const Error({
    super.key,
    this.albumState,
    this.commentState,
  });

  final AlbumState? albumState;
  final CommentState? commentState;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outline_rounded,
            size: 50,
            color: colorScheme.error,
          ),
          const SizedBox(height: 10),
          Text(
            albumState != null
                ? albumState!.errorMessage
                : commentState!.errorMessage,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => albumState != null
                ? AlbumCubit().fetchAlbums()
                : CommentCubit().fetchComments(),
            child: Text(
              'Retry',
              style: textTheme.labelMedium!.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
