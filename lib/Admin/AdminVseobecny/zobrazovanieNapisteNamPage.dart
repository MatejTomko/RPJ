import 'dart:ffi';


import 'package:blood_app/Admin/AdminVseobecny/napisteNam.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaNapisteNamCard.dart';
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

//TODO
//na tie karty treba pridat dajaku farbu ze ktore su uz vybavene bo zbytocne bude ukazovat vsetky napisteNam otazky

class zobrazovanieNapisteNamPage extends StatefulWidget {
  const zobrazovanieNapisteNamPage({Key? key}) : super(key: key);

  @override
  State<zobrazovanieNapisteNamPage> createState() => _zobrazovanieNapisteNamPageState();
}

class _zobrazovanieNapisteNamPageState extends State<zobrazovanieNapisteNamPage> {
  List userNapisteNamList = [];

  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getNapisteNamList();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultant.length;i++){
          userNapisteNamList.add(resultant[i]);
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
                  itemCount: userNapisteNamList.length,
                  itemBuilder:(context, index) {
                    napisteNam nm=new napisteNam(userNapisteNamList[index]['email'], userNapisteNamList[index]['menopriezvisko'], userNapisteNamList[index]['oblast'], userNapisteNamList[index]['sprava']);
                    return upravaNapisteNamCard(nm);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
