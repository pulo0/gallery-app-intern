import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/album.dart';

// Path: lib/logic/album_cubit.dart
// Fetching albums from the API using http package and Bloc
class AlbumCubit extends Cubit<List<Album>> {
  AlbumCubit() : super(<Album>[]);

  Future<void> fetchAlbums() async {
    emit(<Album>[]);
    final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response = await http.get(url);

    // If the server returns a 200 status code response, then parse the JSON.
    try {
      if (response.statusCode == 200) {
        // data variable is for converting the response body to a List<dynamic>
        // albums variable is fort converting the List<dynamic> data to List<Album>
        final List<dynamic> data = jsonDecode(response.body);
        final List<Album> albums =
            data.map((eachElement) => Album.fromJson(eachElement)).toList();
        emit(albums);
      } else {
        throw Exception(response.body);
      }
    } catch (exception) {
      throw Exception('Failed to fetch data, more details ${exception.toString()}');
    }
  }
}
