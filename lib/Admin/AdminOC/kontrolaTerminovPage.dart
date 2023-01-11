import 'dart:ffi';

import 'package:blood_app/Admin/AdminOC/rezervacia.dart';
import 'package:blood_app/Admin/AdminOC/rezervaciaCard.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DatabaseManager.dart';

//TODO aktualne nastavene na OC Prešov, ale pri autentifikacii sa zmeni
class kontrolaTerminovPage extends StatefulWidget {
  const kontrolaTerminovPage({Key? key}) : super(key: key);

  @override
  State<kontrolaTerminovPage> createState() => _kontrolaTerminovPageState();
}

class _kontrolaTerminovPageState extends State<kontrolaTerminovPage> {
  String _idDarca="1000";
  List userRezervaciaList=[];
  List userDarcaList=[];
  List userRezervaciaListId=[];



  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getRezervaciaList2();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultant[0].length;i++){
          String help=resultant[0][i]['oc'].toString();
          if(help == "OC Prešov" ){
            userRezervaciaList.add(resultant[0][i]);
            userRezervaciaListId.add(resultant[1][i]);
          }
        }
      });
    }

    dynamic resultant2 = await databaseManager.getDarcaList();
    if(resultant2==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultant2.length;i++){
            userDarcaList.add(resultant2[i]);
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Odbery"),
        backgroundColor: Colors.red[900],
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: userRezervaciaList.length,
            itemBuilder:(context, index) {
              String meno="";
              for(var i=0;i<userDarcaList.length;i++){
                if(userDarcaList[i]['idDarca'].toString()==userRezervaciaList[index]['idDarca'].toString()){
                  meno=userDarcaList[i]['meno']+" "+userDarcaList[i]['priezvisko'];
                }
              }
              rezervacia rz=new rezervacia(userRezervaciaList[index]['idDarca'].toString(), userRezervaciaList[index]['oc'], userRezervaciaList[index]['datum'],meno,userRezervaciaList[index]['typ'],userRezervaciaList[index]['vybavene'],userRezervaciaList[index]['cas']);
              return RezervaciaCard(rz,userRezervaciaListId[index]);
            }) ,
      ),
    );
  }
}
