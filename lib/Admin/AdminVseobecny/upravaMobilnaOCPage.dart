import 'dart:ffi' as ffi;

import 'package:blood_app/Admin/AdminVseobecny/upravaVyjazdoveOCcard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOCCard.dart';
import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:blood_app/Navstevnik/Lieky/liekyCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOCcard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOC.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DatabaseManager.dart';

class upravaMobilnaOCPage extends StatefulWidget {
  const upravaMobilnaOCPage({Key? key}) : super(key: key);


  @override
  State<upravaMobilnaOCPage> createState() => _upravaMobilnaOCPageState();
}

class MyScrollBehaviour extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _upravaMobilnaOCPageState extends State<upravaMobilnaOCPage> with SingleTickerProviderStateMixin{
  late TabController tabController;
  List userKamenneOCList= [];
  List userMobilneOCList= [];
  List userVyjazdoveOCList= [];
  dynamic resultantMob;
  dynamic resultantKam;


  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
    tabController = TabController(length: 2,initialIndex: 0, vsync: this);
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
          userVyjazdoveOCList.add(resultantKam[i]['meno']);
        }
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
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Editácia Mobilných OC"),
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
                        Tab(child: Text("Pridávanie")),
                        Tab(child: Text("Úprava")),
                      ],
                    ))
              ],
            ),
          ),
        ),

        body: Theme(
          data: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey)
          ),
          child: TabBarView(
            controller: tabController,
            children: [
              Container(

              ),
              //prvy widget v tomto je prvy tab a druhy je druhy
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: userVyjazdoveOCList.length,
                      itemBuilder:(context, index) {
                        List pomocnyMobilneOC= [];
                        if(resultantMob==null){
                          print('Unable to retrieve');
                        }else{
                          print(resultantMob);
                          for(var i=0;i< userMobilneOCList.length;i++){
                            if(userMobilneOCList[i]['oc']==userVyjazdoveOCList[index]){
                              pomocnyMobilneOC.add(userMobilneOCList[i]);
                            }
                          }
                        }
                        vyjazdoveOC vyjoc=new vyjazdoveOC(userVyjazdoveOCList[index],pomocnyMobilneOC);
                        return upravaVyjazdoveOCcard(vyjoc);
                      }),
                ),
              ),
            ],
          ),
        )
    );
  }
}
