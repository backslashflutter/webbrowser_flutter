import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                enabled: true,
                // 入力数
                maxLength: 20,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines:1 ,
                decoration: const InputDecoration(
                  icon: Icon(Icons.house),
                  hintText: '企業名を教えてください',
                  labelText: '企業名 *',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                enabled: true,
                // 入力数
                maxLength: 20,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines:1 ,
                decoration: const InputDecoration(
                  icon: Icon(Icons.assignment_ind),
                  hintText: 'IDを教えてください',
                  labelText: 'ID *',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                enabled: true,
                // 入力数
                maxLength: 20,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines:1 ,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'パスワードを教えてください',
                  labelText: 'Password *',
                ),
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
                    onPressed: () {
                      // Firebaseに登録する用の関数
                    },
                    child: Text('登録！！'),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}