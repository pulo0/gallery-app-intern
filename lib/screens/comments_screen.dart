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
          switch (state.status) {
            case CommentStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case CommentStatus.loading:
              return Loading(
                commentState: state,
                () => CommentCubit().fetchComments(),
              );
            case CommentStatus.finished:
              return CommentsList(state.comments);
            case CommentStatus.error:
              return Error(commentState: state);
          }
        },
      ),
    );
  }
}
