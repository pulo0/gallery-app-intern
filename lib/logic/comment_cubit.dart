import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/comment.dart';

// Path: lib/logic/comment_cubit.dart
// Fetching comments from the API using http package and Bloc
class CommentCubit extends Cubit<List<Comment>> {
  CommentCubit() : super(<Comment>[]);

  Future<void> fetchComments() async {
    emit(<Comment>[]);
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final response = await http.get(url);

    // If the server returns a 200 status code response, then parse the JSON.
    try {
      if (response.statusCode == 200) {
        // data variable is for converting the response body to a List<dynamic>
        // albums variable is fort converting the List<dynamic> data to List<Comment>
        final List<dynamic> data = jsonDecode(response.body);
        final List<Comment> comments =
            data.map((eachElement) => Comment.fromJson(eachElement)).toList();
        emit(comments);
      } else {
        throw Exception(response.body);
      }
    } catch (exception) {
      throw Exception('Failed to fetch data, more details ${exception.toString()}');
    }
  }
}
