import 'package:blood_app/Admin/AdminVseobecny/zobrazovanieNapisteNamPage.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Navstevnik/Otazky/otazky.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();
  final otazky _otazky;
  final String _userOtazkaId;
  int lennazaciatku=1;

  editaciaOtazkaState(this._otazky,this._userOtazkaId);

  String _otazka="";
  String _odpoved="";
  var _controllerotazka=TextEditingController();
  var _controllerodpoved=TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerotazka.addListener(() {
      final String text = _otazka;
      _controllerotazka.text = _controllerotazka.value.copyWith(
        text: text,
      ) as String;
    });
    _controllerodpoved.addListener(() {
      final String text = _odpoved;
      _controllerodpoved.text = _controllerodpoved.value.copyWith(
        text: text,
      ) as String;
    });
  }




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


      body:Theme(
        data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
        primarySwatch: Colors.red,
      ),

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
                    name:"Otázka",
                    controller: _controllerotazka,
                    cursorColor: Colors.black12,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.question_mark),
                      hintText: 'Otázka',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Prosím zadajte otázku';
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
                    name:"Odpoveď",
                    controller: _controllerodpoved,
                    cursorColor: Colors.black12,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.question_answer),
                      hintText: 'Odpoveď',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Prosím zadajte odpoveď';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),





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

                        Utils.showSnackBar("Otázka updatnutá");
                        Navigator.of(context).pop(true);
                      }
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(color: Colors.white,fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
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
                      Utils.showSnackBar("Otázka vymazaná");

                      Navigator.pop(context);
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
      ),
    );
  }
}






