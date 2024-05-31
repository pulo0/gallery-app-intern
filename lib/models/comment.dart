import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Comment>> fetchComment() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
  final response = await http.get(url);
  final decodedUrl = jsonDecode(response.body);
  List<Comment> comments = [];

  try {
    if (response.statusCode == 200) {
      for (var eachElement in decodedUrl) {
        comments.add(Comment.fromJson(eachElement));
      }
    } else {
      throw Exception(response.body);
    }
  } catch (exception) {
    throw Exception('Failed to fetch data from http package');
  }

  return comments;
}

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
