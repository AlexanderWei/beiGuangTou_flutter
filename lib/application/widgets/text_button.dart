import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton({
    required this.onPressed,
    required this.width,
    required this.height,
    this.margin = EdgeInsets.zero,
    required this.text,
    this.textColor = Colors.white,
    this.textStyle = const TextStyle(fontSize: 18.0),
    this.cornerRadius = 0.0,
    this.bgColor = Colors.blue,
    this.bgImgName,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
  });

  VoidCallback? onPressed;
  double width;
  double height;
  EdgeInsets margin;
  String text; // 按钮文字
  Color textColor; // 按钮文字颜色
  TextStyle textStyle;
  double cornerRadius; // 按钮圆角
  Color bgColor;
  String? bgImgName; // 按钮的背景图片，设置了以后按钮背景色、边框设置无效
  double borderWidth; // 按钮边框宽度
  Color borderColor; // 按钮边框色

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: Stack(
        children: [
          // 背景图
          Container(
            width: (bgImgName == null ? 0.0 : width),
            child: (bgImgName == null
                ? SizedBox.shrink()
                : Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    child: Image.asset(bgImgName!, fit: BoxFit.cover),
                  )),
          ),

          // 按钮
          Container(
            width: width,
            height: height,
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  textStyle,
                ),
                // 圆角
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all((bgImgName == null
                        ? bgColor
                        : Colors.transparent) // 如果按钮设置了背景图，背景色透明
                    ),
                // 边框
                side: MaterialStateProperty.all(
                  // 如果按钮设置了背景图，则无边框
                  BorderSide(
                    color:
                        (bgImgName == null ? borderColor : Colors.transparent),
                    width: (bgImgName == null ? borderWidth : 0.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
