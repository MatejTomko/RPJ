import 'dart:ffi' as ffi;

import 'package:blood_app/Admin/AdminOC/rezervacia.dart';
import 'package:blood_app/Admin/AdminOC/rezervaciaCard.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:blood_app/main.dart';
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

class _kontrolaTerminovPageState extends State<kontrolaTerminovPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  String _idDarca=idDarcu;
  List userRezervaciaListKrv=[];
  List userRezervaciaListPlazma=[];
  List userRezervaciaListDosticky=[];
  List userDarcaList=[];
  List userRezervaciaListIdKrv=[];
  List userRezervaciaListIdPlazma=[];
  List userRezervaciaListIdDosticky=[];



  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
    tabController = TabController(length: 3,initialIndex: 0, vsync: this);
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
          if(help == oc ){
            if(resultant[0][i]['typ']=="Celá krv") {
              userRezervaciaListKrv.add(resultant[0][i]);
              userRezervaciaListIdKrv.add(resultant[1][i]);
            }else if(resultant[0][i]['typ']=="Krvná plazma") {
              userRezervaciaListPlazma.add(resultant[0][i]);
              userRezervaciaListIdPlazma.add(resultant[1][i]);
            }else{
              userRezervaciaListDosticky.add(resultant[0][i]);
              userRezervaciaListIdDosticky.add(resultant[1][i]);
            }
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
      appBar: AppBar(
        title: Text("Termíny"),
        backgroundColor: Colors.red[900],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Expanded(
                  flex: 5,
                  child: TabBar(
                    indicatorColor: Colors.white,
                    controller: tabController,
                    tabs: const [
                      Tab(child: Text("Celá Krv")),
                      Tab(child: Text("Krvná Plazma")),
                      Tab(child: Text("Krvné Doštičky")),
                    ],
                  ))
            ],
          ),
        ),
      ),
      body:Theme(
        data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
        primarySwatch: Colors.red,
      ),
      child:TabBarView(
        controller: tabController,
        children: [
          //prvy tab
          Container(
            child: SafeArea(
              child: ListView.builder(
                  itemCount: userRezervaciaListKrv.length,
                  itemBuilder:(context, index) {
                    String meno="";
                    for(var i=0;i<userDarcaList.length;i++){
                      if(userDarcaList[i]['idDarca'].toString()==userRezervaciaListKrv[index]['idDarca'].toString()){
                        meno=userDarcaList[i]['meno']+" "+userDarcaList[i]['priezvisko'];
                      }
                    }
                    rezervacia rz=new rezervacia(userRezervaciaListKrv[index]['idDarca'].toString(), userRezervaciaListKrv[index]['oc'], userRezervaciaListKrv[index]['datum'],meno,userRezervaciaListKrv[index]['typ'],userRezervaciaListKrv[index]['vybavene'],userRezervaciaListKrv[index]['cas']);
                    return RezervaciaCard(rz,userRezervaciaListIdKrv[index]);
                  }) ,
            ),
          ),
          //druhy tab
          Container(
            child: SafeArea(
              child: ListView.builder(
                  itemCount: userRezervaciaListPlazma.length,
                  itemBuilder:(context, index) {
                    String meno="";
                    for(var i=0;i<userDarcaList.length;i++){
                      if(userDarcaList[i]['idDarca'].toString()==userRezervaciaListPlazma[index]['idDarca'].toString()){
                        meno=userDarcaList[i]['meno']+" "+userDarcaList[i]['priezvisko'];
                      }
                    }
                    rezervacia rz=new rezervacia(userRezervaciaListPlazma[index]['idDarca'].toString(), userRezervaciaListPlazma[index]['oc'], userRezervaciaListPlazma[index]['datum'],meno,userRezervaciaListPlazma[index]['typ'],userRezervaciaListPlazma[index]['vybavene'],userRezervaciaListPlazma[index]['cas']);
                    return RezervaciaCard(rz,userRezervaciaListIdPlazma[index]);
                  }) ,
            ),
          ),
          //treti tab
          Container(
            child: SafeArea(
              child: ListView.builder(
                  itemCount: userRezervaciaListDosticky.length,
                  itemBuilder:(context, index) {
                    String meno="";
                    for(var i=0;i<userDarcaList.length;i++){
                      if(userDarcaList[i]['idDarca'].toString()==userRezervaciaListDosticky[index]['idDarca'].toString()){
                        meno=userDarcaList[i]['meno']+" "+userDarcaList[i]['priezvisko'];
                      }
                    }
                    rezervacia rz=new rezervacia(userRezervaciaListDosticky[index]['idDarca'].toString(), userRezervaciaListDosticky[index]['oc'], userRezervaciaListDosticky[index]['datum'],meno,userRezervaciaListDosticky[index]['typ'],userRezervaciaListDosticky[index]['vybavene'],userRezervaciaListDosticky[index]['cas']);
                    return RezervaciaCard(rz,userRezervaciaListIdDosticky[index]);
                  }) ,
            ),
          ),
        ],
      ),

    ),
    );
  }
}
