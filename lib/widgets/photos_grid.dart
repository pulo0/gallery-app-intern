import 'package:flutter/material.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/widgets/single_ink_panel.dart';

class PhotosGrid extends StatelessWidget {
  const PhotosGrid(this.snapshot, {super.key});

  final AsyncSnapshot<List<Album>> snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(17),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 19,
        mainAxisSpacing: 18,
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) => SingleInkPanel(snapshot, index),
    );
  }
}
