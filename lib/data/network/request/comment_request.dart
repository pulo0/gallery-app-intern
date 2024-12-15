import 'package:json_annotation/json_annotation.dart';

part 'comment_request.g.dart';

@JsonSerializable()
class CommentRequest {
  final int postId;
  final String name;
  final String email;
  final String body;

  CommentRequest({
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommentRequestToJson(this);
}
