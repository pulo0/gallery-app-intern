import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/utils/toast.dart';
import 'package:gallery_app/presentation/comment_post/widgets/form_comment.dart';
import 'package:gallery_app/presentation/universal_widgets/loading.dart';
import 'package:gallery_app/presentation/universal_widgets/error.dart';
import 'package:gallery_app/presentation/comment_post/cubit/comment_post_cubit.dart';
import 'package:gallery_app/presentation/comment_post/cubit/comment_post_state.dart';
import 'package:gallery_app/domain/repositories/comment_repository.dart';
import 'package:gallery_app/data/network/service/service_locator.dart';

class CommentPostScreen extends StatelessWidget {
  const CommentPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final commentRepository = locator<CommentRepository>();
    final locale = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) => CommentPostCubit(commentRepository),
      child: BlocConsumer<CommentPostCubit, CommentPostState>(
        listener: (context, state) {
          if (state is SentCommentPostState) {
            // Vanilla option without pub package
            // (with fluttertoast package)

            /*
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: colorScheme.surface,
                      ),
                      SizedBox(width: 6.0),
                      Text(locale.successTxt),
                    ],
                  ),
                ),
              );
              */
            showToast(locale.successTxt);
          }
        },
        builder: (context, state) {
          return switch (state) {
            InitialCommentPostState() => FormComment(),
            LoadingCommentPostState() => Loading(commentPostState: state),
            ErrorCommentPostState() => Error(commentPostState: state),
            SentCommentPostState() => FormComment(),
          };
        },
      ),
    );
  }
}
