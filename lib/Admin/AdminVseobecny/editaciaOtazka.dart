import 'package:blood_app/Navstevnik/Otazky/otazky.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


//TODO nech to posunie to upravaOtazkyPage po updatnuti
//TODO nech ked zadavame daco tak nech to nepreskakju vzdy na prve miesto v inpute

class editaciaOtazka extends StatefulWidget{
  final otazky _otazky;
  final String _userOtazkaId;

  editaciaOtazka(this._otazky,this._userOtazkaId);

  @override
  editaciaOtazkaState createState() {
    return editaciaOtazkaState(_otazky,_userOtazkaId);
  }
}

class editaciaOtazkaState extends State<editaciaOtazka>{
  final _formKey = GlobalKey<FormState>();
  final otazky _otazky;
  final String _userOtazkaId;
  int lennazaciatku=1;

  editaciaOtazkaState(this._otazky,this._userOtazkaId);

  String _otazka="";
  String _odpoved="";
  var _controllerotazka=TextEditingController();
  var _controllerodpoved=TextEditingController();




  @override
  Widget build(BuildContext context) {


    if(lennazaciatku==1){
      _otazka=_otazky.otazka;
      _odpoved=_otazky.odpoved;

      lennazaciatku=0;
    }

    _controllerotazka.text=_otazka;
    _controllerodpoved.text=_odpoved;

    CollectionReference otazkyDB=FirebaseFirestore.instance.collection('Otazky');

    return Scaffold(
      appBar: AppBar(
        title: Text("Editacia Otazky"),
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
                  controller: _controllerotazka,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.home),
                    hintText: 'Otázka',
                    labelText: 'Otázka',
                  ),
                  onChanged: ((value) {
                    _otazka=value;
                    _controllerotazka.text=value;
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Prosím zadajte otázku';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _controllerodpoved,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.timelapse_outlined),
                    hintText: 'Odpoveď',
                    labelText: 'Odpoveď',
                  ),
                  onChanged: ((value) {
                    _odpoved =value;
                    _controllerodpoved.text=value;

                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Prosím zadajte odpoveď';
                    }
                    return null;
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

                        var db=FirebaseFirestore.instance.collection("Otazky").doc(_userOtazkaId).update({
                          "otazka":_controllerotazka.text,
                          "odpoved":_controllerodpoved.text,
                        });
                        _otazky.otazka=_controllerotazka.text;
                        _otazky.odpoved=_controllerodpoved.text;

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Otázka updatnutá")));

                        //TODO
                        //Navigator.pushNamed(context, "/upravaOtazkyPage");
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
                      await FirebaseFirestore.instance.collection("Otazky").doc(_userOtazkaId).delete();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Otázka vymazana")));


                      //TODO
                      //Navigator.pushNamed(context, "/upravaOtazkyPage");
                    },
                    child: const Text(
                      "Vymaž otázku",
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






