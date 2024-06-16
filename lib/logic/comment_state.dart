import 'package:gallery_app/models/comment.dart';

enum CommentStatus {
  initial,
  loading,
  finished,
  error,
}

class CommentState {
  final CommentStatus status;
  final List<Comment> comments;
  final String errorMessage;

  CommentState({
    this.status = CommentStatus.initial,
    this.comments = const <Comment>[],
    this.errorMessage = '',
  });

  CommentState copyWith({
    CommentStatus? status,
    List<Comment>? comments,
    String? errorMessage,
  }) =>
      CommentState(
        status: status ?? this.status,
        comments: comments ?? this.comments,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
