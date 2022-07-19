import 'dart:async';
import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  int totalTime;
  String title;
  String subtitle;
  TextStyle textStyle;
  Color bgColor;
  double cornerRadius;
  bool isAutoCountdown;
  VoidCallback? callback;

  TimerButton({
    required this.totalTime,
    this.title = "开始倒计时",
    this.subtitle = "",
    this.textStyle = const TextStyle(fontSize: 18.0, color: Colors.white),
    this.bgColor = Colors.blue,
    this.cornerRadius = 0,
    this.isAutoCountdown = false,
    this.callback,
  });

  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  Timer? _timer;
  bool _isEnable = false;
  int _timeout = 0;
  String _timeStr = "";

  @override
  void initState() {
    super.initState();

    _timeout = widget.totalTime;
    _isEnable = (widget.totalTime > 0 ? true : false);

    _timeStr = widget.title;

    if (widget.isAutoCountdown == true) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (_isEnable == true
          ? () {
              _isEnable = false;

              _startTimer();

              if (widget.callback != null) {
                widget.callback!();
              }
            }
          : null),
      onDoubleTap: () {},
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(widget.cornerRadius),
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$_timeStr",
                style: widget.textStyle,
              ),
              TextSpan(
                text: (_isEnable == true ? "" : "${widget.subtitle}"),
                style: TextStyle(
                  fontSize: widget.textStyle.fontSize,
                  fontWeight: widget.textStyle.fontWeight,
                  color: Color(0xff333333),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _startTimer() {
    _cancelTimer();

    _timeStr = (widget.isAutoCountdown == true ? "" : "$_timeout");
    setState(() {});
    if (widget.isAutoCountdown == true) {
      widget.isAutoCountdown = false;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeout > 0) {
        _isEnable = false;

        _timeout--;
      }

      _timeStr = "$_timeout";
      setState(() {});

      if (_timeout == 0) {
        _cancelTimer();

        _isEnable = true;

        _timeout = widget.totalTime;
        _timeStr = widget.title;
      }
    });
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
