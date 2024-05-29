import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/album.dart';

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
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => ListTile(
                  leading: snapshot.connectionState == ConnectionState.waiting
                      ? const CircularProgressIndicator()
                      : CircleAvatar(
                          radius: 16,
                          backgroundImage:
                              NetworkImage(snapshot.data![index].thumbnailUrl),
                        ),
                  title: Text(snapshot.data![index].title),
                ),
              )
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
