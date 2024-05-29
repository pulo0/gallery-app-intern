import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/widgets/comments_list.dart';

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
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 26,
                      ),
                      child: Text(
                        'Loading album from http request',
                        style: mainTheme.textTheme.titleLarge!.copyWith(
                            color: mainColorScheme.primary, fontSize: 26),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
