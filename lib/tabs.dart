import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webbrowser/company.dart';
import 'package:webbrowser/first_page.dart';
import 'package:webbrowser/main_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:io';


// ignore: must_be_immutable
class WebBrowser extends StatelessWidget {

  WebBrowser(this.company);
  Company company;
  @override
  Widget build(BuildContext context) {
    return MyHomePage(company);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.company);
  Company company;
  @override
  _MyHomePageState createState() => _MyHomePageState(company);
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _webViewController;
  bool _canGoBack = false;
  bool _canGoForward = false;

  _MyHomePageState(this.company);
  Company company;

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
          title: Text("${company.name}のマイページ"),
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          var  loginInfo = company;
          return Column(
            children: [
              Expanded(
                child: WebView(
                  initialUrl: "${company.url}",
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
                title: Text("ID : ${company.ID}"),
                onTap: () async {
                  //IDをコピー　＆　コピーしましたのポップ表示　この部分をfirebaseとまず接続したい
                  final clip = ClipboardData(text : company.ID);
                  await Clipboard.setData(clip);
                },
              ),
              ListTile(
                leading: Icon(Icons.copy_rounded),
                title:  Text("password : *************"),
                onTap: () async {
                  //passwordをコピー　＆　コピーしましたのポップ表示
                  final clip = ClipboardData(text : company.password);
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
