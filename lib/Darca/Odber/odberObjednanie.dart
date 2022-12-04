import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class odberObjednanie extends StatefulWidget {

  @override
  odberObjednanieState createState() {
    return odberObjednanieState();
  }
}

class odberObjednanieState extends State<odberObjednanie> {
  final _formKey = GlobalKey<FormState>();

  int _idDarca=1000;
  var _controllerdatum=TextEditingController();
  var _controllercas=TextEditingController();

  String _dropDownValue="";
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
                TextFormField(
                  controller: _controllerdatum,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_month),
                    hintText: 'Dátum',
                    labelText: 'Dátum',
                  ),
                  onChanged: ((value) {
                    _datum=value;
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Prosím zadajte dátum';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0,8,8,0),
                  child: DropdownButton(
                      hint: _dropDownValue=="" ?
                      Text('Vyberte odberné centrum')
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

