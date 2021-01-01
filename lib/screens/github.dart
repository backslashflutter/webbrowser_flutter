import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GithubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Github",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://github.com",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
