import 'dart:ffi';


import 'package:blood_app/Autentifikacia/Utils.dart';
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
  //int _idDarca=1000;
  List userLiekyListPomocny = [];
  List userLiekyListDisplay = [];
  String vyrazHladaj= "";
  bool isImageEnabled=false;
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
          isImageEnabled=true;
          Utils.showSnackBar("Žiaden výsledok");
        }else{
          isImageEnabled=false;
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
      body: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
          primarySwatch: Colors.red,
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5,8,5,8),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    vyrazHladaj=liekController.text;
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    if(vyrazHladaj.length>2){
                      fetchDatabaseList();
                    }else{
                      Utils.showSnackBar("Zadajte minimálne 3 znaky!");
                    }
                  },
                  controller: liekController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Vyhľadaj liek",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          vyrazHladaj=liekController.text;
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          if(vyrazHladaj.length>2){
                            fetchDatabaseList();
                          }else{
                            Utils.showSnackBar("Zadajte minimálne 3 znaky!");
                            //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Zadajte minimálne 3 znaky!")));
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                  ),
                ),
              ),
              /*Container(
                height: 50,
                width: 100,
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: (){
                    vyrazHladaj=liekController.text;
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
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
              ),*/
              Center(
                child:
                isImageEnabled ? Image.asset("assets/no_result2.png",height: 128,width: 128,): SizedBox(height: 0,),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: userLiekyListDisplay.length,
                    itemBuilder:(context, index) {
                      lieky liek1 = new lieky(
                          userLiekyListDisplay[index]['kedy najskôr'],
                          userLiekyListDisplay[index]['liek'],
                          userLiekyListDisplay[index]['môžem darovať'],
                          userLiekyListDisplay[index]['poznámka']);
                      return liekyCard(liek1);
                  }
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
