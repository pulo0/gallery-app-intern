import 'package:equatable/equatable.dart';
import 'package:gallery_app/domain/models/album.dart';

abstract class AlbumState extends Equatable {}

class InitialAlbumState extends AlbumState {
  @override
  List<Object?> get props => [];
}

class LoadingAlbumState extends AlbumState {
  @override
  List<Object?> get props => [];
}

class LoadedAlbumState extends AlbumState {
  final List<Album> albums;

  LoadedAlbumState({required this.albums});

  @override
  List<Object?> get props => [albums];
}

class ErrorAlbumState extends AlbumState {
  final String errorMessage;

  ErrorAlbumState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
