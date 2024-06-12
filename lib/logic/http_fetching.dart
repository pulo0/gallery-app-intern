import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/models/comment.dart';

// Path: lib/logic/http_fetching.dart
// Fetching albums from the API (Temporary solution)
Future<List<Album>> fetchAlbum() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  final response = await http.get(url);
  final decodedUrl = jsonDecode(response.body);
  List<Album> albums = [];

  try {
    if (response.statusCode == 200) {
      for (var eachElement in decodedUrl) {
        albums.add(Album.fromJson(eachElement));
      }
    } else {
      throw Exception(response.body);
    }
  } catch (exception) {
    throw Exception('Failed to fetch data from http package');
  }

  return albums;
}

// Fetching comments from the API (Temporary solution)
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

