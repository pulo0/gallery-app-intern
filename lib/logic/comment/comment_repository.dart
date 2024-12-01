import 'package:gallery_app/models/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments();

  Future<Comment> postComment(Comment comment);
}
