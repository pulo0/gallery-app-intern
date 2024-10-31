import 'package:gallery_app/models/album.dart';

abstract class AlbumState {}

class InitialAlbumState extends AlbumState {}

class LoadingAlbumState extends AlbumState {}

class LoadedAlbumState extends AlbumState {
  final List<Album> albums;

  LoadedAlbumState({required this.albums});
}

class ErrorAlbumState extends AlbumState {
  final String errorMessage;

  ErrorAlbumState({required this.errorMessage});
}
