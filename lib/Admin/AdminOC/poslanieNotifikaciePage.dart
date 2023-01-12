import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class poslanieNotifikaciePage extends StatefulWidget{
  const poslanieNotifikaciePage({Key? key}) : super(key: key);

  @override
  State<poslanieNotifikaciePage> createState() => _poslanieNotifikaciePageState();

}

class _poslanieNotifikaciePageState extends State<poslanieNotifikaciePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  var _controllerkrvnaskupina=TextEditingController();




  @override
  void initState() {
    super.initState();

    _controllerkrvnaskupina.addListener(() {
      final String text = _controllerkrvnaskupina.text;
      _controllerkrvnaskupina.value = _controllerkrvnaskupina.value.copyWith(
        text: text,
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Poslanie notifikácie"),
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

                              /*var db=FirebaseFirestore.instance.collection("Darca").add({
                                "krvnaskupina":_controllerkrvnaskupina.text,
                              });*/


                              _controllerkrvnaskupina.clear();



                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Notifikácia odoslaná")));
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