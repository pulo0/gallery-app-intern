import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/album/album_state.dart';
import 'package:gallery_app/logic/album/album_repository.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit(this._albumRepository) : super(InitialAlbumState());

  final AlbumRepository _albumRepository;

  Future<void> fetchAlbums() async {
    emit(LoadingAlbumState());
    try {
      final albums = await _albumRepository.getAlbums();
      emit(LoadedAlbumState(albums: albums));
    } catch (exc) {
      emit(ErrorAlbumState(errorMessage: '$exc'));
    }
  }
}
