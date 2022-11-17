import 'dart:ffi';

import 'package:blood_app/kamennaOC.dart';
import 'package:blood_app/kamennaOCCard.dart';
import 'package:blood_app/lieky.dart';
import 'package:blood_app/liekyCard.dart';
import 'package:blood_app/odber.dart';
import 'package:blood_app/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DatabaseManager.dart';

class ocPage extends StatefulWidget {
  const ocPage({Key? key}) : super(key: key);


  @override
  State<ocPage> createState() => _ocPageState();
}

class _ocPageState extends State<ocPage> {
  List userMobilneOCList= [];
  List userKamenneOCList = [];
  List display= [];
  dynamic resultantMob;
  dynamic resultantKam;

  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
    resultantKam = await databaseManager.getKamenneOCList();
    //display=userKamenneOCList;
    if(resultantKam==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultantKam.length;i++){
            userKamenneOCList.add(resultantKam[i]);
        }
        display=userKamenneOCList;
        print(userKamenneOCList.length);
      });
    }

    resultantMob = await databaseManager.getMobilneOCList();
    if(resultantMob==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultantMob.length;i++){
          userMobilneOCList.add(resultantMob[i]);
        }
        print(userMobilneOCList.length);
      });
    }

  }

  Future<void> displayMobilneOC()async{
    display=[];
  }

  Future<void> displayKamenneOC()async{
    display=[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Odberné centrá"),
        backgroundColor: Colors.red[900],
      ),

      body: Container(
        child: Row(
          children: [
            /*Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
              child: TextButton(
                onPressed: (){
                  //TODO prepojenie na home screen;
                },
                child: const Text(
                  "Kamenne",
                  style: TextStyle(color: Colors.white,fontSize: 14),
                ),
              ),
            ),
            /// Mobilne
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
              child: TextButton(
                onPressed: (){
                  //TODO prepojenie na home screen
                },
                child: const Text(
                  "Mobilne",
                  style: TextStyle(color: Colors.white,fontSize: 14),
                ),
              ),
            ),*/

            //TREBA OPRAVIT TIE TLACITKA HORE BO KED ICH ZOBRAZIM TA LISTVIEW SA DOGUBI

            Expanded(
              child: ListView.builder(
                  itemCount: display.length,
                  itemBuilder:(context, index) {
                    kamennaOC koc=new kamennaOC(display[index]['adresa'],display[index]['email'],display[index]['hodinypi'],display[index]['hodinypo'],display[index]['hodinysr'],display[index]['hodinyst'],display[index]['hodinyut'],display[index]['informacie'],display[index]['mapy'],display[index]['meno'],display[index]['objednavacie']);
                    return kamennaOCCard(koc);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
