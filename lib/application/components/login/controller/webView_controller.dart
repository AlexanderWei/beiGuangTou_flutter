import 'package:flutter/material.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({
    Key? key,
    required this.url,
    this.title = "",
    this.isLocalUrl = false,
  }) : super(key: key);

  String title;
  String url;
  bool isLocalUrl;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(AssetsPath.appBar_back),
          onPressed: () {
            NavigatorUtil.pop(context: context);
          },
        ),
        elevation: 0,
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
