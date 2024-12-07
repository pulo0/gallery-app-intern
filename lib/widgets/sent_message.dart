import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gallery_app/logic/comment/comment_post_cubit.dart';
import 'package:gallery_app/logic/comment/comment_repository.dart';
import 'package:gallery_app/logic/service_locator.dart';

class SentMessage extends StatefulWidget {
  const SentMessage({super.key});

  @override
  State<SentMessage> createState() => _SentMessageState();
}

class _SentMessageState extends State<SentMessage> {
  final CommentRepository commentRepository = locator<CommentRepository>();

  Timer? _timer;
  int _startCountdown = 6;

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
              CommentPostCubit(commentRepository).restartToForm();
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
    return Center(
      child: Text('temp: You added the comment'),
    );
  }
}
