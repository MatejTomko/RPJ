
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCCard.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOC.dart';
import 'package:blood_app/viacPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/main.dart';
import 'package:intl/intl.dart';

//TODO DANEK ked stlacim spat tak to da na prihlasovaciu obrazovku - opravit

//toto je ked kliknes na vyjazdove odbery oc presov
class editaciaMobilnaOC extends StatefulWidget{
  final mobilnaOC _mobilnaOC;
  final String _userMobilnaOcId;
  editaciaMobilnaOC(this._mobilnaOC,this._userMobilnaOcId);

  @override
  editaciaMobilnaOCState createState() {
    return editaciaMobilnaOCState(_mobilnaOC,_userMobilnaOcId);
  }
}

class editaciaMobilnaOCState extends State<editaciaMobilnaOC>{
  final _formKey = GlobalKey<FormState>();
  final mobilnaOC _mobilnaOC;
  final String _userMobilnaOcId;
  int lennazaciatku=1;

  editaciaMobilnaOCState(this._mobilnaOC,this._userMobilnaOcId);

  String _miesto="";
  String _cas="";
  String _datum=DateTime.now().toString().split(" ")[0];
  String _oc="";
  String _lat="";
  String _lng="";

  var _controllermiesto=TextEditingController();
  var _controllercas=TextEditingController();
  var _controllerdatum=TextEditingController();
  var _controllerlat=TextEditingController();
  var _controllerlng=TextEditingController();
  var _controlleroc=TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllermiesto.addListener(() {
      final String text = _miesto;
      _controllermiesto.text = _controllermiesto.value.copyWith(
        text: text,
      ) as String;
    });
  }

  @override
  Widget build(BuildContext context) {


    if(lennazaciatku==1){
      _miesto=_mobilnaOC.miesto;
      _cas=_mobilnaOC.cas;
      _oc=_mobilnaOC.oc;
      _lat=_mobilnaOC.mapy.split(" ")[0];
      _lng=_mobilnaOC.mapy.split(" ")[1];
      _datum=_mobilnaOC.datum;
      lennazaciatku=0;
    }
    print(_userMobilnaOcId);

    _controllercas.text=_cas;
    _controlleroc.text=_oc;
    _controllerlat.text=_lat;
    _controllerlng.text=_lng;
    _controllermiesto.text=_miesto;
    _controllerdatum.text=_datum;

    CollectionReference mobilneocDb=FirebaseFirestore.instance.collection('MobilneOC');

    return Scaffold(
      appBar: AppBar(
        title: Text("Editacia "+_mobilnaOC.miesto),
        backgroundColor: Colors.red[900],
      ),
      body:
      Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
          primarySwatch: Colors.red,
        ),
        child: SingleChildScrollView(
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
                    child: TextFormField(
                      controller: _controllermiesto,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.home),
                        hintText: 'Názov',
                        border: InputBorder.none,
                      ),
                      onChanged: ((value){
                        _miesto=value;
                        _controllermiesto.text=_miesto;
                      }),
                      validator: (value) {
                        if (value!.isEmpty || value == null || value.isEmpty) {
                          return 'Prosím zadajte názov';
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
                    child: TextFormField(
                      controller: _controllercas,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.timelapse_outlined),
                        hintText: 'Čas',
                        border: InputBorder.none,
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
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    decoration: BoxDecoration(
                      color:Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      controller: _controllerlat,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.place),
                        hintText: 'Miesto na mapach Lat',
                        labelText: 'Lat',
                        border: InputBorder.none,
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
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    decoration: BoxDecoration(
                      color:Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      controller: _controllerlng,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.place),
                        hintText: 'Miesto na mapach Lng',
                        labelText: 'Lng',
                        border: InputBorder.none,
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
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    decoration: BoxDecoration(
                      color:Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,8,8,4),
                      child: DropdownButton(
                        underline: Container(),
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
                          setState(() {
                            _oc=val!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    decoration: BoxDecoration(
                      color:Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _controllerdatum,
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_month_outlined),
                        hintText: "Zadajte dátum",
                        border: InputBorder.none,
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
                          String formattedDate = DateFormat('dd.MM.yyyy').format(zvolenyDatum);
                          _datum=zvolenyDatum.toString();
                          _controllerdatum.text = formattedDate;
                        }else{
                          print("Datum nebol zvoleny");
                        }
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

                          if(_controllerdatum.text==""){
                            String a=DateTime.now().toString().split(" ")[0];
                            _controllerdatum.text=a;
                          }
                         var db=FirebaseFirestore.instance.collection("MobilneOC").doc(_userMobilnaOcId).update({
                           "cas":_controllercas.text,
                           "datum":_controllerdatum.text,
                           "mapy":_controllerlat.text+" "+_controllerlng.text,
                           "miesto":_controllermiesto.text,
                           "oc":_controlleroc.text,
                         });
                          _mobilnaOC.miesto=_controllermiesto.text;
                          _mobilnaOC.datum=_controllerdatum.text;
                          _mobilnaOC.mapy=_controllerlat.text+" "+_controllerlng.text;
                          _mobilnaOC.oc=_controlleroc.text;
                          _mobilnaOC.cas=_controllercas.text;
                          //_controllerdatum.clear();
                          Utils.showSnackBar("Mobilna OC updatnutá");
                        }

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Update",
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
                        await FirebaseFirestore.instance.collection("MobilneOC").doc(_userMobilnaOcId).delete();
                        Utils.showSnackBar("Mobilna OC vymazaná");
                        //TODO
                        //Navigator.pushNamed(context, "/upravaMobilnaOCPage");

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Vymaž OC",
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

    );
  }
}






