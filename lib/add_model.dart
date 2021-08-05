import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webbrowser/identification.dart';

class AddModel extends ChangeNotifier{
  String uuid;
  Future add(name,url,id) async {
    this.uuid = await identificationDevice();
    final users = FirebaseFirestore.instance.collection('users');
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