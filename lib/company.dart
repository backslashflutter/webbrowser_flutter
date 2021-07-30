import 'package:cloud_firestore/cloud_firestore.dart';

class Company{

  //Companyコレクションの中身を構造体みたいな感じにしておく
  String ID;
  String password;
  String url;
  String name;
  String num;

  Company(DocumentSnapshot<Map<String,dynamic>> doc){
    this.ID = doc.data()["ID"];
    this.password = doc.data()["pass"];
    this.url= doc.data()["url"];
    this.name = doc.data()["name"];
    this.num = doc.data()["num"];
  }
}