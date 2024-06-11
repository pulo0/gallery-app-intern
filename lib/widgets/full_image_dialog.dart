import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/album.dart';

class FullImageDialog extends StatelessWidget {
  const FullImageDialog(this.snapshot, this.index, {super.key});

  final AsyncSnapshot<List<Album>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    const double measurements = 300;
    final TextTheme textTheme = mainTheme.textTheme;
    final snapshotData = snapshot.data!;

    return AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: mainColorScheme.surface.withOpacity(0.90),
      surfaceTintColor: mainColorScheme.surfaceBright,
      title: Text(
        snapshotData[index].title,
        style: textTheme.titleMedium!.copyWith(
          color: mainColorScheme.primary,
          fontWeight: FontWeight.w400,
        ),
      ),
      content: SizedBox(
        height: measurements,
        width: measurements,
        child: Image.network(
          snapshotData[index].url,
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
                  style: mainTheme.textTheme.bodyMedium!
                      .copyWith(color: mainColorScheme.primary),
                ),
                const TextButton(
                  onPressed: fetchAlbum,
                  child: Text(
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
