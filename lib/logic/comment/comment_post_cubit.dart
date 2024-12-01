import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/logic/comment/comment_post_state.dart';
import 'package:gallery_app/logic/comment/comment_repository.dart';

class CommentPostCubit extends Cubit<CommentPostState> {
  CommentPostCubit(this.commentRepository) : super(InitialCommentPostState());

  final CommentRepository commentRepository;

  Future<void> postComment(Comment comment) async {
    emit(LoadingCommentPostState());
    try {
      final post = await commentRepository.postComment(comment);
      emit(SentCommentPostState(comment: post));
    } catch (exc) {
      emit(ErrorCommentPostState(errorMessage: '$exc'));
    }
  }
}
