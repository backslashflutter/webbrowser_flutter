import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webbrowser/first_page.dart';
import 'package:webbrowser/main_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:io';


class WebBrowser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
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
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..getLoginInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Mypage Manager'),
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          var  loginInfo = model.loginInfo;
          return Column(
            children: [
              Expanded(
                child: WebView(
                  initialUrl: "${loginInfo[1].url}",
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
                title: loginInfo.isNotEmpty ? Text("ID : ${loginInfo[1].ID}"):Text(""),
                onTap: () async {
                  //IDをコピー　＆　コピーしましたのポップ表示　この部分をfirebaseとまず接続したい
                  final clip = ClipboardData(text : loginInfo[1].ID);
                  await Clipboard.setData(clip);
                },
              ),
              ListTile(
                leading: Icon(Icons.copy_rounded),
                title: loginInfo.isNotEmpty ? Text("password : *************"):Text(""),
                onTap: () async {
                  //passwordをコピー　＆　コピーしましたのポップ表示
                  final clip = ClipboardData(text : loginInfo[1].password);
                  await Clipboard.setData(clip);
                },
              ),
            ],
          );
        }
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
      ),
    );
  }
}
