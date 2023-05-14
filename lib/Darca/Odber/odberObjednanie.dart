import 'package:blood_app/Admin/AdminOC/pridanieDarcuPage.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/DatabaseManager.dart';
import 'package:blood_app/main.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class odberObjednanie extends StatefulWidget {

  @override
  odberObjednanieState createState() {
    return odberObjednanieState();
  }
}

class odberObjednanieState extends State<odberObjednanie> {
  final _formKey = GlobalKey<FormBuilderState>();

  var _controllerdatum=TextEditingController();
  var _controllercas=TextEditingController();


  String _dropDownValue=""; //centre
  String _dropDownValue2=""; // typ odberu
  String _datum="";
  String _cas="";

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

  DatabaseManager databaseManager=new DatabaseManager();
  int rezevaciePocet=0;
  DateTime date=DateTime.parse("1980-01-01 00:00:00.000");


  fetchDatabaseList() async {
    dynamic resultant = await databaseManager.getRezervaciaList();
    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        for (var i = 0; i < resultant.length; i++) {
          String help = resultant[i]['idDarca'].toString();
          if (help == idDarcu) {
            rezevaciePocet++;
          }
        }
      });

      dynamic resultant2 = await databaseManager.getOdberList();
      if (resultant2 == null) {
        print('Unable to retrieve');
      } else {
        setState(() {
          for (var i = 0; i < resultant2.length; i++) {
            String help = resultant2[i]['idDarca'].toString();
            if (help == idDarcu) {
              String datum=resultant2[i]['datum'].toString();
              datum+=" 00:00:00.000";
              print(datum);
              DateTime datePomocny=DateTime.parse(datum);
              if(date.compareTo(datePomocny) <0){
                date=datePomocny;
              }
            }
          }
          print(date.toString());
          print(rezevaciePocet);
        });
      }
    }
  }
  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  static const List<StateModel> casy=<StateModel>[
    StateModel("6:00"),
    StateModel("6:10"),
    StateModel("6:20"),
    StateModel("6:30"),
    StateModel("6:40"),
    StateModel("6:50"),
    StateModel("7:00"),
    StateModel("7:10"),
    StateModel("7:20"),
    StateModel("7:30"),
    StateModel("7:40"),
    StateModel("7:50"),
    StateModel("8:00"),
    StateModel("8:10"),
    StateModel("8:20"),
    StateModel("8:30"),
    StateModel("8:40"),
    StateModel("8:50"),
    StateModel("9:00"),
    StateModel("9:10"),
    StateModel("9:20"),
    StateModel("9:30"),
    StateModel("9:40"),
    StateModel("9:50"),
    StateModel("10:00"),
    StateModel("10:10"),
    StateModel("10:20"),
    StateModel("10:30"),
    StateModel("10:40"),
    StateModel("10:50"),
    StateModel("11:00"),
    StateModel("11:10"),
    StateModel("11:20"),
    StateModel("11:30"),
    StateModel("11:40"),
    StateModel("11:50"),
    StateModel("12:00"),
    StateModel("12:10"),
    StateModel("12:20"),
    StateModel("12:30"),
    StateModel("12:40"),
    StateModel("12:50"),
    StateModel("13:00"),
    StateModel("13:10"),
    StateModel("13:20"),
    StateModel("13:30"),
    StateModel("13:40"),
    StateModel("13:50"),
  ];

  StateModel selectedCas=casy[0];


  CollectionReference rezervaciaDb=FirebaseFirestore.instance.collection('Rezervacia');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Objednanie na odber"),
        backgroundColor: Colors.red[900],
      ),
      body:Theme(
        data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
       primarySwatch: Colors.red,
      ),
      child:
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(12,5,10,5),
                  decoration: BoxDecoration(
                    color:Colors.black12,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _controllerdatum,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_month_outlined),
                      hintText: "Dátum",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    readOnly: true,
                    onTap: () async{
                      DateTime? zvolenyDatum = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 14)),
                        selectableDayPredicate: (DateTime date){
                            return (date.weekday !=1 && date.weekday !=7 ); //TODO
                        },
                        builder: (context, child) {
                          return Theme(data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(
                            primary: Colors.red,
                              )),
                              child: child!);
                        }
                      );
                      if (zvolenyDatum != null) {
                        String formattedDate = DateFormat('dd.MM.yyyy').format(zvolenyDatum);
                        _datum=zvolenyDatum.toString();
                        _controllerdatum.text = formattedDate;
                      }else{
                        print("Dátum nebol zvolený");
                      }
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
                      name: "ocDropdown",
                      decoration: const InputDecoration(
                          hintText: "Zvoľte odberné centrum",
                          enabledBorder: InputBorder.none
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.black87),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
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
                          hintText: "Zvoľte typ odberu",
                          enabledBorder: InputBorder.none
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.black87),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
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
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(12,5,10,5),
                  decoration: BoxDecoration(
                    color:Colors.black12,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _controllercas,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Kliknite na hodiny pre výber času',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: (){
                          /*DateTimeRangePicker(
                              startText: "Od",
                              doneText: "Potvrdiť",
                              cancelText: "Zrušiť",
                              interval: 1,
                              mode: DateTimeRangePickerMode.dateAndTime,
                              minimumTime: DateTime.now().subtract(Duration(days: 5)),
                              maximumTime: DateTime.now().add(Duration(days: 2)),
                              use24hFormat: true,
                              onConfirm: (start,end) {
                                DateFormat dateFormat = DateFormat("dd.MM.yyyy HH:mm");
                                _controllercas.text = dateFormat.format(start);
                                _cas=start.toString();
                              }).showPicker(context);*/
                          showMaterialScrollPicker(context: context,
                              buttonTextColor: Colors.red,
                              headerColor: Colors.red,
                              title: "Vyberte si čas",
                              items: casy,
                              selectedItem: selectedCas,
                          onChanged: (value) => setState(() {
                            selectedCas=value;
                            _cas=value.toString();
                            _controllercas.text=selectedCas.toString();
                            DateFormat dateFormat = DateFormat("dd.MM.yyyy HH:mm");
                          }));
                        },
                        icon: Icon(Icons.access_time_outlined),
                      ),
                    ),
                  ),
                ),
                //TODO pridat cas/terminovnik upravit

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
                      if(rezevaciePocet==0 && DateTime.now().difference(date).inDays>90) {
                        if (_datum!= "" || _dropDownValue2!="" || _dropDownValue!="" || _cas!="") {
                          _datum=_datum.split(" ")[0];
                          await rezervaciaDb.add({
                            'oc': _dropDownValue,
                            'idDarca': idDarcu,
                            'datum': _datum,
                            'cas': _cas,
                            'typ': _dropDownValue2,
                            'vybavene': "Nie",
                          }).then((value) => print('Rezervacia odoslaná'));
                          _controllerdatum.clear();
                          Utils.showSnackBar("Rezervácia odoslaná");
                        }
                      }else{
                        Utils.showSnackBar("Nemôžte sa prihlásiť na odber");
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

class StateModel{
  const StateModel(this.cas);
  final String cas;

  @override
  String toString() => cas;
}

