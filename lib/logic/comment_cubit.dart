import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/logic/comment_state.dart';

// Path: lib/logic/comment_cubit.dart
// Fetching comments from the API using http package and Bloc
class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentState());

  Future<void> fetchComments() async {
    emit(state.copyWith(status: CommentStatus.loading));
    const failedFetchMsg = 'Failed to fetch data.';
    const connErrorMsg = 'Please check your internet connection and try again.';
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final response = await http.get(url);

    // If the server returns a 200 status code response, then parse the JSON.
    try {
      if (response.statusCode == 200) {
        // data for converting the response body to a List<dynamic>
        // albums for converting the List<dynamic> data to List<Comment>
        final List<dynamic> data = jsonDecode(response.body);
        final List<Comment> comments =
            data.map((eachElement) => Comment.fromJson(eachElement)).toList();
        emit(
          state.copyWith(
            comments: comments,
            status: CommentStatus.finished,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: CommentStatus.error,
            errorMessage: '$failedFetchMsg $connErrorMsg',
          ),
        );
      }
    } catch (exception) {
      emit(
        state.copyWith(
          status: CommentStatus.error,
          errorMessage: '$failedFetchMsg More details: ${exception.toString()}',
        ),
      );
    }
  }
}
