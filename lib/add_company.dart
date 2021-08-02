import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_model.dart';

// // リスト一覧画面用Widget
// class TodoListPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('リスト一覧画面'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // "push"で新規画面に遷移
//           Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) {
//               // 遷移先の画面としてリスト追加画面を指定
//               return TodoAddPage();
//             }),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {
  String url;
  String name;
  String id;
  String password;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: Scaffold(
        appBar: AppBar(
            title: Text("新規企業登録"),
          ),
        body: Consumer<AddModel>(builder: (context, model, child){
          return Center(
            child: Container(
              child: Column(
                children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    enabled: true,
                    style: TextStyle(color: Colors.black),
                    obscureText: false,
                    maxLines:1 ,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.house),
                      hintText: '企業名を教えてください',
                    ),
                    onChanged: (value) {
                        name = value;
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    enabled: true,
                    style: TextStyle(color: Colors.black),
                    obscureText: false,
                    maxLines:1 ,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.my_library_books),
                      hintText: 'マイページのurlを教えてください',
                    ),
                    onChanged: (value) {
                        url = value;
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    enabled: true,
                    style: TextStyle(color: Colors.black),
                    obscureText: false,
                    maxLines:1 ,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_ind),
                      hintText: 'IDを教えてください',
                    ),
                    onChanged: (value) {
                        id = value;
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    enabled: true,
              
                    maxLengthEnforced: false,
                    style: TextStyle(color: Colors.black),
                    obscureText: true,
                    maxLines:1 ,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      hintText: 'パスワードを教えてください',
                    ),
                    onChanged: (value) {
                        password = value;
                    }
                  ),
                ),
                Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        // ボタンをクリックした時の処理
                        onPressed: () {
                          // "pop"で前の画面に戻る
                          Navigator.of(context).pop();
                        },
                        child: Text('企業選択画面に戻る'),
                      ),
                      TextButton(
                        // ボタンをクリックした時の処理
                        onPressed: () async{
                          // Firebaseに登録する用の関数
                          if(name!=null && url!=null && id!=null && password!=null){
                          await model.add(name,url,id,password);
                                                showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("登録完了"),
                            children: <Widget>[
                              // コンテンツ領域
                              SimpleDialogOption(
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                          }else{
                            showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("入力されていない項目があります"),
                            children: <Widget>[
                              // コンテンツ領域
                              // SimpleDialogOption(
                              //   onPressed: () => Navigator.pop(context),
                              //   child: Text("１項目目"),
                              // ),
                            ],
                          );
                        },
                      );
                          }
                          //確認画面表示
                        },
                        child: Text('登録！！'),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        }
        ),
      ),
    );
  }
  }