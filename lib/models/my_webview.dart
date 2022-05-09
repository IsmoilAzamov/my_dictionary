import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  final String name;
  const WebViewExample({Key? key, required this.name}) : super(key: key);


  @override
  WebViewExampleState createState() => WebViewExampleState(name: name);
}

class WebViewExampleState extends State<WebViewExample> {
  final String name;

  WebViewExampleState({required this.name});
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://data.worldbank.org/country/$name?view=chart',
    );
  }
}