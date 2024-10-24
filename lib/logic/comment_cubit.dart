import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/comment_repository.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/logic/comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final CommentRepository commentRepository;

  CommentCubit(this.commentRepository) : super(InitialCommentState());

  Future<void> fetchComments() async {
    emit(LoadingCommentState());
    try {
      final comments = await commentRepository.getComments();
      emit(LoadedCommentState(comments: comments));
    } catch (exc) {
      emit(ErrorCommentState(errorMessage: '$exc'));
    }
  }
}
