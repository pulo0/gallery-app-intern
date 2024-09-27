import 'package:gallery_app/models/comment.dart';

// Comment State (applies also to AlbumState)
// The CommentState class is an abstract class that has four subclasses:
// InitialCommentState, LoadingCommentState, LoadedCommentState, and ErrorCommentState
// These subclasses represent the different states of the CommentCubit
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
