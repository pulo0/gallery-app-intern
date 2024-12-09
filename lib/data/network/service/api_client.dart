import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:gallery_app/data/network/response/album_response.dart';
import 'package:gallery_app/data/network/request/comment_request.dart';
import 'package:gallery_app/data/network/response/comment_response.dart';

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
  Future<CommentResponse> postComment(@Body() CommentRequest commentRequest);
}
