import 'package:dio/dio.dart';
import 'package:gallery_app/models/album_response.dart';
import 'package:gallery_app/models/album.dart';

class AlbumRepository {
  final Dio _dio = Dio();

  AlbumRepository();

  Future<List<Album>> getAlbums() async {
    const url = 'https://jsonplaceholder.typicode.com/photos';
    final response = await _dio.get(url);

    try {
      final List<dynamic> data = response.data;
      return data.map((eachElement) {
        final albumResponse = AlbumResponse.fromJson(eachElement);
        return Album(
          albumId: albumResponse.albumId,
          id: albumResponse.id,
          title: albumResponse.title,
          url: albumResponse.url,
          thumbnailUrl: albumResponse.thumbnailUrl,
        );
      }).toList();
    } on DioException catch (exc) {
      throw Exception(exc);
    }
  }
}
