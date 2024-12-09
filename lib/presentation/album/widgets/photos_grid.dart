import 'package:flutter/material.dart';
import 'package:gallery_app/domain/models/album.dart';
import 'package:gallery_app/presentation/album/widgets/single_ink_panel.dart';

class PhotosGrid extends StatelessWidget {
  const PhotosGrid(this.state, {super.key});

  final List<Album> state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(17),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 19,
        mainAxisSpacing: 18,
      ),
      itemCount: state.length,
      itemBuilder: (context, index) => SingleInkPanel(state, index),
    );
  }
}
