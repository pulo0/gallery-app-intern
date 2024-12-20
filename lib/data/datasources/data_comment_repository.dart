import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:gallery_app/domain/models/comment.dart';
import 'package:gallery_app/data/network/service/api_client.dart';
import 'package:gallery_app/data/network/request/comment_request.dart';
import 'package:gallery_app/domain/repositories/comment_repository.dart';

@LazySingleton(as: CommentRepository)
class DataCommentRepository extends CommentRepository {
  final ApiClient _apiClient;

  DataCommentRepository(this._apiClient);

  @override
  Future<List<Comment>> getComments() async {
    try {
      final response = await _apiClient.getComments();
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

  @override
  Future<void> postComment(Comment comment) async {
    try {
      await _apiClient.postComment(
        CommentRequest(
          postId: comment.postId,
          name: comment.name,
          email: comment.email,
          body: comment.body,
        ),
      );
    } on DioException catch (exc) {
      if (exc.response?.statusCode == 404) {
        throw Exception('Comment posting not able to send (404 code)');
      } else {
        throw Exception('More error: ${exc.response}');
      }
    }
  }
}
