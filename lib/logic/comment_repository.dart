import 'package:dio/dio.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/models/comment_response.dart';

class CommentRepository {
  final Dio _dio = Dio();

  CommentRepository();

  Future<List<Comment>> getComments() async {
    const url = 'https://jsonplaceholder.typicode.com/comments';
    final response = await _dio.get(url);

    try {
      final List<dynamic> data = response.data;
      return data.map((eachElement) {
        final commentResponse = CommentResponse.fromJson(eachElement);
        return Comment(
          postId: commentResponse.postId,
          id: commentResponse.id,
          name: commentResponse.name,
          email: commentResponse.email,
          body: commentResponse.body,
        );
      }).toList();
    } catch (exc) {
      throw Exception(exc);
    }
  }
}
