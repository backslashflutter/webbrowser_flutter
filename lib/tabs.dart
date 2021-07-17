import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';


class WebBrowser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mypage Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _webViewController;
  bool _canGoBack = false;
  bool _canGoForward = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mypage Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _webViewController?.reload,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: "https://www.google.com",
              javascriptMode: JavascriptMode.unrestricted,
              javascriptChannels: {
                JavascriptChannel(
                  name: "Print",
                  onMessageReceived: (message) {
                    print(message.message);
                  },
                ),
              },
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onPageStarted: (value) {},
              onPageFinished: (value) async {
                _canGoBack = await _webViewController?.canGoBack();
                _canGoForward = await _webViewController?.canGoForward();
                setState(() {});
              },
              onWebResourceError: (error) {
                print("onWebResourceError : $error");
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.copy_rounded),
            title: Text("ID : abcde"),
            onTap: () {
              //IDをコピー　＆　コピーしましたのポップ表示
            },
          ),
          ListTile(
            leading: Icon(Icons.copy_rounded),
            title: Text("Password : 12345"),
            onTap: () {
              //passwordをコピー　＆　コピーしましたのポップ表示
            },
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _canGoBack ? _webViewController?.goBack : null,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: _canGoForward ? _webViewController?.goForward : null,
            ),
          ],
        ),
      ],
    );
  }
}
