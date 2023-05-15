import 'dart:math';

import 'package:blood_app/Admin/AdminOC/darcaCardVyhladavanie.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:czech/czech.dart' as cz;

import '../../DatabaseManager.dart';

//TODO overovanie rodneho cisla
class pridanieDarcuPage2 extends StatefulWidget{
  const pridanieDarcuPage2({Key? key}) : super(key: key);

  @override
  State<pridanieDarcuPage2> createState() => _pridanieDarcuPage2State();

}


class MyScrollBehaviour extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _pridanieDarcuPage2State extends State<pridanieDarcuPage2> with SingleTickerProviderStateMixin{
  final _formKey = GlobalKey<FormBuilderState>();


  var _controlleradresa=TextEditingController();
  //var _controlleremail=TextEditingController();
  var _controlleriddarca=TextEditingController();
  var _controllerkrvnaskupina=TextEditingController();
  var _controllermeno=TextEditingController();
  var _controllerpriezvisko=TextEditingController();
  var _controllerrodnecislo=TextEditingController();
  late TabController tabController;
  bool isImageEnabled=false;
  var _controllerVyhladavanie=TextEditingController();

  List userDarcoviaList=[];
  List userDarcoviaListID=[];
  dynamic resultantDarca;
  dynamic resultantDarcaid;
  String vyrazHladaj="";

  Future<void>_loadResources(bool reload) async{
    fetchDatabaseList3();
  }





  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
    tabController = TabController(length: 2,initialIndex: 0, vsync: this);
    _controlleradresa.addListener(() {
      final String text = _controlleradresa.text;
      _controlleradresa.value = _controlleradresa.value.copyWith(
        text: text,
      );
    });
    /*_controlleremail.addListener(() {
      final String text = _controlleremail.text;
      _controlleremail.value = _controlleremail.value.copyWith(
        text: text,
      );
    });*/
    _controlleriddarca.addListener(() {
      final String text = _controlleriddarca.text;
      _controlleriddarca.value = _controlleriddarca.value.copyWith(
        text: text,
      );
    });
    _controllerkrvnaskupina.addListener(() {
      final String text = _controllerkrvnaskupina.text;
      _controllerkrvnaskupina.value = _controllerkrvnaskupina.value.copyWith(
        text: text,
      );
    });
    _controllermeno.addListener(() {
      final String text = _controllermeno.text;
      _controllermeno.value = _controllermeno.value.copyWith(
        text: text,
      );
    });
    _controllerpriezvisko.addListener(() {
      final String text = _controllerpriezvisko.text;
      _controllerpriezvisko.value = _controllerpriezvisko.value.copyWith(
        text: text,
      );
    });
    _controllerrodnecislo.addListener(() {
      final String text = _controllerrodnecislo.text;
      _controllerrodnecislo.value = _controllerrodnecislo.value.copyWith(
        text: text,
      );
    });
  }

  fetchDatabaseList3() async{
    userDarcoviaList= [];
    userDarcoviaListID=[];

    List resulty=await databaseManager.getDarcaList2();
    resultantDarca = resulty[0];
    resultantDarcaid=resulty[1];
    if(resultantDarca==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        userDarcoviaList=[];
        for(var i=0;i< resultantDarca.length;i++){
          if(resultantDarca[i]["rodnecislo"]==vyrazHladaj){
            userDarcoviaList.add(resultantDarca[i]);
            userDarcoviaListID.add(resultantDarcaid[i]);
          }
        }
        if(userDarcoviaList.length==0){
          print('ano');
          isImageEnabled=true;
          Utils.showSnackBar("Žiaden výsledok");
        }else{
          isImageEnabled=false;
        }
      });
    }
  }

  DatabaseManager databaseManager=new DatabaseManager();
  List rodnecisla=[];

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getDarcaList();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultant.length;i++){
          rodnecisla.add(resultant[i]['rodnecislo']);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Pridávanie darcov"),
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
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
            primarySwatch: Colors.red,
          ),
          child: TabBarView(
              controller: tabController,
            //pridavanie darcu
            children: [Container(
              child:SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10,2,10,2),
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: FormBuilderTextField(
                            name:"Meno",
                            controller: _controllermeno,
                            cursorColor: Colors.black12,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person_outline),
                              hintText: 'Meno',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prosím zadajte meno darcu';
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
                            name:"Priezvisko",
                            controller: _controllerpriezvisko,
                            cursorColor: Colors.black12,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person_outline),
                              hintText: 'Priezvisko',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prosím zadajte priezvisko darcu';
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
                            name:"Adresa",
                            controller: _controlleradresa,
                            cursorColor: Colors.black12,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person_outline),
                              hintText: 'Adresa',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prosím zadajte adresu darcu';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        /*Container(
                              padding: EdgeInsets.fromLTRB(10,2,10,2),
                              decoration: BoxDecoration(
                                color:Colors.black12,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: FormBuilderTextField(
                                name:"Email",
                                controller: _controlleremail,
                                cursorColor: Colors.black12,
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.person_outline),
                                  hintText: 'Email',
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Prosím zadajte email darcu';
                                  }
                                  return null;
                                },
                              ),
                            ),*/
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(10,2,10,2),
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: FormBuilderTextField(
                            name:"Rodné číslo",
                            controller: _controllerrodnecislo,
                            cursorColor: Colors.black12,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person_outline),
                              hintText: 'Rodné číslo',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prosím zadajte rodné číslo darcu';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(12,0,10,2),
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(0,20,0,0),
                                    child: const Text(
                                      "Krvná skupina"
                                      ,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              FormBuilderRadioGroup<String>(
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                    fontSize: 22,
                                  ),
                                  border: InputBorder.none,
                                ),
                                initialValue: null,
                                name: 'krvna_skupina',
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required()]),
                                options:
                                ['A-', 'A+','B-', 'B+','AB-', 'AB+','0-', '0+']
                                    .map((moznosti) => FormBuilderFieldOption(
                                  value: moznosti,
                                  child: Text(moznosti),
                                ))
                                    .toList(growable: false),
                                onChanged: ((value) {
                                  _controllerkrvnaskupina.text=value!;
                                }),
                                controlAffinity: ControlAffinity.trailing,
                              ),
                            ],
                          ),
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
                                if(cz.isCzechPersonalIdNumber(_controllerrodnecislo.text) && !(rodnecisla.contains(_controllerrodnecislo.text))) {
                                  const _chars = '1234567890';
                                  Random _rnd = Random();
                                  String getRandomString(int length) =>
                                      String.fromCharCodes(Iterable.generate(
                                          length, (_) =>
                                          _chars.codeUnitAt(
                                              _rnd.nextInt(_chars.length))));
                                  _controlleriddarca.text =
                                      getRandomString(10);
                                  //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                                  var db = FirebaseFirestore.instance
                                      .collection("Darca").add({
                                    "adresa": _controlleradresa.text,
                                    "idDarca": _controlleriddarca.text,
                                    "email": "-",
                                    "krvnaskupina": _controllerkrvnaskupina
                                        .text,
                                    "meno": _controllermeno.text,
                                    "priezvisko": _controllerpriezvisko.text,
                                    "rodnecislo": _controllerrodnecislo.text,

                                  });

                                  _controlleradresa.clear();
                                  //_controlleremail.clear();
                                  //_controlleriddarca.clear();
                                  _controlleradresa.clear();
                                  _controllerkrvnaskupina.clear();
                                  _controllermeno.clear();
                                  _controllerpriezvisko.clear();
                                  _controllerrodnecislo.clear();
                                  Utils.showSnackBar("Darca pridaný");
                                }else{
                                  Utils.showSnackBar("Neplatné/zaregistrované rodné číslo ");
                                }
                              }
                            },
                            child: const Text(
                              "Pridať",
                              style: TextStyle(color: Colors.white,fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextField(
                          enabled: false,
                          controller: _controlleriddarca,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.person_outline),
                            hintText: 'ID zaregistrovaného darcu',
                            border: InputBorder.none,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),



            ),
              //editacia
              Container(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await _loadResources(true);
                  },
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
                              hintText: "Vyhľadaj Darcu podľa RČ",
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
                              if(vyrazHladaj.length>8){
                                fetchDatabaseList3();
                              }else{
                                Utils.showSnackBar("Zadali ste málo znakov!");
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
                        SizedBox(height: 10,),
                        Center(
                          child:
                          isImageEnabled ? Image.asset("assets/no_result2.png",height: 128,width: 128,): SizedBox(height: 0,),
                        ),

                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: userDarcoviaList.length,
                              itemBuilder:(context, index) {
                                print(userDarcoviaList[index]);
                                userDarcoviaList[index]['pocetodberov']="0";
                                darca dar1=new darca(userDarcoviaList[index]['meno'], userDarcoviaList[index]['adresa'], userDarcoviaList[index]['priezvisko'], userDarcoviaList[index]['idDarca'], userDarcoviaList[index]['krvnaskupina'], userDarcoviaList[index]['pocetodberov'], userDarcoviaList[index]['rodnecislo'], userDarcoviaList[index]['email']);
                                return darcaCardVyhladavanie(dar1,userDarcoviaListID[index].toString());
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ),




        )
    );
  }

}