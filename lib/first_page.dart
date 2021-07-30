import 'package:flutter/material.dart';
import 'package:webbrowser/tabs.dart';

import 'add_company.dart';

class FirstPage extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Mypage Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("登録されている企業一覧"),
        ),
        body: ListView(
            children:  [ 
              ListTile(
                leading: Icon(Icons.home),
                title: Text('日産'),
                onTap: () {
                  //何かしらの処理
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WebBrowser()),
                  );
                },
              ),
              ]
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // "push"で新規画面に遷移
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                // 遷移先の画面としてリスト追加画面を指定
                return TodoAddPage();
              }),
            );
          },
          child: Icon(Icons.add),
        ),
        ),
      );
  }
}