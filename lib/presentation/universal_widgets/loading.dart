import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/presentation/album/cubit/album_state.dart';
import 'package:gallery_app/presentation/comment/cubit/comment_state.dart';
import 'package:gallery_app/presentation/comment_post/cubit/comment_post_state.dart';

class Loading extends StatefulWidget {
  const Loading(
      {super.key, this.albumState, this.commentState, this.commentPostState});

  final AlbumState? albumState;
  final CommentState? commentState;
  final CommentPostState? commentPostState;

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
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = mainTheme().textTheme;
    final locale = AppLocalizations.of(context);
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
                widget.albumState != null
                    ? locale.loadingTxt('alb')
                    : widget.commentState != null
                        ? locale.loadingTxt('com')
                        : locale.loadingTxt('compost'),
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
              ),
              secondChild: Text(
                widget.albumState != null
                    ? locale.restartTxt('alb')
                    : widget.commentState != null
                        ? locale.restartTxt('com')
                        : locale.restartTxt('compost'),
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
              ),
              crossFadeState: !_isVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 250),
            ),
          ),
        ],
      ),
    );
  }
}
