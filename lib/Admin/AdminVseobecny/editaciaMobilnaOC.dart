import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:intl/intl.dart';

//toto je ked kliknes na vyjazdove odbery oc presov
class editaciaMobilnaOC extends StatefulWidget{
  final mobilnaOC _mobilnaOC;
  editaciaMobilnaOC(this._mobilnaOC);

  @override
  editaciaMobilnaOCState createState() {
    return editaciaMobilnaOCState(_mobilnaOC);
  }
}

class editaciaMobilnaOCState extends State<editaciaMobilnaOC>{
  final _formKey = GlobalKey<FormState>();
  final mobilnaOC _mobilnaOC;
  int lennazaciatku=1;

  editaciaMobilnaOCState(this._mobilnaOC);

  String _miesto="";
  String _cas="";
  DateTime _datum=DateTime.now();
  String _oc="";
  String _mapy="";
  var _controllermiesto=TextEditingController();
  var _controllercas=TextEditingController();
  var _controllerdatum=TextEditingController();
  var _controllermapy=TextEditingController();
  var _controlleroc=TextEditingController();



  @override
  Widget build(BuildContext context) {

    if(lennazaciatku==1){
      _miesto=_mobilnaOC.miesto;
      _cas=_mobilnaOC.cas;
      _oc=_mobilnaOC.oc;
      _mapy=_mobilnaOC.mapy;
      _datum=_mobilnaOC.datum;
      lennazaciatku=0;
    }

    _controllercas.text=_cas;
    _controlleroc.text=_oc;
    _controllermapy.text=_mapy;
    _controllermiesto.text=_miesto;

    CollectionReference mobilneocDb=FirebaseFirestore.instance.collection('MobilneOC');

    return Scaffold(
      appBar: AppBar(
        title: Text("Editacia "+_mobilnaOC.miesto),
        backgroundColor: Colors.red[900],
      ),


      body:
      SingleChildScrollView(
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
                  controller: _controllermapy,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.place),
                    hintText: 'Miesto na mapach',
                    labelText: 'Mapy',
                  ),
                  onChanged: ((value) {
                    _mapy=value;
                    _controllermapy.text=_mapy;
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
                      String formattedDate = DateFormat('dd. MM. yyyy').format(zvolenyDatum);
                      _datum=zvolenyDatum;
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
                          _controllerdatum.text=DateTime.now().toString();
                        }
                        //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                       var db=FirebaseFirestore.instance.collection("MobilneOC").doc("1").update({
                         "cas":_controllercas.text,
                         "datum":_controllerdatum.text,
                         "mapy":_controllermapy.text,
                         "miesto":_controllermiesto.text,
                         "oc":_controlleroc.text,
                       });
                        //_controllerdatum.clear();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mobilna OC updatnutá")));
                      }
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

              ],
            ),
          ),
        ),
      ),

    );
  }
}






