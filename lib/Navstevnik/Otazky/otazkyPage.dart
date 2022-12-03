import 'dart:ffi';


import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:blood_app/Navstevnik/Lieky/liekyCard.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:blood_app/Navstevnik/Otazky/otazky.dart';
import 'package:blood_app/Navstevnik/Otazky/otazkyCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DatabaseManager.dart';

class otazkyPage extends StatefulWidget {
  const otazkyPage({Key? key}) : super(key: key);

  @override
  State<otazkyPage> createState() => _otazkyPageState();
}

class _otazkyPageState extends State<otazkyPage> {
  List userOtazkyList = [];
  List userOtazkyListPomocny = [];

  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getOtazkyist();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        userOtazkyListPomocny=resultant;
        for(var i=0;i< userOtazkyListPomocny.length;i++){
          userOtazkyList.add(userOtazkyListPomocny[i]);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otázky"),
        backgroundColor: Colors.red[900],
      ),

      body: Container(
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userOtazkyList.length,
                  itemBuilder:(context, index) {
                    otazky otazky1=new otazky(userOtazkyList[index]['odpoved'], userOtazkyList[index]['otazka']);
                    return otazkyCard(otazky1);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
