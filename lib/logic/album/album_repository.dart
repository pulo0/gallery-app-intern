import 'package:gallery_app/models/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums();
}
