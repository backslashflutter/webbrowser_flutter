import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'company.dart';
import 'identification.dart';

class MainModel extends ChangeNotifier{

  List<Company> loginInfo = [];
  String uuid = "";
  StreamSubscription sub;

  Future getLoginInfo() async{
    final snapshot = await FirebaseFirestore.instance.collection('company').get();
    final docs = snapshot.docs;
    final loginInfo = docs.map((doc) => Company(doc)).toList();
    this.loginInfo = loginInfo;
    notifyListeners();
  }

  void getLoginInfoRealTime() async{
    this.uuid = await identificationDevice();
    final snapshot =  FirebaseFirestore.instance.collection('users').doc(this.uuid).collection('company').snapshots();
    sub = snapshot.listen((snapshot){
    final docs = snapshot.docs;
    final loginInfo = docs.map((doc) => Company(doc)).toList();
    this.loginInfo = loginInfo;
    notifyListeners();
    }
    );
  }

  void deleteLoginInfo(company){
      FirebaseFirestore.instance.collection('users').doc(this.uuid).collection('company').doc(company.documentID).delete();
  }

  // dispose は ChangeNotifierが使われなくなるタイミングでよばれる。
  @override
  void dispose(){
    sub.cancel();
    super.dispose();
  }
}