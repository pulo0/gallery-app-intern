import 'package:gallery_app/domain/models/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments();

  Future<void> postComment(Comment comment);
}
