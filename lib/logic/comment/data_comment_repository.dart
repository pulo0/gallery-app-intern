import 'package:dio/dio.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/logic/comment/comment_repository.dart';

class DataCommentRepository {
  final CommentRepository _commentRepository;

  DataCommentRepository(this._commentRepository);

  Future<List<Comment>> getComments() async {
    try {
      final response = await _commentRepository.getComments();
      return response
          .map((e) => Comment(
              postId: e.postId,
              id: e.id,
              name: e.name,
              email: e.email,
              body: e.body))
          .toList();
    } on DioException catch (exc) {
      if (exc.response?.statusCode == 404) {
        throw Exception('Comment not able to fetch (404 code)');
      } else {
        throw Exception('More error: ${exc.response}');
      }
    }
  }
}
