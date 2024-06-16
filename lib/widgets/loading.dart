import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gallery_app/styles/app_theme.dart';

class Loading extends StatefulWidget {
  const Loading(this.fetchData, {super.key});

  final void Function() fetchData;

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 26,
            ),
            child: AnimatedCrossFade(
              firstChild: Text(
                'Loading album from http request...',
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
              ),
              secondChild: Text(
                'Restart fetching album data',
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
              ),
              crossFadeState: !_isVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 250),
            ),
          ),
          AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 250),
            child: ElevatedButton(
              onPressed: widget.fetchData,
              child: Text(
                'Restart',
                style: textTheme.labelMedium!.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
