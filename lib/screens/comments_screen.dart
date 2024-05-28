import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Comments TODO: Loading...',
            textAlign: TextAlign.center,
            style: mainTheme.textTheme.titleLarge!.copyWith(
              color: mainColorScheme.primary,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 16),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
