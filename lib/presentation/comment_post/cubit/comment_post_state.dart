abstract class CommentPostState {}

class InitialCommentPostState extends CommentPostState {}

class LoadingCommentPostState extends CommentPostState {}

class SentCommentPostState extends CommentPostState {}

class ErrorCommentPostState extends CommentPostState {
  final String errorMessage;

  ErrorCommentPostState({required this.errorMessage});
}
