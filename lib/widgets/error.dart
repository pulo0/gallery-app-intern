import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/logic/data_album_repository.dart';
import 'package:gallery_app/logic/service_locator.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/logic/album_cubit.dart';
import 'package:gallery_app/logic/comment_cubit.dart';
import 'package:gallery_app/logic/album_state.dart';
import 'package:gallery_app/logic/comment_state.dart';
import 'package:gallery_app/logic/comment_repository.dart';

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
    final dataAlbumRepository = locator<DataAlbumRepository>();
    final CommentRepository commentRepository = CommentRepository();

    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;
    final locale = AppLocalizations.of(context);
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
            albumState is ErrorAlbumState
                ? (albumState as ErrorAlbumState).errorMessage
                : (commentState as ErrorCommentState).errorMessage,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => albumState != null
                ? AlbumCubit(dataAlbumRepository).fetchAlbums()
                : CommentCubit(commentRepository).fetchComments(),
            child: Text(
              locale.retry,
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
