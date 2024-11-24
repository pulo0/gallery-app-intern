import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gallery_app/logic/api_client.dart';
import 'package:gallery_app/logic/album/data_album_repository.dart';
import 'package:gallery_app/logic/comment/data_comment_repository.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());

  locator.registerLazySingleton<ApiClient>(() => ApiClient(locator<Dio>()));

  locator.registerLazySingleton<DataAlbumRepository>(
      () => DataAlbumRepository(locator<ApiClient>()));

  locator.registerLazySingleton<DataCommentRepository>(
      () => DataCommentRepository(locator<ApiClient>()));
}