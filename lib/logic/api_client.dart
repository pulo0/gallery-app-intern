import 'package:dio/dio.dart';
import 'package:gallery_app/models/album_response.dart';
import 'package:gallery_app/models/comment_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/photos')
  Future<List<AlbumResponse>> getAlbums();

  @GET('/comments')
  Future<List<CommentResponse>> getComments();
}