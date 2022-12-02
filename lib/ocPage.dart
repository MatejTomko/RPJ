import 'dart:ffi' as ffi;

import 'package:blood_app/kamennaOC.dart';
import 'package:blood_app/kamennaOCCard.dart';
import 'package:blood_app/lieky.dart';
import 'package:blood_app/liekyCard.dart';
import 'package:blood_app/mobilnaOCCardZaciatocna.dart';
import 'package:blood_app/mobilnaOCZaciatocna.dart';
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

class MyScrollBehaviour extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _ocPageState extends State<ocPage> with SingleTickerProviderStateMixin{
  late TabController tabController;
  List userMobilneOCList= [];
  List userMobilneOCListZaciatocny= [];
  List userKamenneOCList = [];
  dynamic resultantMob;
  dynamic resultantKam;

  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
    tabController = TabController(length: 3,initialIndex: 0, vsync: this);
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
            userMobilneOCListZaciatocny.add(resultantKam[i]['meno']);
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

  /*Future<void> displayMobilneOC()async{
    display=[];
  }

  Future<void> displayKamenneOC()async{
    display=[];
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Odberné centrá"),
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
                      Tab(child: Text("Kamenné")),
                      Tab(child: Text("Mobilné")),
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
              child: Expanded(
                child: ListView.builder(
                    itemCount: userKamenneOCList.length,
                    itemBuilder:(context, index) {
                      kamennaOC koc=new kamennaOC(userKamenneOCList[index]['adresa'],userKamenneOCList[index]['email'],userKamenneOCList[index]['hodinypi'],userKamenneOCList[index]['hodinypo'],userKamenneOCList[index]['hodinysr'],userKamenneOCList[index]['hodinyst'],userKamenneOCList[index]['hodinyut'],userKamenneOCList[index]['informacie'],userKamenneOCList[index]['mapy'],userKamenneOCList[index]['meno'],userKamenneOCList[index]['objednavacie']);
                      return kamennaOCCard(koc);
                    }),
              ),
            ),
            //prvy widget v tomto je prvy tab a druhy je druhy
            Container(
              child: Expanded(
                child: ListView.builder(
                    itemCount: userMobilneOCListZaciatocny.length,
                    itemBuilder:(context, index) {
                      List pomocnyMobilneOC= [];
                      if(resultantMob==null){
                        print('Unable to retrieve');
                      }else{
                          for(var i=0;i< userMobilneOCList.length;i++){
                            if(userMobilneOCList[i]['oc']==userMobilneOCListZaciatocny[index]){
                              pomocnyMobilneOC.add(userMobilneOCList[i]);
                            }
                          }
                        }
                      mobilnaOCZaciatocna mocz=new mobilnaOCZaciatocna(userMobilneOCListZaciatocny[index],pomocnyMobilneOC);
                      return mobilnaOCCardZaciatocna(mocz);
                    }),
              ),
            ),
          ],
        ),
      )
    );
  }
}
