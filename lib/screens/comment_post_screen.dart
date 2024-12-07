import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/widgets/error.dart';
import 'package:gallery_app/widgets/form_comment.dart';
import 'package:gallery_app/widgets/loading.dart';
import 'package:gallery_app/logic/comment/comment_post_cubit.dart';
import 'package:gallery_app/logic/comment/comment_post_state.dart';
import 'package:gallery_app/logic/comment/comment_repository.dart';
import 'package:gallery_app/logic/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/widgets/sent_message.dart';

class CommentPostScreen extends StatelessWidget {
  const CommentPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final commentRepository = locator<CommentRepository>();
    final locale = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => CommentPostCubit(commentRepository),
      child: BlocBuilder<CommentPostCubit, CommentPostState>(
        builder: (context, state) {
          if (state is InitialCommentPostState) {
            return FormComment();
          } else if (state is LoadingCommentPostState) {
            return Loading(commentPostState: state);
          } else if (state is SentCommentPostState) {
            return SentMessage();
          } else if (state is ErrorCommentPostState) {
            return Error(commentPostState: state);
          } else {
            return Center(
              child: Text(
                locale.wrongState,
              ),
            );
          }
        },
      ),
    );
  }
}
