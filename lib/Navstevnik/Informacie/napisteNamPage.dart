import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class napisteNamPage extends StatefulWidget {

  @override
  napisteNamPageState createState() {
    return napisteNamPageState();
  }
}

class napisteNamPageState extends State<napisteNamPage> {
  final _formKey = GlobalKey<FormState>();

  var _controllermeno=TextEditingController();
  var _controlleremail=TextEditingController();
  var _controllersprava=TextEditingController();

  String _dropDownValue="";
  String _meno="";
  String _sprava="";
  String _email="";
  bool isChecked = false;

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

  CollectionReference napistenamDb=FirebaseFirestore.instance.collection('NapisteNam');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Napíšte nám"),
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
                controller: _controllermeno,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Meno a priezvisko',
                  labelText: 'Meno a Priezvisko',

                ),
                onChanged: ((value) {
                  _meno=value;
                }),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Prosím zadajte meno a priezvisko';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controlleremail,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'E-mail',
                  labelText: 'E-mail',
                ),
                onChanged: ((value) {
                  _email=value;
                }),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Prosím zadajte E-mail';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0,8,8,0),
                child: DropdownButton(
                  hint: _dropDownValue=="" ?
                  Text('Vyberte oblasť záujmu')
                      :
                  Text(
                    _dropDownValue,
                    style: TextStyle(color: Colors.black87)
                  ),
                    isExpanded: true,
                    iconSize: 30.0,
                    style: TextStyle(color: Colors.black87),
                    items: ['Medicínska oblasť','Technická podpora','Iné'].map((val){
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
              TextFormField(
                controller: _controllersprava,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.message),
                  hintText: 'Vaša správa',
                  labelText: 'Vaša správa',
                ),
                onChanged: ((value) {
                  _sprava=value;
                }),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Prosím zadajte správu';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text(
                    "Súhlasím so spracovaním osobných údajov",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
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
                    if(_formKey.currentState!.validate() && isChecked==true){
                      await napistenamDb.add({
                        'menopriezvisko':_meno,
                        'oblast':_dropDownValue,
                        'email':_email,
                        'sprava':_sprava,
                      }).then((value) => print('Správa odoslaná'));
                      _controllersprava.clear();
                      _controlleremail.clear();
                      _controllermeno.clear();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Správa odoslaná")));
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

