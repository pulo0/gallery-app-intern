import 'package:flutter/material.dart';
import 'package:gallery_app/logic/album_state.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/logic/album_cubit.dart';

class Error extends StatelessWidget {
  const Error(this.state, {super.key});

  final AlbumState state;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outline_rounded,
            size: 50,
            color: colorScheme.error,
          ),
          const SizedBox(height: 10),
          Text(
            'Failed to fetch data, more details ${state.errorMessage}',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => AlbumCubit().fetchAlbums(),
            child: Text(
              'Retry',
              style: textTheme.labelMedium!.copyWith(
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
