import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:gallery_app/models/comment_response.dart';

part 'comment_repository.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class CommentRepository {
  factory CommentRepository(Dio dio, {String? baseUrl}) = _CommentRepository;

  @GET('/comments')
  Future<List<CommentResponse>> getComments();
}
