import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    this.style = const TextStyle(fontSize: 18.0, color: Colors.black),
    this.textAlign = TextAlign.left,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.bgColor = Colors.transparent,
    this.maxLines = 1,
  }) : super(key: key);

  String text;
  double width;
  double height;
  EdgeInsets margin;
  EdgeInsets padding;
  Color bgColor;
  TextStyle style;
  TextAlign textAlign;
  int maxLines; // 默认是1行，如果设置为0，则为1000行

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.bgColor,
      width: this.width,
      height: this.height,
      margin: this.margin,
      padding: this.padding,
      child: Text(
        this.text,
        style: this.style,
        textAlign: this.textAlign,
        maxLines: setMaxLines(this.maxLines),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

int setMaxLines(value) {
  if (value < 1) {
    value = 1000;
  }
  return value;
}
