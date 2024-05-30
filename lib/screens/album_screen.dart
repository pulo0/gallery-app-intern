import 'package:flutter/material.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/widgets/comments_list.dart';
import 'package:gallery_app/widgets/loading_error.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreeen();
}

class _AlbumScreeen extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: fetchAlbum(),
      builder: (context, AsyncSnapshot<List<Album>> snapshot) {
        return snapshot.hasData
            ? CommentsList(snapshot)
            : LoadingError(snapshot, fetchAlbum);
      },
    );
  }
}
