import 'dart:ffi';

import 'package:blood_app/lieky.dart';
import 'package:blood_app/liekyCard.dart';
import 'package:blood_app/odber.dart';
import 'package:blood_app/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DatabaseManager.dart';

class liekyPage extends StatefulWidget {
  const liekyPage({Key? key}) : super(key: key);

  @override
  State<liekyPage> createState() => _liekyPageState();
}

class _liekyPageState extends State<liekyPage> {
  int _idDarca=1000;
  List userLiekyListPomocny = [];
  List userLiekyListDisplay = [];


  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getLiekyList();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        userLiekyListDisplay = [];
        userLiekyListPomocny=resultant;
        for(var i=0;i< userLiekyListPomocny.length;i++){
          String help=userLiekyListPomocny[i]['liek'].toString().toLowerCase();
          if(help.contains("sumamed")){
            userLiekyListDisplay.add(userLiekyListPomocny[i]);
          }
        }
        print(userLiekyListDisplay.length);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lieky"),
        backgroundColor: Colors.red[900],
      ),

      body: SafeArea(
        child: ListView.builder(
            itemCount: userLiekyListDisplay.length,
            itemBuilder:(context, index) {
              lieky liek1=new lieky(userLiekyListDisplay[index]['kedy najskôr'],userLiekyListDisplay[index]['liek'],userLiekyListDisplay[index]['môžem darovať'],userLiekyListDisplay[index]['poznámka']);

              return liekyCard(liek1);
            }) ,
      ),
    );
  }
}
