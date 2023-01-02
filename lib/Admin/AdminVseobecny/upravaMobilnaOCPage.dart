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
import 'package:intl/intl.dart';

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
  final _formKey = GlobalKey<FormState>();

  var _controllermiesto=TextEditingController();
  var _controllercas=TextEditingController();
  var _controllerdatum=TextEditingController();
  var _controllerlat=TextEditingController();
  var _controllerlng=TextEditingController();
  var _controlleroc=TextEditingController();
  String _miesto="";
  String _cas="";
  String _datum=DateTime.now().toString().split(" ")[0];
  String _oc="";
  String _lat="";
  String _lng="";


  late TabController tabController;
  List userKamenneOCList= [];
  List userMobilneOCList= [];
  List userMobilneOCListId=[];
  List userVyjazdoveOCList= [];
  dynamic resultantMob;
  dynamic resultantMob2;
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

    List mobilneDb=await databaseManager.getMobilneOCList();
    resultantMob = mobilneDb[0];
    resultantMob2 = mobilneDb[1];

    if(resultantMob==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultantMob.length;i++){
          userMobilneOCList.add(resultantMob[i]);
          userMobilneOCListId.add(resultantMob2[i]);
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

                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controllermiesto,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.home),
                            hintText: 'Nazov',
                            labelText: 'Nazov',
                          ),
                          onChanged: ((value) {
                            _miesto=value;
                            _controllermiesto.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte názov';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _controllercas,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.timelapse_outlined),
                            hintText: 'Čas',
                            labelText: 'Čas',
                          ),
                          onChanged: ((value) {
                            _cas =value;
                            _controllercas.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte čas';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _controllerlat,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Miesto na mapach Lat',
                            labelText: 'Lat',
                          ),
                          onChanged: ((value) {
                            _lat=value;
                            _controllerlat.text=_lat;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte lokáciu';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _controllerlng,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Miesto na mapach Lng',
                            labelText: 'Lng',
                          ),
                          onChanged: ((value) {
                            _lng=value;
                            _controllerlng.text=_lng;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte lokáciu';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40.0,8,8,0),
                          child: DropdownButton(
                            hint: _oc=="" ?
                            Text('Vyberte OC')
                                :
                            Text(
                                _oc,
                                style: TextStyle(color: Colors.black87)
                            ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.black87),
                            items: ['OC Prešov','OC Poprad'].map((val){
                              return DropdownMenuItem<String>(
                                value:val,
                                child: Text(val),
                              );
                            },
                            ).toList(),
                            onChanged:(val){
                              _oc=val!;
                            } ,

                          ),
                        ),

                        TextField(
                          controller: _controllerdatum,
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_month_outlined),
                            labelText: "Zadajte dátum",
                          ),
                          readOnly: true,
                          onTap: () async{
                            DateTime? zvolenyDatum = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101),
                              selectableDayPredicate: (DateTime date){
                                return true;
                              },

                            );

                            if (zvolenyDatum != null) {
                              String formattedDate = DateFormat('yyyy-MM-dd').format(zvolenyDatum);
                              _datum=zvolenyDatum.toString();
                              _controllerdatum.text = formattedDate;
                            }else{
                              print("Datum nebol zvoleny");
                            }
                          },
                        ),



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

                                if(_controllerdatum.text==""){
                                  String a=DateTime.now().toString().split(" ")[0];
                                  _controllerdatum.text=a;
                                }
                                //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                                var db=FirebaseFirestore.instance.collection("MobilneOC").add({
                                  "cas":_controllercas.text,
                                  "datum":_controllerdatum.text,
                                  "mapy":_controllerlat.text+" "+_controllerlng.text,
                                  "miesto":_controllermiesto.text,
                                  "oc":_controlleroc.text,
                                });

                                _controllerdatum.clear();
                                _controllercas.clear();
                                _controllerlat.clear();
                                _controllerlng.clear();
                                _controllermiesto.clear();


                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mobilna OC odoslana")));
                              }
                            },
                            child: const Text(
                              "Odoslat",
                              style: TextStyle(color: Colors.white,fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 130,
                        ),

                      ],
                    ),
                  ),
                ),



              ),
              //prvy widget v tomto je prvy tab a druhy je druhy
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: userVyjazdoveOCList.length,
                      itemBuilder:(context, index) {
                        List pomocnyMobilneOC= [];
                        List pomocnyMobilneOCid=[];
                        if(resultantMob==null){
                          print('Unable to retrieve');
                        }else{
                          print(resultantMob);
                          for(var i=0;i< userMobilneOCList.length;i++){
                            if(userMobilneOCList[i]['oc']==userVyjazdoveOCList[index]){
                              pomocnyMobilneOC.add(userMobilneOCList[i]);
                              pomocnyMobilneOCid.add(userMobilneOCListId[i]);
                            }
                          }
                        }
                        vyjazdoveOC vyjoc=new vyjazdoveOC(userVyjazdoveOCList[index],pomocnyMobilneOC);
                        return upravaVyjazdoveOCcard(vyjoc, pomocnyMobilneOCid);
                      }),
                ),
              ),
            ],
          ),
        )
    );
  }
}
