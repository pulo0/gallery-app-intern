import 'package:flutter/material.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/logic/album_cubit.dart';

class FullImageDialog extends StatelessWidget {
  const FullImageDialog(this.state, this.index, {super.key});

  final List<Album> state;
  final int index;

  @override
  Widget build(BuildContext context) {
    const double measurements = 300;
    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;

    return AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: colorScheme.surface.withOpacity(0.90),
      surfaceTintColor: colorScheme.surfaceBright,
      title: Text(
        state[index].title,
        style: textTheme.titleMedium!.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w400,
        ),
      ),
      content: SizedBox(
        height: measurements,
        width: measurements,
        child: Image.network(
          state[index].url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
          errorBuilder: (context, error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Failed to fetch',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!
                      .copyWith(color: colorScheme.primary),
                ),
                TextButton(
                  onPressed: () => AlbumCubit().fetchAlbums(),
                  child: const Text(
                    'Retry',
                    style: TextStyle(fontSize: 18.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Go back',
            style: TextStyle(fontSize: 18.5),
          ),
        ),
      ],
    );
  }
}
