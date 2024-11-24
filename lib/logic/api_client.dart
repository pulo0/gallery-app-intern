import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:gallery_app/models/album_response.dart';
import 'package:gallery_app/models/comment_response.dart';

part 'api_client.g.dart';

@injectable
@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/photos')
  Future<List<AlbumResponse>> getAlbums();

  @GET('/comments')
  Future<List<CommentResponse>> getComments();
}