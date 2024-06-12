import 'package:flutter/material.dart';
import 'package:gallery_app/logic/http_fetching.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/widgets/loading_error.dart';
import 'package:gallery_app/widgets/photos_grid.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreeenState();
}

class _AlbumScreeenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: fetchAlbum(),
      builder: (context, AsyncSnapshot<List<Album>> snapshot) {
        return snapshot.hasData
            ? PhotosGrid(snapshot)
            : const LoadingError(fetchAlbum);
      },
    );
  }
}
