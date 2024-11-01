import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import 'package:gallery_app/models/album_response.dart';

part 'album_repository.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/photos')
abstract class AlbumRepository {
  factory AlbumRepository(Dio dio, {String? baseUrl}) = _AlbumRepository;

  @GET('/albums')
  Future<List<AlbumResponse>> getAlbums();
}
