import 'package:equatable/equatable.dart';
import 'package:gallery_app/domain/models/comment.dart';

abstract class CommentState extends Equatable {
  @override
  List<Object?> get props => [];

  const CommentState();
}

class InitialCommentState extends CommentState {}

class LoadingCommentState extends CommentState {}

class LoadedCommentState extends CommentState {
  final List<Comment> comments;

  @override
  List<Object?> get props => [comments];

  LoadedCommentState({required this.comments});
}

class ErrorCommentState extends CommentState {
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  ErrorCommentState({required this.errorMessage});
}
