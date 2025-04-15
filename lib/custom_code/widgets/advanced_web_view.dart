// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

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
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    final sanitizedUrl =
        widget.url.startsWith('http') ? widget.url : 'https://${widget.url}';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(sanitizedUrl));
  }

  Future<bool> _handleBack() async {
    if (_controller != null && await _controller!.canGoBack()) {
      _controller!.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return WillPopScope(
      onWillPop: _handleBack,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: WebViewWidget(controller: _controller!),
      ),
    );
  }
}
