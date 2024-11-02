import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/comment/comment_state.dart';
import 'package:gallery_app/logic/comment/data_comment_repository.dart';

class CommentCubit extends Cubit<CommentState> {
  final DataCommentRepository dataCommentRepository;

  CommentCubit(this.dataCommentRepository) : super(InitialCommentState());

  Future<void> fetchComments() async {
    emit(LoadingCommentState());
    try {
      final comments = await dataCommentRepository.getComments();
      emit(LoadedCommentState(comments: comments));
    } catch (exc) {
      emit(ErrorCommentState(errorMessage: '$exc'));
    }
  }
}
