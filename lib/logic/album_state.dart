import 'package:gallery_app/models/album.dart';

enum AlbumStatus {
  initial,
  loading,
  finished,
  error,
}

class AlbumState {
  final List<Album> albums;
  final AlbumStatus status;
  final String errorMessage;

  AlbumState({
    this.albums = const <Album>[],
    this.status = AlbumStatus.initial,
    this.errorMessage = '',
  });

  AlbumState copyWith({
    List<Album>? albums,
    AlbumStatus? status,
    String? errorMessage,
  }) =>
      AlbumState(
        albums: albums ?? this.albums,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
