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
                NetworkImage(widget.snapshot.data![widget.index].thumbnailUrl),
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
      builder: (context) => AlertDialog(
        title: Text(
          widget.snapshot.data![widget.index].title,
          style: mainTheme.textTheme.titleMedium!
              .copyWith(color: mainColorScheme.primary),
        ),
        content: Image.network(
          widget.snapshot.data![widget.index].url,
          fit: BoxFit.cover,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Go back'),
          ),
        ],
      ),
    );
  }
}
