import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWrapper extends StatefulWidget {
  WebWrapper({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _WebWrapperState createState() => _WebWrapperState();
}

class _WebWrapperState extends State<WebWrapper> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: "random",
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
