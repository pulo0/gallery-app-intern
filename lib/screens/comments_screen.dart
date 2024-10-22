import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/comment_state.dart';
import 'package:gallery_app/logic/comment_cubit.dart';
import 'package:gallery_app/widgets/comments_list.dart';
import 'package:gallery_app/widgets/loading.dart';
import 'package:gallery_app/widgets/error.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentCubit()..fetchComments(),
      child: BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) {
          if (state is InitialCommentState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadingCommentState) {
            return Loading(commentState: state);
          } else if (state is LoadedCommentState) {
            return CommentsList(state.comments);
          } else if (state is ErrorCommentState) {
            return Error(commentState: state);
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
