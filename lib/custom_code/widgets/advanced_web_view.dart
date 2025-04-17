// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets
import 'package:webview_flutter/webview_flutter.dart';

class AdvancedWebView extends StatefulWidget {
  const AdvancedWebView({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String url;
  final double width;
  final double height;

  @override
  State<AdvancedWebView> createState() => _AdvancedWebViewState();
}

class _AdvancedWebViewState extends State<AdvancedWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            // Inject meta tag to prevent zooming
            await _controller.runJavaScript('''
              var meta = document.createElement('meta');
              meta.name = 'viewport';
              meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
              document.getElementsByTagName('head')[0].appendChild(meta);
            ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<bool> _handleBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBack,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
