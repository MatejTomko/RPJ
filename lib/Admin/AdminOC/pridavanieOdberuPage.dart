import 'dart:ffi' as ffi;
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Admin/AdminOC/odberCardVyhladavanie.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../DatabaseManager.dart';

class pridavanieOdberuPage extends StatefulWidget {
  const pridavanieOdberuPage({Key? key}) : super(key: key);


  @override
  State<pridavanieOdberuPage> createState() => _pridavanieOdberuPageState();
}

class MyScrollBehaviour extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _pridavanieOdberuPageState extends State<pridavanieOdberuPage> with SingleTickerProviderStateMixin{
  final _formKey = GlobalKey<FormState>();

  var _controllerautoodber=TextEditingController();
  var _controlleridDarca=TextEditingController();
  var _controllerdatum=TextEditingController();
  var _controllerkomplikacia=TextEditingController();
  var _controllerkoniec=TextEditingController();
  var _controllermnozstvo=TextEditingController();
  var _controllertlakkrvi=TextEditingController();
  var _controllertrvanie=TextEditingController();
  var _controllertyp=TextEditingController();
  var _controllervyjazd=TextEditingController();
  var _controllerzaciatok=TextEditingController();


  var _controllerVyhladavanie=TextEditingController();
  String vyrazHladaj="";

  String _autoodber="";
  String _idDarca="";
  //String _datum=DateTime.now().toString().split(" ")[0];
  String _datum=DateTime.now().toString();
  String _komplikacia="";
  String _koniec="";
  String _mnozstvo="";
  String _tlakkrvi="";
  String _trvanie="";
  String _typ="";
  String _vyjazd="";
  String _zaciatok="";


  late TabController tabController;
  List userOdberyList= [];
  dynamic resultant;



  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
    tabController = TabController(length: 2,initialIndex: 0, vsync: this);
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{

    resultant = await databaseManager.getOdberList();
    //display=userKamenneOCList;
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        userOdberyList=[];
        for(var i=0;i< resultant.length;i++){
          if(resultant[i]["idDarca"]==vyrazHladaj){
            userOdberyList.add(resultant[i]);
          }
        }
      });
    }



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Editacia odberov"),
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
                        Tab(child: Text("Výhľadavanie a úprava")),
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
                child:SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controlleridDarca,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.home),
                            hintText: 'idDarca',
                            labelText: 'idDarca',
                          ),
                          onChanged: ((value) {
                            _idDarca=value;
                            _controlleridDarca.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte id darcu';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _controllerautoodber,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.timelapse_outlined),
                            hintText: 'Čas',
                            labelText: 'Čas',
                          ),
                          onChanged: ((value) {
                            _autoodber =value;
                            _controllerautoodber.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte či sa jedná o auto odber';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Typ odberu',
                            labelText: 'Typ odberu',
                          ),
                          onChanged: ((value) {
                            _typ=value;
                            _controllertyp.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte typ odberu';
                            }
                            return null;
                          },
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
                              print("Dátum nebol zvolený");
                            }
                          },
                        ),

                        TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Komplikácia pri odbere',
                            labelText: 'Komplikácia',
                          ),
                          onChanged: ((value) {
                            _komplikacia=value;
                            _controllerkomplikacia.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte typ komplikáciu';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Začiatok odberu',
                            labelText: 'Začiatok odberu',
                          ),
                          onChanged: ((value) {
                            _zaciatok=value;
                            _controllerzaciatok.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte začiatok odberu';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Koniec odberu',
                            labelText: 'Koniec odberu',
                          ),
                          onChanged: ((value) {
                            _koniec=value;
                            _controllerkoniec.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte koniec odberu';
                            }
                            return null;
                          },
                        ),


                        TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Množstvo odberu',
                            labelText: 'Množstvo odberu',
                          ),
                          onChanged: ((value) {
                            _mnozstvo=value;
                            _controllermnozstvo.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte množstvo odberu';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Tlak krvi',
                            labelText: 'Tlak krvi',
                          ),
                          onChanged: ((value) {
                            _tlakkrvi=value;
                            _controllertlakkrvi.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte tlak krvi';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Trvanie odberu',
                            labelText: 'Trvanie odberu',
                          ),
                          onChanged: ((value) {
                            _trvanie=value;
                            _controllertrvanie.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte trvanie odberu';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Výjazd',
                            labelText: 'Výjazd',
                          ),
                          onChanged: ((value) {
                            _vyjazd=value;
                            _controllervyjazd.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte výjazd';
                            }
                            return null;
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

                                /*if(_controllerdatum.text==""){
                                  String a=DateTime.now().toString().split(" ")[0];
                                  _controllerdatum.text=a;
                                }*/
                                //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                                var db=FirebaseFirestore.instance.collection("Odber").add({
                                  "datum":_controllerdatum.text,
                                  "idDarca":_controlleridDarca.text,
                                  "vyjazd":_controllervyjazd.text,
                                  "trvanie":_controllertrvanie.text,
                                  "tlakkrvi":_controllertlakkrvi.text,
                                  "mnozstvo":_controllermnozstvo.text,
                                  "koniec":_controllerkoniec.text,
                                  "zaciatok":_controllerzaciatok.text,
                                  "komplikacia":_controllerkomplikacia.text,
                                  "autoodber":_controllerautoodber.text,
                                  "typ":_controllertyp.text,
                                });

                                _controllerdatum.clear();
                                _controllervyjazd.clear();
                                _controllertrvanie.clear();
                                _controllertlakkrvi.clear();
                                _controllermnozstvo.clear();
                                _controllerkoniec.clear();
                                _controllerzaciatok.clear();
                                _controllerkomplikacia.clear();
                                _controlleridDarca.clear();
                                _controllerautoodber.clear();
                                _controllertyp.clear();

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Odber pridaný")));
                              }
                            },
                            child: const Text(
                              "Pridať",
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



              ),

              //prvy widget v tomto je prvy tab a druhy je druhy
              Container(
                child: Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                          },
                          controller: _controllerVyhladavanie,
                          decoration: const InputDecoration(
                            labelText: "",
                            hintText: "Vyhľadaj Odber podľa ID darcu",
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
                            vyrazHladaj=_controllerVyhladavanie.text;
                            if(vyrazHladaj.length>2){
                              fetchDatabaseList();
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
                            itemCount: userOdberyList.length,
                            itemBuilder:(context, index) {
                              odber odb1=new odber(userOdberyList[index]['idDarca'],userOdberyList[index]['mnozstvo'],userOdberyList[index]['datum'].toDate(),userOdberyList[index]['typ'],userOdberyList[index]['autoodber'],userOdberyList[index]['komplikacia'],userOdberyList[index]['koniec'],userOdberyList[index]['tlakkrvi'],userOdberyList[index]['vyjazd'],userOdberyList[index]['zaciatok'],userOdberyList[index]['trvanie']);
                              return OdberCardVyhladavanie(odb1);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
