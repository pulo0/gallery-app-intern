import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/logic/album/album_state.dart';
import 'package:gallery_app/logic/album/data_album_repository.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final DataAlbumRepository _dataAlbumRepository;

  AlbumCubit(this._dataAlbumRepository) : super(InitialAlbumState());

  Future<void> fetchAlbums() async {
    emit(LoadingAlbumState());
    try {
      final albums = await _dataAlbumRepository.getAlbums();
      emit(LoadedAlbumState(albums: albums));
    } catch (exc) {
      emit(ErrorAlbumState(errorMessage: '$exc'));
    }
  }
}
