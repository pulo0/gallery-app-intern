import 'package:flutter/material.dart';
import 'package:gallery_app/models/comment.dart';

class CommentsList extends StatelessWidget {
  const CommentsList(this.snapshot, {super.key});

  final AsyncSnapshot<List<Comment>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) => ListTile(
        leading: snapshot.connectionState == ConnectionState.waiting
            ? const CircularProgressIndicator()
            : Text(snapshot.data![index].email),
        title: Text(snapshot.data![index].name),
        subtitle: Text(snapshot.data![index].body),
      ),
    );
  }
}
