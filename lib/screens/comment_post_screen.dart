import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/comment/comment_post_cubit.dart';
import 'package:gallery_app/logic/comment/comment_post_state.dart';
import 'package:gallery_app/logic/comment/comment_repository.dart';
import 'package:gallery_app/logic/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommentPostScreen extends StatefulWidget {
  CommentPostScreen({super.key});

  @override
  State<CommentPostScreen> createState() => _CommentPostScreenState();
}

class _CommentPostScreenState extends State<CommentPostScreen> {
  @override
  Widget build(BuildContext context) {
    final commentRepository = locator<CommentRepository>();
    final locale = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => CommentPostCubit(commentRepository),
      child: BlocBuilder<CommentPostCubit, CommentPostState>(
        builder: (context, state) {
          if (state is InitialCommentPostState) {
            return Text('temp text: main form');
          } else if (state is LoadingCommentPostState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SentCommentPostState) {
            return Text(
                'temp text: successfully added a comment (out of the form)');
          } else if (state is ErrorCommentPostState) {
            return Text('temp text: error message I guess');
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
