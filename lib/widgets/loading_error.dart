import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/models/album.dart';

class LoadingError extends StatefulWidget {
  const LoadingError(this.snapshot, {super.key});

  final AsyncSnapshot<List<Album>> snapshot;

  @override
  State<LoadingError> createState() => _LoadingError();
}

class _LoadingError extends State<LoadingError> {
  Timer? _timer;
  int _startCountdown = 6;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) => _startCountdown == 0
          ? setState(() {
              _isVisible = true;
              _timer!.cancel();
            })
          : _startCountdown--,
    );
    debugPrint(_startCountdown.toString());
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 26,
            ),
            child: Text(
              _isVisible
                  ? 'Restart fetching album data'
                  : 'Loading album from http request...',
              style: mainTheme.textTheme.titleLarge!
                  .copyWith(color: mainColorScheme.primary, fontSize: 26),
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: ElevatedButton(
              onPressed: fetchAlbum,
              child: Text(
                'Restart',
                style: mainTheme.textTheme.labelMedium!.copyWith(
                  color: mainColorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
