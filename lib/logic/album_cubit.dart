import 'dart:convert';
import 'package:gallery_app/logic/album_state.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/album.dart';

// Path: lib/logic/album_cubit.dart
// Fetching albums from the API using http package and Bloc
class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit() : super(AlbumState());

  Future<void> fetchAlbums() async {
    emit(state.copyWith(status: AlbumStatus.loading));
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
        emit(
          state.copyWith(
            albums: albums,
            status: AlbumStatus.finished,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AlbumStatus.error,
            errorMessage: 'Failed to fetch data, please check your internet connection and try again.',
          ),
        );
      }
    } catch (exception) {
      emit(
        state.copyWith(
          status: AlbumStatus.error,
          errorMessage:
              "Failed to fetch data, please check your internet connection and try again. More details ${exception.toString()}",
        ),
      );
    }
  }
}
