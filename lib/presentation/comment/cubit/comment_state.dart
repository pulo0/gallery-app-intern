import 'package:equatable/equatable.dart';
import 'package:gallery_app/domain/models/comment.dart';

abstract class CommentState extends Equatable {
  const CommentState();
}

class InitialCommentState extends CommentState {
  @override
  List<Object?> get props => [];
}

class LoadingCommentState extends CommentState {
  @override
  List<Object?> get props => [];
}

class LoadedCommentState extends CommentState {
  final List<Comment> comments;

  LoadedCommentState({required this.comments});

  @override
  List<Object?> get props => [comments];
}

class ErrorCommentState extends CommentState {
  final String errorMessage;

  ErrorCommentState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
