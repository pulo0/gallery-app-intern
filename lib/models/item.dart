import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Item> fetchItem() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    return Item.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}

class Item {
  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'albumId': int albumId,
        'id': int id,
        'title': String title,
        'url': String url,
        'thumbnailUrl': String thumbnailUrl,
      } =>
        Item(
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
