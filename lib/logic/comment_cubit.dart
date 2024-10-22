import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/logic/comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final Dio _dio = Dio();

  CommentCubit() : super(InitialCommentState());

  Future<void> fetchComments() async {
    emit(LoadingCommentState());
    const failedFetchMsg = 'Failed to fetch data.';
    const connErrorMsg = 'Please check your internet connection and try again.';
    const url = 'https://jsonplaceholder.typicode.com/comments';

    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Comment> comments =
            data.map((eachElement) => Comment.fromJson(eachElement)).toList();
        emit(
          LoadedCommentState(comments: comments),
        );
      } else {
        emit(ErrorCommentState(errorMessage: '$failedFetchMsg $connErrorMsg'));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        emit(ErrorCommentState(errorMessage: connErrorMsg));
      } else {
        emit(ErrorCommentState(errorMessage: failedFetchMsg));
      }
    }
  }
}
