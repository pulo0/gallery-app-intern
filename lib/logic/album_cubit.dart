import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/logic/album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final Dio _dio = Dio();

  AlbumCubit() : super(InitialAlbumState());

  Future<void> fetchAlbums() async {
    emit(LoadingAlbumState());
    const failedFetchMsg = 'Failed to fetch data.';
    const connErrorMsg = 'Please check your internet connection and try again.';
    const url = 'https://jsonplaceholder.typicode.com/photos';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Album> albums =
            data.map((eachElement) => Album.fromJson(eachElement)).toList();
        emit(LoadedAlbumState(albums: albums));
      } else {
        emit(ErrorAlbumState(errorMessage: '$failedFetchMsg $connErrorMsg'));
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        emit(ErrorAlbumState(errorMessage: connErrorMsg));
      } else {
        emit(ErrorAlbumState(errorMessage: failedFetchMsg));
      }
    }
  }
}
