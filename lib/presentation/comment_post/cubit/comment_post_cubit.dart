import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/presentation/comment_post/cubit/comment_post_state.dart';
import 'package:gallery_app/domain/models/comment.dart';
import 'package:gallery_app/domain/repositories/comment_repository.dart';

@injectable
class CommentPostCubit extends Cubit<CommentPostState> {
  CommentPostCubit(this.commentRepository) : super(InitialCommentPostState());

  final CommentRepository commentRepository;

  Future<void> postComment(Comment comment) async {
    emit(LoadingCommentPostState());
    try {
      await commentRepository.postComment(comment);
      emit(SentCommentPostState());
    } catch (exc) {
      emit(ErrorCommentPostState(errorMessage: '$exc'));
    }
  }

  Future<void> restartToForm() async {
    emit(InitialCommentPostState());
  }
}
