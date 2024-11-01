import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gallery_app/logic/album_repository.dart';
import 'package:gallery_app/logic/data_album_repository.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());

  locator.registerLazySingleton<AlbumRepository>(
      () => AlbumRepository(locator<Dio>()));

  locator.registerLazySingleton<DataAlbumRepository>(
      () => DataAlbumRepository(locator<AlbumRepository>()));
}
