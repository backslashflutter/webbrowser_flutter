import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'company.dart';

class MainModel extends ChangeNotifier{

  List<Company> loginInfo = [];
  Future getLoginInfo() async{
    final snapshot = await FirebaseFirestore.instance.collection('company').get();
    final docs = snapshot.docs;
    final loginInfo = docs.map((doc) => Company(doc)).toList();
    this.loginInfo = loginInfo;
    notifyListeners();
  }
  // dispose は ChangeNotifierが使われなくなるタイミングでよばれる。
  @override
  void dispose(){
    super.dispose();
  }
}