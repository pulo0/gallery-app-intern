import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/comment.dart';

class CommentsList extends StatelessWidget {
  const CommentsList(this.snapshot, {super.key});

  final AsyncSnapshot<List<Comment>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 1,
          shadowColor: mainColorScheme.primary,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.comment_outlined),
                title: Text(
                  snapshot.data![index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(snapshot.data![index].body),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 20,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      snapshot.data![index].email,
                      style: mainTheme.textTheme.bodyMedium!.copyWith(
                        color: mainColorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
