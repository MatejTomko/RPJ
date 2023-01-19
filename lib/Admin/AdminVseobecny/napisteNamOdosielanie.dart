import 'dart:convert';

import 'package:blood_app/Admin/AdminVseobecny/napisteNam.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;



//toto je ked kliknes na vyjazdove odbery oc presov
class napisteNamOdosielanie extends StatefulWidget{
  final napisteNam _nam;
  final String _namId;
  napisteNamOdosielanie(this._nam,this._namId);

  @override
  napisteNamOdosielanieState createState() {
    return napisteNamOdosielanieState(_nam,_namId);
  }
}
Future sendEmail({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async{
  final serviceId='service_d2z81rs';
  final templateId='template_kzgc9v9';
  final userId='gaHIMydx86ehMFXfn';

  final url=Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final response = await http.post(
      url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params':{
        'to_name':name,
        'question_from':subject,
        'message':message,
        'user_email':email,
      },
    }),
  );

  print(response.body);
}

class napisteNamOdosielanieState extends State<napisteNamOdosielanie>{
  final _formKey = GlobalKey<FormState>();
  final napisteNam _nam;
  final String _namId;
  int lennazaciatku=1;

  napisteNamOdosielanieState(this._nam,this._namId);

  String _meno="";
  String _oblast="";
  String _sprava="";
  String _email="";
  String _odpoved="";


  var _controllerodpoved=TextEditingController();


  @override
  void initState() {
    super.initState();
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
      _meno=_nam.menopriezvisko;
      _email=_nam.email;
      _sprava=_nam.sprava;
      _oblast=_nam.oblast;
      lennazaciatku=0;
    }


    CollectionReference napisteNamDb=FirebaseFirestore.instance.collection('NapisteNam');

    return Scaffold(
      appBar: AppBar(
        title: Text("Odpovedanie na otázky"),
        backgroundColor: Colors.red[900],
      ),
      body:
      Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
          primarySwatch: Colors.red,
        ),
        child: SingleChildScrollView(
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
                    child: Row(
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
                          _nam.menopriezvisko,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    decoration: BoxDecoration(
                      color:Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
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
                          _nam.email,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    decoration: BoxDecoration(
                      color:Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Správa: ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              _nam.sprava,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,2,10,2),
                    decoration: BoxDecoration(
                      color:Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Expanded(
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
                        if(_controllerodpoved.text!=null ){

                          sendEmail(name: _meno, email: _email, subject: _sprava, message: _controllerodpoved.text);
                          _controllerodpoved.clear();
                          Utils.showSnackBar("Odpoveď odoslaná.");
                        }
                        //TODO
                        //Navigator.pop(context);
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
                        await FirebaseFirestore.instance.collection("NapisteNam").doc(_namId).delete();
                        Utils.showSnackBar("Otázka vymazaná");
                        //TODO
                        //Navigator.pushNamed(context, "/upravaMobilnaOCPage");
                      },
                      child: const Text(
                        "Vymáž otázku",
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






