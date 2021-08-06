import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:webbrowser/first_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //initializeは必要
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebBrowser',
      home: FirstPage(),
    );
  }
}
