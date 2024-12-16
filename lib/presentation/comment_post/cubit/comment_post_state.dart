import 'package:equatable/equatable.dart';

abstract class CommentPostState extends Equatable {
  const CommentPostState();
}

class InitialCommentPostState extends CommentPostState {
  @override
  List<Object?> get props => [];
}

class LoadingCommentPostState extends CommentPostState {
  @override
  List<Object?> get props => [];
}

class SentCommentPostState extends CommentPostState {
  @override
  List<Object?> get props => [];
}

class ErrorCommentPostState extends CommentPostState {
  final String errorMessage;

  ErrorCommentPostState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
