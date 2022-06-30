import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  Image image;
  double width;
  double height;
  EdgeInsets margin;
  Color bgColor;

  MyImage({
    Key? key,
    required this.image,
    this.width = 0.0,
    this.height = 0.0,
    this.margin = EdgeInsets.zero,
    this.bgColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: width,
      height: height,
      child: image,
    );
  }
}
