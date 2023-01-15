import 'dart:ffi';

import 'package:blood_app/Admin/AdminOC/pridavanieOdberuPage.dart';
import 'package:blood_app/Admin/AdminOC/rezervacia.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';




class rezervaciaCardDetails extends StatelessWidget {
  late final rezervacia _rezevacia;
  final String _rezervaciaId;

  final _formKey = GlobalKey<FormState>();

  var _controllervybavene=TextEditingController();
  String _vybavene="";



  rezervaciaCardDetails(this._rezevacia,this._rezervaciaId);



  @override
  Widget build(BuildContext context) {
    _vybavene=_rezevacia.vybavene;
    _controllervybavene.text=_vybavene;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Detaily Rezervacia/Uprava rezervacie: "),
        backgroundColor: Colors.red[900],
      ),
      body:Theme(
        data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
        primarySwatch: Colors.red,
      ),
      child:Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child:
                SingleChildScrollView(
                  child:FormBuilder(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [

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
                                        "Vybavene"
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
                                  initialValue: _vybavene,
                                  name: 'vybavene',
                                  validator: FormBuilderValidators.compose(
                                      [FormBuilderValidators.required()]),
                                  options:
                                  ['Áno', 'Nie']
                                      .map((moznosti) => FormBuilderFieldOption(
                                    value: moznosti,
                                    child: Text(moznosti),
                                  ))
                                      .toList(growable: false),
                                  onChanged: ((value) {
                                    _vybavene =value!;
                                    _controllervybavene.text=value;
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
                                print(_rezervaciaId);
                                print(_vybavene);

                                  /*if(_controllerdatum.text==""){
                                String a=DateTime.now().toString().split(" ")[0];
                                _controllerdatum.text=a;
                              }*/
                                  //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                                  var db=FirebaseFirestore.instance.collection("Rezervacia").doc(_rezervaciaId).update({
                                    "vybavene":_controllervybavene.text,
                                  });

                                  Utils.showSnackBar("Rezervacia upravená");
                              },
                              child: const Text(
                                "Upraviť",
                                style: TextStyle(color: Colors.white,fontSize: 25),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 130,
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

                                await FirebaseFirestore.instance.collection("Rezervacia").doc(_rezervaciaId).delete();
                                Utils.showSnackBar("Rezervacia vymazaná");

                                //TODO
                                //Navigator.pushNamed(context, "/pridavanieodberupage");
                              },
                              child: const Text(
                                "Vymaž rezervaciu",
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
            SizedBox(height: 20),
          ],
        ),
      ),
    ),
    );
  }
}
