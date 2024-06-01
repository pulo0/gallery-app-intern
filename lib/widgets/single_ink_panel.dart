import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/album.dart';
import 'package:gallery_app/widgets/android_dialog.dart';
import 'package:gallery_app/widgets/curpetino_dialog.dart';

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
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(31, 122, 121, 121),
          image: DecorationImage(
            image: NetworkImage(
              widget.snapshot.data![widget.index].thumbnailUrl,
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
          splashColor: mainColorScheme.tertiary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Future<void> _dialogShow(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Platform.isIOS
          ? CupertinoDialog(widget.snapshot, widget.index)
          : AndroidDialog(widget.snapshot, widget.index),
    );
  }
}
