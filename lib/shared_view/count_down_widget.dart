import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final int secondsRemaining;
  final void Function(int)? getTimer;
  final VoidCallback resendOtp;
  const CountDownTimer(
      {super.key,
      required this.secondsRemaining,
      this.getTimer,
      required this.resendOtp});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  late Timer _timer;
  late int _secondsRemaining;
  // late void Function(int)? _getTimer;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.secondsRemaining;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining <= 0) {
          _timer.cancel();
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int seconds = _secondsRemaining % 120;
    if (widget?.getTimer != null) {
      widget?.getTimer!(_secondsRemaining);
    }
    // return Text(
    //   ' Gửi lại (${seconds.toString()})',
    //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
    //       fontWeight: FontWeight.w400,
    //       fontSize: 18,
    //       color: const Color(0xFFEE0033)),
    // );
    return seconds != 0
        ? Text(
            ' Gửi lại (${seconds.toString()})',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: const Color(0xFFEE0033)),
          )
        : GestureDetector(
            onTap: widget.resendOtp,
            child: Text(
              ' Gửi lại',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: const Color(0xFF0070FF)),
            ),
          );
  }
}
