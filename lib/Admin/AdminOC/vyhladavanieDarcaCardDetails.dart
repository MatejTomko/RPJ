import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';




class vyhladavanieDarcaCardDetails extends StatelessWidget {
  late final darca _darca;
  final String _darcaid;

  static final _formKey = GlobalKey<FormState>();

  var _controlleradresa=TextEditingController();
  var _controllermeno=TextEditingController();
  var _controllerpriezvisko=TextEditingController();

  String _adresa="";
  String _email="";
  String _idDarca="";
  String _krvnaskupina="";
  String _meno="";
  String _priezvisko="";
  String _rodnecislo="";

  vyhladavanieDarcaCardDetails(this._darca, this._darcaid);


  @override
  Widget build(BuildContext context) {
    _adresa=_darca.adresa;
    _idDarca=_darca.idDarca;
    _email=_darca.email;
    _krvnaskupina=_darca.krvnaskupina;
    _meno=_darca.meno;
    _priezvisko=_darca.priezvisko;
    _rodnecislo=_darca.rodnecislo;


    _controllermeno.text=_meno;
    _controllerpriezvisko.text=_priezvisko;
    _controlleradresa.text=_adresa;


    return Scaffold(
      appBar: AppBar(
        title: Text("Detaily darcu: "),
        backgroundColor: Colors.red[900],
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
          primarySwatch: Colors.red,
        ),
        child: Container(
          margin: EdgeInsets.all(15),
          child:SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      "Meno: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _darca.meno,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Priezvisko: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _darca.priezvisko,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Adresa: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _darca.adresa,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Krvná skupina:",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _darca.krvnaskupina,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "ID darcu: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _darca.idDarca,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Email: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _darca.email,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Rodné číslo: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _darca.rodnecislo,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child:SingleChildScrollView(
                    child: Form(
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
                                onChanged: ((value) {
                                  _meno=value!;
                                  _controllermeno.text=value;
                                }),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Prosím zadajte meno';
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
                                onChanged: ((value) {
                                  _priezvisko=value!;
                                  _controllerpriezvisko.text=value;
                                }),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Prosím zadajte priezvisko';
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
                                onChanged: ((value) {
                                  _adresa=value!;
                                  _controlleradresa.text=value;
                                }),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Prosím zadajte adresu';
                                  }
                                  return null;
                                },
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
                                    String ideckoDoc=_darcaid;

                                    var db=FirebaseFirestore.instance.collection("Darca").doc(ideckoDoc).update({
                                      "meno":_controllermeno.text,
                                      "priezvisko":_controllerpriezvisko.text,
                                      "adresa":_controlleradresa.text,

                                    });
                                    Utils.showSnackBar("Darca upravený");
                                  }
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Upraviť",
                                  style: TextStyle(color: Colors.white,fontSize: 25),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
