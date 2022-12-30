import 'dart:ffi';


import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:blood_app/Navstevnik/Lieky/liekyCard.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DatabaseManager.dart';

class liekyPage extends StatefulWidget {
  const liekyPage({Key? key}) : super(key: key);

  @override
  State<liekyPage> createState() => _liekyPageState();
}

class _liekyPageState extends State<liekyPage> {
  int _idDarca=1000;
  List userLiekyListPomocny = [];
  List userLiekyListDisplay = [];
  String vyrazHladaj= "";
  TextEditingController liekController = new TextEditingController();

  @override
  void initState() {
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
          if(help.contains(vyrazHladaj)){
            userLiekyListDisplay.add(userLiekyListPomocny[i]);
          }
        }
        if(userLiekyListDisplay.length==0){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Žiaden výsledok")));
        }
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

      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                },
                controller: liekController,
                decoration: const InputDecoration(
                    labelText: "",
                    hintText: "Vyhľadaj liek",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextButton(
                onPressed: (){
                  vyrazHladaj=liekController.text;
                  if(vyrazHladaj.length>2){
                    fetchDatabaseList();
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Zadajte minimálne 3 znaky!")));

                  }
                },
                style: TextButton.styleFrom(
                  shape: const StadiumBorder(
                    side: BorderSide(color: Color.fromRGBO(183, 28, 28, 1), style: BorderStyle.solid),
                  ),
                ),
                child: const Text(
                  "Hľadaj",
                  style: TextStyle(color: Colors.white,fontSize: 25),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: userLiekyListDisplay.length,
                  itemBuilder:(context, index) {
                  lieky liek1=new lieky(userLiekyListDisplay[index]['kedy najskôr'],userLiekyListDisplay[index]['liek'],userLiekyListDisplay[index]['môžem darovať'],userLiekyListDisplay[index]['poznámka']);
                  return liekyCard(liek1);
                }),
            ),
          ],
        ),
      ),
    );
  }
}
