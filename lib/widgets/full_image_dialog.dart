import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/logic/service_locator.dart';
import 'package:gallery_app/logic/album/album_cubit.dart';
import 'package:gallery_app/logic/album/album_repository.dart';

class FullImageDialog extends StatelessWidget {
  const FullImageDialog(this.state, this.index, {super.key});

  final List<Album> state;
  final int index;

  @override
  Widget build(BuildContext context) {
    final albumRepository = locator<AlbumRepository>();

    const double measurements = 300;
    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;
    final locale = AppLocalizations.of(context);

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
                  locale.failShortMsg,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!
                      .copyWith(color: colorScheme.primary),
                ),
                TextButton(
                  onPressed: () => AlbumCubit(albumRepository).fetchAlbums(),
                  child: Text(
                    locale.retry,
                    style: const TextStyle(fontSize: 18.5),
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
          child: Text(
            locale.back,
            style: const TextStyle(fontSize: 18.5),
          ),
        ),
      ],
    );
  }
}
