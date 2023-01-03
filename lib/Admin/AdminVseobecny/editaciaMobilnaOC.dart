
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCCard.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';
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

//TODO nech to posunie to upravaMobilnaOCPage po updatnuti
//TODO nech ked zadavame daco tak nech to nepreskakju vzdy na prve miesto v inpute
//TODO nech to vie vybrat OC lebo nejde teraz xd

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
                  /*onChanged: ((value) {
                    _miesto=value;
                    _controllermiesto.text=value;
                  }),*/
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
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mobilna OC updatnutá")));
                      }
                      //TODO
                      //hotovo by Matej
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mobilna OC vymazana")));


                      //TODO
                      //Navigator.pushNamed(context, "/upravaMobilnaOCPage");
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

    );
  }
}






