import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/presentation/universal_widgets/error.dart';
import 'package:gallery_app/presentation/universal_widgets/load_indicator.dart';
import 'package:gallery_app/presentation/universal_widgets/loading.dart';
import 'package:gallery_app/presentation/comment/cubit/comment_cubit.dart';
import 'package:gallery_app/presentation/comment/cubit/comment_state.dart';
import 'package:gallery_app/presentation/comment/widgets/comments_list.dart';
import 'package:gallery_app/data/network/service/service_locator.dart';
import 'package:gallery_app/domain/repositories/comment_repository.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final commentRepository = locator<CommentRepository>();
    return BlocProvider(
      create: (context) => CommentCubit(commentRepository)..fetchComments(),
      child: BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) {
          return switch (state) {
            InitialCommentState() => LoadIndicator(),
            LoadingCommentState() => Loading(commentState: state),
            LoadedCommentState() => CommentsList(state.comments),
            ErrorCommentState() => Error(commentState: state),
          };
        },
      ),
    );
  }
}
