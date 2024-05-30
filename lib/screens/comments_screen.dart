import 'package:flutter/material.dart';
import 'package:gallery_app/models/comment.dart';
import 'package:gallery_app/widgets/comments_list.dart';
import 'package:gallery_app/widgets/loading_error.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchComment(),
      builder: (context, snapshot) => snapshot.hasData
          ? CommentsList(snapshot)
          : const LoadingError(fetchComment),
    );
  }
}
