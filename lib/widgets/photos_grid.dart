import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/album.dart';

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
      itemBuilder: (context, index) => Material(
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(31, 122, 121, 121),
            image: DecorationImage(
              image: NetworkImage(snapshot.data![index].thumbnailUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: InkWell(
            onTap: () {},
            splashColor: mainColorScheme.tertiary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
