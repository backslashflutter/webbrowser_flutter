import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webbrowser/identification.dart';

class AddModel extends ChangeNotifier{
  String uuid;
  String url;
  String name;
  String id;
  String password;

  void savePassLocal(name,password) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // int counter = (prefs.getInt('counter') ?? 0) + 1;
  // print('Pressed $counter times.');
  // await prefs.setInt('counter', counter);

  prefs.setString(name,password);
  }

  Future<String> getPassLocal(name) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(name);

  }

  Future add(name,url,id) async {
    this.uuid = await identificationDevice();
    // //usersコレクションにuuidのドキュメントを追加
    // users.add({
    //   "uuid": this.uuid,
    // }).then((value) {
    //   users
    //       .doc(value.id)
    //       .collection("company")
    //       .add({"name": name, "url": url, "ID": id});
    // });
    // users.doc(this.uuid).set();

    final company =
    FirebaseFirestore.instance.collection('users').doc(this.uuid).collection('company');
    
    await company.add({
        'name': name,
        "url" : url,
        "ID" : id,
    });

  }

  
}