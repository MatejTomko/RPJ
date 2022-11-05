import 'dart:ffi';

import 'package:blood_app/odber.dart';
import 'package:blood_app/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DatabaseManager.dart';

class odberyPage extends StatefulWidget {
  const odberyPage({Key? key}) : super(key: key);

  @override
  State<odberyPage> createState() => _odberyPageState();
}

class _odberyPageState extends State<odberyPage> {
  int _idDarca=1000;
  List userOdberyList = [];


  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getOdberList();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        userOdberyList=resultant;
        for(var i=0;i< userOdberyList.length;i++){
          String help=userOdberyList[i]['idDarca'].toString();
          if(help != "1000"){
            userOdberyList.remove(userOdberyList[i]);
          }
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Odbery"),
        backgroundColor: Colors.red[900],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: userOdberyList.length,
          itemBuilder:(context, index) {
            odber odb1=new odber(userOdberyList[index]['idDarca'],userOdberyList[index]['mnozstvo'],userOdberyList[index]['datum'].toDate());

            return OdberCard(odb1);
          }) ,
        ),
      );
  }
}
