import 'package:dio/dio.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/logic/album_repository.dart';

class DataAlbumRepository {
  final AlbumRepository _albumRepository;

  DataAlbumRepository(this._albumRepository);

  Future<List<Album>> getAlbums() async {
    try {
      // TODO: fix the issue (_albumRepository not passing through data)
      print('Tried passing data...');
      final response = await _albumRepository.getAlbums();
      print('Possible success in passing data: ${response.toList()}');
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
        throw Exception('Album not able to fetch (404): ${exc.message}');
      } else {
        throw Exception('More detailed error (no 404): ${exc.message}');
      }
    }
  }
}
