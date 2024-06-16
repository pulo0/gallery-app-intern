import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/logic/comment_cubit.dart';
import 'package:gallery_app/widgets/comments_list.dart';
import 'package:gallery_app/widgets/loading.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentCubit()..fetchComments(),
      child: BlocBuilder<CommentCubit, List<Comment>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return Loading(() => CommentCubit().fetchComments());
          } else {
            return CommentsList(state);
          }
        },
      ),
    );
  }
}
