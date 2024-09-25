import 'package:gallery_app/models/comment.dart';

abstract class CommentState {}

class InitialCommentState extends CommentState {}

class LoadingCommentState extends CommentState {}

class LoadedCommentState extends CommentState {
  final List<Comment> comments;
  LoadedCommentState({required this.comments});
}

class ErrorCommentState extends CommentState {
  final String errorMessage;
  ErrorCommentState({required this.errorMessage});
}
