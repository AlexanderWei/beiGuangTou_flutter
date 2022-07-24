import 'package:flutter/material.dart';
import '../support_file/common_header.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    required this.placeholder,
    this.placeholderStyle,
    this.text = "",
    this.textStyle,
    this.bgColor = Colors.white,
    this.cornerRadius = 0.0,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.enabledBorder =
        const BorderSide(color: Color.fromRGBO(223, 223, 223, 1)),
    this.focusedBorder = const BorderSide(color: Colors.blue),
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.inputAction = TextInputAction.done,
    this.focusNode,
    this.autofocus = false,
    this.isSecureEntry = false,
    this.onEditingComplete,
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
  TextStyle? textStyle;
  TextInputType keyboardType;
  TextEditingController controller;
  int? maxLength;
  TextInputAction inputAction;
  final FocusNode? focusNode;
  bool autofocus;
  bool isSecureEntry; // 是否是密码安全的类型？如果是，则clearButton隐藏。
  VoidCallback? onEditingComplete; // 点击了键盘自带的 done 按钮事件

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
          alignment: const Alignment(-1, 0),
          child: TextField(
            onEditingComplete: widget.onEditingComplete,
            textInputAction: widget.inputAction,
            keyboardType: widget.keyboardType,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            controller: widget.controller,
            style: widget.textStyle,
            decoration: InputDecoration(
              suffix: const SizedBox(width: 33),
              hintText: widget.placeholder,
              hintStyle: widget.placeholderStyle,
              counterText: "",
              enabledBorder:
                  UnderlineInputBorder(borderSide: widget.enabledBorder),
              focusedBorder:
                  UnderlineInputBorder(borderSide: widget.focusedBorder),
            ),
            maxLength: widget.maxLength,
            obscureText: (widget.isSecureEntry == true ? _isSecure : false),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[ ]')), // 限制不能输入空格
            ],
          ),
        ),

        // 清除按钮
        clearButton(),

        // 显示密码按钮
        _obscureButton(),
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
          visible: (widget.isSecureEntry == true ? false : _showClearBtn),
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

  bool _isSecure = true; // 是否密码安全
  // 显示密码的按钮
  Widget _obscureButton() {
    return Align(
      alignment: Alignment(0.97, 0),
      child: InkWell(
        onTap: () {
          setState(() {
            _isSecure = !_isSecure;
          });
        },
        child: Visibility(
          visible: (widget.controller.text.isEmpty == true
              ? false
              : widget.isSecureEntry),
          child: Container(
            width: 25,
            height: 25,
            child: (_isSecure == true
                ? Image.asset(AssetsPath.secure_text_icon)
                : Image.asset(AssetsPath.insecure_text_icon)),
          ),
        ),
      ),
    );
  }
}
