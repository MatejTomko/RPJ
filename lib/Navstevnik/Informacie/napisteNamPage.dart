import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class napisteNamPage extends StatefulWidget {

  @override
  napisteNamPageState createState() {
    return napisteNamPageState();
  }
}

class napisteNamPageState extends State<napisteNamPage> {
  final _formKey = GlobalKey<FormBuilderState>();

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




  @override
  void initState() {
    super.initState();
    _controllermeno.addListener(() {
      final String text = _controllermeno.text;
      _controllermeno.value = _controllermeno.value.copyWith(
        text: text,
      );
    });
    _controlleremail.addListener(() {
      final String text = _controlleremail.text;
      _controlleremail.value = _controlleremail.value.copyWith(
        text: text,
      );
    });

    _controllersprava.addListener(() {
      final String text = _controllersprava.text;
      _controllersprava.value = _controllersprava.value.copyWith(
        text: text,
      );
    });

  }

  CollectionReference napistenamDb=FirebaseFirestore.instance.collection('NapisteNam');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
      title: Text("Napíšte nám"),
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
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10,2,10,2),
                decoration: BoxDecoration(
                  color:Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FormBuilderTextField(
                  name:"Meno a priezvisko",
                  controller: _controllermeno,
                  cursorColor: Colors.black12,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person_outline),
                    hintText: 'Meno a priezvisko',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Prosím zadajte meno a priezvisko';
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
                  name:"E-mail",
                  controller: _controlleremail,
                  cursorColor: Colors.black12,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'E-mail',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Prosím zadajte E-mail';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                //padding: const EdgeInsets.fromLTRB(40.0,8,8,0),
                padding: EdgeInsets.fromLTRB(12,2,10,2),
                decoration: BoxDecoration(
                  color:Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FormBuilderDropdown(
                    name: "typOdberuDropdown",
                    decoration: const InputDecoration(
                        hintText: "Vyberte oblasť záujmu",
                        enabledBorder: InputBorder.none
                    ),
                    isExpanded: true,
                    iconSize: 30.0,
                    style: TextStyle(color: Colors.black87),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
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
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(10,2,10,2),
                decoration: BoxDecoration(
                  color:Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FormBuilderTextField(
                  name:"Správa",
                  controller: _controllersprava,
                  cursorColor: Colors.black12,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.message),
                    hintText: 'Správa',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Správu';
                    }
                    return null;
                  },
                ),
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
                      fontSize: 16,
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
                        'menopriezvisko':_controllermeno.text,
                        'oblast':_dropDownValue,
                        'email':_controlleremail.text,
                        'sprava':_controllersprava.text,
                      }).then((value) => print('Správa odoslaná'));
                      _controllersprava.clear();
                      _controlleremail.clear();
                      _controllermeno.clear();
                      Utils.showSnackBar("Správa odoslaná");
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
      ),
    );
  }
}

