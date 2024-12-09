import 'package:gallery_app/domain/models/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums();
}
