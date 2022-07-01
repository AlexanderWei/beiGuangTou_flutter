import 'package:flutter/material.dart';

class WebViewController extends StatefulWidget {
  WebViewController({
    Key? key,
    required this.url,
    this.title = "",
    this.isLocalUrl = false,
  }) : super(key: key);

  String title;
  String url;
  bool isLocalUrl;

  @override
  State<WebViewController> createState() => _WebViewControllerState();
}

class _WebViewControllerState extends State<WebViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
