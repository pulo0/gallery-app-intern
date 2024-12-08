import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/models/comment_response.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments();

  Future<CommentResponse> postComment(Comment comment);
}
