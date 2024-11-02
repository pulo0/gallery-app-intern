import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:gallery_app/models/album_response.dart';

part 'album_repository.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class AlbumRepository {
  factory AlbumRepository(Dio dio, {String? baseUrl}) = _AlbumRepository;

  @GET('/photos')
  Future<List<AlbumResponse>> getAlbums();
}
