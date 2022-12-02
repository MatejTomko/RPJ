import 'dart:ffi';

import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DatabaseManager.dart';

class odberyPage extends StatefulWidget {
  const odberyPage({Key? key}) : super(key: key);

  @override
  State<odberyPage> createState() => _odberyPageState();
}

class _odberyPageState extends State<odberyPage> {
  String _idDarca="1000";
  List userOdberyListPomocny = [];
  List userOdberyListDisplay = [];


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
        userOdberyListPomocny=resultant;
        for(var i=0;i< userOdberyListPomocny.length;i++){
          String help=userOdberyListPomocny[i]['idDarca'].toString();
          if(help == _idDarca ){
            userOdberyListDisplay.add(userOdberyListPomocny[i]);
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
          itemCount: userOdberyListDisplay.length,
          itemBuilder:(context, index) {
            odber odb1=new odber(userOdberyListDisplay[index]['idDarca'],userOdberyListDisplay[index]['mnozstvo'],userOdberyListDisplay[index]['datum'].toDate());

            return OdberCard(odb1);
          }) ,
        ),
      );
  }
}
