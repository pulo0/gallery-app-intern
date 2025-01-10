import 'package:equatable/equatable.dart';
import 'package:gallery_app/domain/models/album.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object?> get props => [];

  const AlbumState();
}

class InitialAlbumState extends AlbumState {}

class LoadingAlbumState extends AlbumState {}

class LoadedAlbumState extends AlbumState {
  final List<Album> albums;

  @override
  List<Object?> get props => [albums];

  LoadedAlbumState({required this.albums});
}

class ErrorAlbumState extends AlbumState {
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  ErrorAlbumState({required this.errorMessage});
}
