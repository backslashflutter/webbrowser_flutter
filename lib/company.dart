import 'package:cloud_firestore/cloud_firestore.dart';

class Company{

  //Companyコレクションの中身を構造体みたいな感じにしておく
  String id;
  String url;
  String name;
  String documentID;

  Company(DocumentSnapshot<Map<String,dynamic>> doc){
    this.documentID = doc.id;
    this.id = doc.data()["ID"];
    this.url= doc.data()["url"];
    this.name = doc.data()["name"];
  }
}