import 'package:flutter/material.dart';

class LinearProgress extends StatefulWidget {
  LinearProgress({
    Key? key,
    this.value,
    this.valueColor,
    this.bgColor,
    this.minHeight,
  }) : super(key: key);

  double? value; // 0.0 ~ 1.0
  Color? valueColor;
  Color? bgColor;
  double? minHeight;

  Progress progress = Progress();

  @override
  State<LinearProgress> createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.progress.addListener(() {
      //数值改变的监听
      setState(() {
        widget.value = widget.progress.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != null && widget.value! < 1.0) {
      return LinearProgressIndicator(
        value: widget.value,
        valueColor: AlwaysStoppedAnimation(widget.valueColor),
        backgroundColor:
            widget.bgColor == null ? Colors.transparent : widget.bgColor,
        minHeight: widget.minHeight,
      );
    }
    return SizedBox.shrink();
  }
}

class Progress with ChangeNotifier {
  double value = 0.0; // 0.0 ~ 1.0

  setProgress(double? value) {
    if (value != null) {
      this.value = value;

      notifyListeners();
    }
  }
}
