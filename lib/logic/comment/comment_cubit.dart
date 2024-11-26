import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/comment/comment_state.dart';
import 'package:gallery_app/logic/comment/comment_repository.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.commentRepository) : super(InitialCommentState());

  final CommentRepository commentRepository;

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
