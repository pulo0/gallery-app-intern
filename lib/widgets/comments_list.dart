import 'package:flutter/material.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/models/comment.dart';

class CommentsList extends StatelessWidget {
  const CommentsList(this.state, {super.key});

  final List<Comment> state;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;
    final snapshotData = state;

    return ListView.builder(
      itemCount: state.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 1,
          shadowColor: colorScheme.primary,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.comment_outlined),
                title: Text(
                  snapshotData[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(snapshotData[index].body),
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
                      snapshotData[index].email,
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.secondary,
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
