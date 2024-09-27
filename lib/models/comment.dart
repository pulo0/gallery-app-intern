import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

// Comment Model
@JsonSerializable()
class Comment {
  // The fields of the Comment class
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  // A constructor for the Comment class
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  // A factory constructor that creates a Comment instance from a JSON object
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
