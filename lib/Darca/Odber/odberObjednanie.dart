import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class odberObjednanie extends StatefulWidget {

  @override
  odberObjednanieState createState() {
    return odberObjednanieState();
  }
}

class odberObjednanieState extends State<odberObjednanie> {
  final _formKey = GlobalKey<FormBuilderState>();

  int _idDarca=1000;
  var _controllerdatum=TextEditingController();
  var _controllercas=TextEditingController();

  String _dropDownValue=""; //centre
  String _dropDownValue2=""; // typ odberu
  String _datum="";

  Color getColor(Set<MaterialState> states){
    const Set<MaterialState> interactiveStates=<MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if(states.any(interactiveStates.contains)){
      return Colors.red;
    }
    return Colors.black;
  }


  CollectionReference rezervaciaDb=FirebaseFirestore.instance.collection('Rezervacia');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Objednanie na odber"),
        backgroundColor: Colors.red[900],
      ),
      body:
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                       if (date.weekday == DateTime.saturday) {
                         return false;
                       }
                       return true;
                     },

                   );

                   if (zvolenyDatum != null) {
                     print(zvolenyDatum);
                     String formattedDate = DateFormat('dd. MM. yyyy').format(zvolenyDatum);
                     print(formattedDate);
                     setState(() {
                       if (zvolenyDatum.weekday == DateTime.saturday || zvolenyDatum.weekday == DateTime.saturday) {

                       }
                       _controllerdatum.text = formattedDate;
                     });
                   }else{
                     print("Datum nebol zvoleny");
                   }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0,8,8,0),
                  child: DropdownButton(
                      hint: _dropDownValue=="" ?
                      Text('Zvoľte odberné centrum')
                          :
                      Text(
                          _dropDownValue,
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
                      onChanged: (val){
                        setState(() {
                          _dropDownValue=val!;
                        });
                      }

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0,8,8,0),
                  child: DropdownButton(
                      hint: _dropDownValue2=="" ?
                      Text('Zvoľte typ odberu')
                          :
                      Text(
                          _dropDownValue2,
                          style: TextStyle(color: Colors.black54)
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.black87),
                      items: ['Celá krv','Krvná plazma','Krvné doštičky'].map((val){
                        return DropdownMenuItem<String>(
                          value:val,
                          child: Text(val),
                        );
                      },
                      ).toList(),
                      onChanged: (val){
                        setState(() {
                          _dropDownValue2=val!;
                        });
                      }
                  ),
                ),//TODO pre daneka - nech odosiela do DB typ odberu
                //TODO pridat cas

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
                        await rezervaciaDb.add({
                          'oc':_dropDownValue,
                          'idDarca':_idDarca,
                          'datum':_datum,
                        }).then((value) => print('Rezervacia odoslaná'));
                        _controllerdatum.clear();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Rezervacia odoslaná")));
                      }
                    },
                    child: const Text(
                      "Odoslať",
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

