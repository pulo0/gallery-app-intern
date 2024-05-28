import 'package:flutter/material.dart';
import 'package:gallery_app/models/album.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreeen();
}

class _AlbumScreeen extends State<AlbumScreen> {
  List<Album> futureAlbum = [];

  @override
  void initState() {
    fetchAlbum().then(
      (value) {
        setState(() {
          futureAlbum.addAll(value);
        });
      },
    );
    super.initState();
    print(futureAlbum);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemBuilder: (context, index) => Text(
        futureAlbum[index].title,
        style: TextStyle(color: Colors.white),
      ),
      itemCount: futureAlbum.length,
    ));
  }
}
