import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gallery_app/logic/album/album_repository.dart';
import 'package:gallery_app/logic/album/data_album_repository.dart';
import 'package:gallery_app/logic/comment/comment_repository.dart';
import 'package:gallery_app/logic/comment/data_comment_repository.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());

  locator.registerLazySingleton<AlbumRepository>(
      () => AlbumRepository(locator<Dio>()));

  locator.registerLazySingleton<DataAlbumRepository>(
      () => DataAlbumRepository(locator<AlbumRepository>()));

  locator.registerLazySingleton<CommentRepository>(
      () => CommentRepository(locator<Dio>()));

  locator.registerLazySingleton<DataCommentRepository>(
      () => DataCommentRepository(locator<CommentRepository>()));
}
