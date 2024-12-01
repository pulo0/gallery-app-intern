import 'package:dio/dio.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:gallery_app/models/album_response.dart';
import 'package:gallery_app/models/comment_response.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/photos')
  Future<List<AlbumResponse>> getAlbums();

  @GET('/comments')
  Future<List<CommentResponse>> getComments();

  @POST('/comments')
  Future<CommentResponse> postComment(@Body() Comment comment);
}