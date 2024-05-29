import 'package:flutter/material.dart';
import 'package:gallery_app/models/album.dart';

class CommentsList extends StatelessWidget {
  const CommentsList(this.snapshot, {super.key});

  final AsyncSnapshot<List<Album>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
