import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddModel extends ChangeNotifier{

  Future add(name,url,id,password) async {
     final company =
     FirebaseFirestore.instance.collection('company');
    
    await company.add({
        'name': name,
        "url" : url,
        "ID" : id,
        "pass" : password,
    });

  }

  
}