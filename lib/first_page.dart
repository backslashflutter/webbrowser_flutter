import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webbrowser/identification.dart';
import 'package:webbrowser/save_password_local.dart';
import 'package:webbrowser/tabs.dart';

import 'add_company.dart';
import 'main_model.dart';
import "identification.dart";

class FirstPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    identificationDevice();
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..getLoginInfoRealTime(),
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
            final companyList = model.loginInfo;
            print("###############");
            print(model.uuid);
            print("###############");
            return ListView(
                children: companyList.map(
                 (company) =>  Card(
                   child: ListTile(
                        leading: Icon(Icons.home),
                        title: Text(company.name),
                        trailing:  IconButton(
                                      onPressed: () {
                                        showDialog( 
                                        context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              title: Text("削除しますか？"),
                                              children: <Widget>[
                                                // コンテンツ領域
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    SimpleDialogOption(
                                                      onPressed: (){
                                                        model.deleteLoginInfo(company);
                                                        deletePassLocal(company.name);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("はい"),
                                                    ),
                                                     SimpleDialogOption(
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("いいえ"),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.delete_forever,
                                    ),
                        ),
                        onTap: () async {
                          //何かしらの処理
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WebBrowser(company)),
                          );
                        },
                      ),
                 ),
                  ).toList(),
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