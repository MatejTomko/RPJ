import 'dart:ffi' as ffi;

import 'package:blood_app/Admin/AdminVseobecny/upravaOtazkyCard.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaVyjazdoveOCcard.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOCCard.dart';
import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:blood_app/Navstevnik/Lieky/liekyCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOCcard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOC.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:blood_app/Navstevnik/Otazky/otazky.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import '../../DatabaseManager.dart';

class upravaOtazkyPage extends StatefulWidget {
  const upravaOtazkyPage({Key? key}) : super(key: key);


  @override
  State<upravaOtazkyPage> createState() => _upravaOtazkyState();
}

class MyScrollBehaviour extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _upravaOtazkyState extends State<upravaOtazkyPage> with SingleTickerProviderStateMixin{
  final _formKey = GlobalKey<FormBuilderState>();

  var _controllerotazka=TextEditingController();
  var _controllerodpoved=TextEditingController();

  String _otazka="";
  String _odpoved="";

  late TabController tabController;
  List userOtazky= [];
  List userOtazkyId= [];
  dynamic resultantOtz;
  dynamic resultantOtzId;


  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
    tabController = TabController(length: 2,initialIndex: 0, vsync: this);
    _controllerotazka.addListener(() {
      final String text = _otazka;
      _controllerotazka.text = _controllerotazka.value.copyWith(
        text: text,
      ) as String;
    });
    _controllerodpoved.addListener(() {
      final String text = _odpoved;
      _controllerodpoved.text = _controllerodpoved.value.copyWith(
        text: text,
      ) as String;
    });
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{

    resultantOtz = await databaseManager.getOtazkyist();
    resultantOtzId = await databaseManager.getOtazkyListId();
    //display=userKamenneOCList;
    if(resultantOtz==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultantOtz.length;i++){
          userOtazky.add(resultantOtz[i]);
          userOtazkyId.add(resultantOtzId[i]);
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Editácia Otázok FAQ"),
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
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
            primarySwatch: Colors.red,
          ),
          child: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: FormBuilder(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10,2,10,2),
                            decoration: BoxDecoration(
                              color:Colors.black12,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FormBuilderTextField(
                              name:"Otázka",
                              controller: _controllerotazka,
                              cursorColor: Colors.black12,
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.question_mark),
                                hintText: 'Otázka',
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Prosím zadajte otázku';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.fromLTRB(10,2,10,2),
                            decoration: BoxDecoration(
                              color:Colors.black12,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FormBuilderTextField(
                              name:"Odpoveď",
                              controller: _controllerodpoved,
                              cursorColor: Colors.black12,
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.question_answer),
                                hintText: 'Odpoveď',
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Prosím zadajte odpoveď';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),

                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: 250,
                            child: TextButton(
                              style:  TextButton.styleFrom(
                                foregroundColor: Colors.red[100],
                                backgroundColor: Colors.red[900],
                                shape: StadiumBorder(),
                              ),
                              onPressed: () async{
                                if(_formKey.currentState!.validate() ){

                                  //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                                  var db=FirebaseFirestore.instance.collection("Otazky").add({
                                    "otazka":_controllerotazka.text,
                                    "odpoved":_controllerodpoved.text,
                                  });

                                  _controllerotazka.clear();
                                  _controllerodpoved.clear();


                                  Utils.showSnackBar("Otázka odoslaná");
                                }
                              },
                              child: const Text(
                                "Odoslať",
                                style: TextStyle(color: Colors.white,fontSize: 25),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //prvy widget v tomto je prvy tab a druhy je druhy
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: userOtazky.length,
                      itemBuilder:(context, index) {
                        otazky otazky1=new otazky(userOtazky[index]['odpoved'], userOtazky[index]['otazka']);
                        return upravaOtazkyCard(otazky1, userOtazkyId[index]);
                      }),
                ),
              ),
            ],
          ),
        )
    );
  }
}
