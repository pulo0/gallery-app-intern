import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  final response = await http.get(url);
  final decodedUrl = jsonDecode(response.body);

  List<Album> albums = [];

  if (response.statusCode == 200) {
    for (var eachElement in decodedUrl) {
      albums.add(Album.fromJson(eachElement));
    }
  } else {
    throw Exception('Failed to load');
  }
  return albums;
}

class Album {
  Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'albumId': int albumId,
        'id': int id,
        'title': String title,
        'url': String url,
        'thumbnailUrl': String thumbnailUrl,
      } =>
        Album(
          albumId: albumId,
          id: id,
          title: title,
          url: url,
          thumbnailUrl: thumbnailUrl,
        ),
      _ => throw const FormatException('Failed to load...'),
    };
  }
}
