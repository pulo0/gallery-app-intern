import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/album.dart';

class CupertinoDialog extends StatelessWidget {
  const CupertinoDialog(this.snapshot, this.index, {super.key});

  final AsyncSnapshot<List<Album>> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        snapshot.data![index].title,
        style: mainTheme.textTheme.titleMedium!
            .copyWith(color: mainColorScheme.primary),
      ),
      content: SizedBox(
        width: 300,
        height: 300,
        child: Image.network(
          snapshot.data![index].url,
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
