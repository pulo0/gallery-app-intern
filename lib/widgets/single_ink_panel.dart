import 'package:flutter/material.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/widgets/full_image_dialog.dart';

class SingleInkPanel extends StatefulWidget {
  const SingleInkPanel(this.snapshot, this.index, {super.key});

  final AsyncSnapshot<List<Album>> snapshot;
  final int index;

  @override
  State<SingleInkPanel> createState() => _SingleInkPanelState();
}

class _SingleInkPanelState extends State<SingleInkPanel> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = mainTheme().colorScheme;
    final index = widget.index;
    final snapshotData = widget.snapshot.data!;
    final snapshotDataIndexed = snapshotData[index];

    return Material(
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(31, 122, 121, 121),
          image: DecorationImage(
            image: NetworkImage(
              snapshotDataIndexed.thumbnailUrl,
            ),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {
              return FlutterError.reportError(
                FlutterErrorDetails(
                  exception: exception,
                  stack: stackTrace,
                  library: 'Album image fetching',
                  context: ErrorDescription(
                    'Failed to fetch the image from http request',
                  ),
                ),
              );
            },
          ),
        ),
        child: InkWell(
          onTap: () => _dialogShow(context),
          splashColor: colorScheme.tertiary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Future<void> _dialogShow(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => FullImageDialog(widget.snapshot, widget.index),
    );
  }
}
