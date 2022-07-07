import 'package:flutter/material.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    required this.placeholder,
    this.placeholderStyle,
    this.text = "",
    this.bgColor = Colors.white,
    this.cornerRadius = 0.0,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.enabledBorder =
        const BorderSide(color: Color.fromRGBO(223, 223, 223, 1)),
    this.focusedBorder = const BorderSide(color: Colors.blue),
    this.keyboardType = TextInputType.text,
    this.hasClearButton = true,
    this.maxLength,
    this.inputAction = TextInputAction.done,
    this.focusNode,
    this.autofocus = false,
    this.obscureText = false,
  }) : super(key: key);

  double width;

  double height;
  final double minHeight = 36.0; // 组件的最小高度，当设置的 height 小于这个高度时，使用这个高度

  EdgeInsets margin;
  EdgeInsets padding;
  Color bgColor;
  double cornerRadius; // 圆角
  BorderSide enabledBorder;
  BorderSide focusedBorder;
  String text;
  String placeholder;
  TextStyle? placeholderStyle;
  TextInputType keyboardType;
  TextEditingController controller;
  bool hasClearButton; // 是否有清除按钮
  int? maxLength;
  TextInputAction inputAction;
  final FocusNode? focusNode;
  bool autofocus;
  bool obscureText;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    // TODO: implement initState
    widget.controller.text = widget.text;
    // 监听输入改变
    widget.controller.addListener(() {
      bool isNotEmpty = widget.controller.text.isNotEmpty;
      if (_showClearBtn != isNotEmpty) {
        // 状态不一样再刷新，避免重复不必要地重绘widget
        setState(() {
          _showClearBtn = isNotEmpty;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.controller.dispose();
    widget.focusNode?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h =
        (widget.height < widget.minHeight ? widget.minHeight : widget.height);

    return Container(
      width: widget.width,
      height: h,
      margin: widget.margin,
      padding: widget.padding,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.cornerRadius),
        color: widget.bgColor,
      ),
      child: Stack(children: [
        Align(
          alignment: Alignment(-1, 0),
          child: TextField(
            textInputAction: widget.inputAction,
            keyboardType: widget.keyboardType,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: widget.placeholderStyle,
              counterText: "",
              enabledBorder:
                  UnderlineInputBorder(borderSide: widget.enabledBorder),
              focusedBorder:
                  UnderlineInputBorder(borderSide: widget.focusedBorder),
            ),
            maxLength: widget.maxLength,
            obscureText: widget.obscureText,
          ),
        ),

        // 清除按钮
        clearButton(),
      ]),
    );
  }

  bool _showClearBtn = false; // 是否显示清除按钮
  // 清除输入的按钮
  Widget clearButton() {
    return Align(
      alignment: Alignment(0.97, 0),
      child: InkWell(
        // 触发清除文本事件
        onTap: () {
          widget.controller.clear();
        },

        child: Visibility(
          visible: (widget.hasClearButton == true ? _showClearBtn : false),
          child: Container(
            width: 25,
            height: 25,
            child: Image.asset(
              AssetsPath.clear_button,
            ),
          ),
        ),
      ),
    );
  }
}
