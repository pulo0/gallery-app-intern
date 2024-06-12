class Comment {
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  factory Comment.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'postId': int postId,
        'id': int id,
        'name': String name,
        'email': String email,
        'body': String body
      } =>
        Comment(
          postId: postId,
          id: id,
          name: name,
          email: email,
          body: body,
        ),
      _ => throw const FormatException('Failed to load'),
    };
  }
}
