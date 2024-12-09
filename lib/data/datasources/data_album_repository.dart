import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:gallery_app/data/network/service/api_client.dart';
import 'package:gallery_app/domain/models/album.dart';
import 'package:gallery_app/domain/repositories/album_repository.dart';

@LazySingleton(as: AlbumRepository)
class DataAlbumRepository extends AlbumRepository {
  final ApiClient _apiClient;

  DataAlbumRepository(this._apiClient);

  @override
  Future<List<Album>> getAlbums() async {
    try {
      final response = await _apiClient.getAlbums();
      return response
          .map((e) => Album(
              albumId: e.albumId,
              id: e.id,
              title: e.title,
              url: e.url,
              thumbnailUrl: e.thumbnailUrl))
          .toList();
    } on DioException catch (exc) {
      if (exc.response?.statusCode == 404) {
        throw Exception('Album not able to fetch (404)');
      } else {
        throw Exception('More detailed error (no 404): ${exc.message}');
      }
    }
  }
}
