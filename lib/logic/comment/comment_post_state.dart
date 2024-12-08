import 'package:gallery_app/models/comment_response.dart';

abstract class CommentPostState {}

class InitialCommentPostState extends CommentPostState {}

class LoadingCommentPostState extends CommentPostState {}

class SentCommentPostState extends CommentPostState {
  final CommentResponse comment;

  SentCommentPostState({required this.comment});
}

class ErrorCommentPostState extends CommentPostState {
  final String errorMessage;

  ErrorCommentPostState({required this.errorMessage});
}
