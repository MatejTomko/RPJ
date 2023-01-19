import 'dart:ffi' as ffi;


import 'package:blood_app/Admin/AdminVseobecny/napisteNam.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaNapisteNamCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/main.dart';


import '../../DatabaseManager.dart';

//TODO
//na tie karty treba pridat dajaku farbu ze ktore su uz vybavene bo zbytocne bude ukazovat vsetky napisteNam otazky

class zobrazovanieNapisteNamPage extends StatefulWidget {
  const zobrazovanieNapisteNamPage({Key? key}) : super(key: key);

  @override
  State<zobrazovanieNapisteNamPage> createState() => _zobrazovanieNapisteNamPageState();
}

class _zobrazovanieNapisteNamPageState extends State<zobrazovanieNapisteNamPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List userNapisteNamListMed = [];
  List userNapisteNamListMedId = [];
  List userNapisteNamListTec = [];
  List userNapisteNamListTecId = [];
  List userNapisteNamListIne = [];
  List userNapisteNamListIneId = [];

  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
    tabController = TabController(length: 3,initialIndex: 0, vsync: this);
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getNapisteNamList2();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultant[0].length;i++){
          if(resultant[0][i]['oblast']=="Medicínska oblasť") {
            userNapisteNamListMed.add(resultant[0][i]);
            userNapisteNamListMedId.add(resultant[1][i]);
          }else if(resultant[0][i]['oblast']=="Technická podpora") {
            userNapisteNamListTec.add(resultant[0][i]);
            userNapisteNamListTecId.add(resultant[1][i]);
          }else{
            userNapisteNamListIne.add(resultant[0][i]);
            userNapisteNamListIneId.add(resultant[1][i]);
          }
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
                      Tab(child: Text("Medicínska oblasť")),
                      Tab(child: Text("Technická podpora")),
                      Tab(child: Text("Iné")),
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
            Container(
              child: SafeArea(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userNapisteNamListMed.length,
                  itemBuilder:(context, index) {
                    napisteNam nm=new napisteNam(userNapisteNamListMed[index]['email'], userNapisteNamListMed[index]['menopriezvisko'], userNapisteNamListMed[index]['oblast'], userNapisteNamListMed[index]['sprava']);
                    return upravaNapisteNamCard(nm,userNapisteNamListMedId[index]);
                  }),
            ),
            ),
            Container(
              child: SafeArea(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: userNapisteNamListTec.length,
                    itemBuilder:(context, index) {
                      napisteNam nm=new napisteNam(userNapisteNamListTec[index]['email'], userNapisteNamListTec[index]['menopriezvisko'], userNapisteNamListTec[index]['oblast'], userNapisteNamListTec[index]['sprava']);
                      return upravaNapisteNamCard(nm,userNapisteNamListTecId[index]);
                    }),
              ),
            ),
            Container(
              child: SafeArea(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: userNapisteNamListIne.length,
                    itemBuilder:(context, index) {
                      napisteNam nm=new napisteNam(userNapisteNamListIne[index]['email'], userNapisteNamListIne[index]['menopriezvisko'], userNapisteNamListIne[index]['oblast'], userNapisteNamListIne[index]['sprava']);
                      return upravaNapisteNamCard(nm,userNapisteNamListIneId[index]);
                    }),
              ),
            ),
          ],

      ),
    ),
    );
  }
}
