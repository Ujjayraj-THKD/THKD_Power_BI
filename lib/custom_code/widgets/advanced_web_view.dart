// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:webview_flutter/webview_flutter.dart';

/// basic webview with fuction no navigate forward and back using app back
/// buttion or gestures
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
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<bool> _handleBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false; // Don't pop the page
    }
    return true; // Pop the page
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
