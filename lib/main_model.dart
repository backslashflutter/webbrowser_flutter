import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'company.dart';

class MainModel extends ChangeNotifier{

  List<Company> loginInfo = [];
  StreamSubscription sub;

  Future getLoginInfo() async{
    final snapshot = await FirebaseFirestore.instance.collection('company').get();
    final docs = snapshot.docs;
    final loginInfo = docs.map((doc) => Company(doc)).toList();
    this.loginInfo = loginInfo;
    notifyListeners();
  }

  void getLoginInfoRealTime(){
    final snapshots = FirebaseFirestore.instance.collection('company').snapshots();
    sub = snapshots.listen((snapshot){
    final docs = snapshot.docs;
    final loginInfo = docs.map((doc) => Company(doc)).toList();
    this.loginInfo = loginInfo;
    notifyListeners();
    }
    );
  }

  void deleteLoginInfo(company){
      FirebaseFirestore.instance.collection('company').doc(company.documentID).delete();
  }

  // dispose は ChangeNotifierが使われなくなるタイミングでよばれる。
  @override
  void dispose(){
    super.dispose();
  }
}