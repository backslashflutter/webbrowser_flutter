import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webbrowser/tabs.dart';

import 'add_company.dart';
import 'main_model.dart';

class FirstPage extends StatelessWidget {
  List<String> companyList = [];
  @override

  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..getLoginInfo(),
      child: MaterialApp(
        title: 'Mypage Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("登録されている企業一覧"),
          ),
          body: Consumer<MainModel>(builder: (context, model, child){
            return ListView(
                children:  [ 
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text(model.loginInfo[1].name),
                      onTap: () {
                        //何かしらの処理
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WebBrowser("日産")),
                        );
                      },
                    ),
                  ),
                  ]
              );
          }
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
        ),
    );
  }
}