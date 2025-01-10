import 'package:equatable/equatable.dart';

sealed class CommentPostState extends Equatable {
  @override
  List<Object?> get props => [];

  const CommentPostState();
}

class InitialCommentPostState extends CommentPostState {}

class LoadingCommentPostState extends CommentPostState {}

class SentCommentPostState extends CommentPostState {}

class ErrorCommentPostState extends CommentPostState {
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  ErrorCommentPostState({required this.errorMessage});
}
