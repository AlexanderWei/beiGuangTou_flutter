import 'package:flutter/material.dart';
import '../../support_file/common_header.dart';

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
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  LinearProgress _progressIndicator = LinearProgress(
    valueColor: AppConstant.themeYellow,
    minHeight: 1.5,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

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
      body: Stack(children: [
        _progressIndicator,
        WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            LogUtil.v('WebView is loading (progress : $progress%)');

            _progressIndicator.progress.setProgress(progress / 100);
          },
        ),
        _progressIndicator,
      ]),
    );
  }
}
