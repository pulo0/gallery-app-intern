import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/album_repository.dart';
import 'package:gallery_app/logic/album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final AlbumRepository _albumRepository;

  AlbumCubit(this._albumRepository) : super(InitialAlbumState());

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
