import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_model.dart';

// リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: Scaffold(
        appBar: AppBar(
            title: Text("新規企業登録"),
          ),
        body: Consumer<AddModel>(builder: (context, model, child){
          return SingleChildScrollView(
            child: Center(
              child: Container(
                height: 1200,
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
                          model.name = value;
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
                          model.url = value;
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
                          model.id = value;
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextField(
                      enabled: true,
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      maxLines:1 ,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.password),
                        hintText: 'パスワードを教えてください',
                      ),
                      onChanged: (value) {
                          model.password = value;
                      }
                    ),
                  ),
                  SizedBox(height:20),
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
                            if(model.name!=null && model.url!=null && model.id!=null && model.password!=null){
                            await model.add(model.name,model.url,model.id);
                            model.savePassLocal(model.name,model.password);

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
                    SizedBox(height:20),
                  ],
                ),
              ),
            ),
          );
        }
        ),
      ),
    );
  }
  }