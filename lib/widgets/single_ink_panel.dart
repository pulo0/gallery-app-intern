import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/album.dart';

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
            image:
                CachedNetworkImageProvider(widget.snapshot.data![widget.index].thumbnailUrl,),
            fit: BoxFit.cover,
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
          ? CupertinoAlertDialog(
              title: Text(
                widget.snapshot.data![widget.index].title,
                style: mainTheme.textTheme.titleMedium!
                    .copyWith(color: mainColorScheme.primary),
              ),
              content: Image.network(
                widget.snapshot.data![widget.index].url,
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
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Go back'),
                ),
              ],
            )
          : AlertDialog(
              clipBehavior: Clip.antiAlias,
              title: Text(
                widget.snapshot.data![widget.index].title,
                style: mainTheme.textTheme.titleMedium!
                    .copyWith(color: mainColorScheme.primary),
              ),
              content: SizedBox(
                height: 300,
                width: 300,
                child: Image.network(
                  widget.snapshot.data![widget.index].url,
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
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Go back'),
                ),
              ],
            ),
    );
  }
}
