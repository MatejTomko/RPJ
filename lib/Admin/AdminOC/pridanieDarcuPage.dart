import 'dart:math';

import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

//TODO overovanie rodneho cisla
class pridanieDarcuPage extends StatefulWidget{
  const pridanieDarcuPage({Key? key}) : super(key: key);

  @override
  State<pridanieDarcuPage> createState() => _pridanieDarcuPageState();

}

class _pridanieDarcuPageState extends State<pridanieDarcuPage> {
  final _formKey = GlobalKey<FormBuilderState>();


  var _controlleradresa=TextEditingController();
  //var _controlleremail=TextEditingController();
  var _controlleriddarca=TextEditingController();
  var _controllerkrvnaskupina=TextEditingController();
  var _controllermeno=TextEditingController();
  var _controllerpriezvisko=TextEditingController();
  var _controllerrodnecislo=TextEditingController();



  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Pridávanie darcov"),
          backgroundColor: Colors.red[900],
        ),

        body: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
            primarySwatch: Colors.red,
          ),
          child: Container(
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
                                  const _chars = '1234567890';
                                  Random _rnd = Random();
                                  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
                                      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
                                  _controlleriddarca.text=getRandomString(10);
                                  //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                                  var db=FirebaseFirestore.instance.collection("Darca").add({
                                    "adresa":_controlleradresa.text,
                                    "idDarca":_controlleriddarca.text,
                                    "email":"-",
                                    "krvnaskupina":_controllerkrvnaskupina.text,
                                    "meno":_controllermeno.text,
                                    "priezvisko":_controllerpriezvisko.text,
                                    "rodnecislo":_controllerrodnecislo.text,

                                  });

                                  _controlleradresa.clear();
                                  //_controlleremail.clear();
                                  _controlleriddarca.clear();
                                  _controlleradresa.clear();
                                  _controllerkrvnaskupina.clear();
                                  _controllermeno.clear();
                                  _controllerpriezvisko.clear();
                                  _controllerrodnecislo.clear();
                                  Utils.showSnackBar("Darca pridaný");
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




        )
    );
  }

}