import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/presentation/universal_widgets/error.dart';
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
    final locale = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => CommentCubit(commentRepository)..fetchComments(),
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
            return Center(
                child: Text(
              locale.wrongState,
            ));
          }
        },
      ),
    );
  }
}
