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
        child: TextButton(
          // ボタンをクリックした時の処理
          onPressed: () {
            // "pop"で前の画面に戻る
            Navigator.of(context).pop();
          },
          child: Text('リスト追加画面（クリックで戻る）'),
        ),
      ),
    );
  }
}