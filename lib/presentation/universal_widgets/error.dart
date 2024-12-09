import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/presentation/comment_post/cubit/comment_post_cubit.dart';
import 'package:gallery_app/presentation/comment_post/cubit/comment_post_state.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/data/network/service/service_locator.dart';
import 'package:gallery_app/presentation/album/cubit/album_cubit.dart';
import 'package:gallery_app/presentation/album/cubit/album_state.dart';
import 'package:gallery_app/presentation/comment/cubit/comment_cubit.dart';
import 'package:gallery_app/presentation/comment/cubit/comment_state.dart';
import 'package:gallery_app/domain/repositories/album_repository.dart';
import 'package:gallery_app/domain/repositories/comment_repository.dart';

class Error extends StatelessWidget {
  const Error({
    super.key,
    this.albumState,
    this.commentState,
    this.commentPostState,
  });

  final AlbumState? albumState;
  final CommentState? commentState;
  final CommentPostState? commentPostState;

  @override
  Widget build(BuildContext context) {
    final albumRepository = locator<AlbumRepository>();
    final commentRepository = locator<CommentRepository>();

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
                : commentState is ErrorCommentState
                    ? (commentState as ErrorCommentState).errorMessage
                    : (commentPostState as ErrorCommentPostState).errorMessage,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => albumState != null
                ? AlbumCubit(albumRepository).fetchAlbums()
                : commentState != null
                    ? CommentCubit(commentRepository).fetchComments()
                    : CommentPostCubit(commentRepository).restartToForm(),
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
