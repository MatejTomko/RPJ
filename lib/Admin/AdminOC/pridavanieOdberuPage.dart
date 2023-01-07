import 'dart:ffi' as ffi;
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Admin/AdminOC/odberCardVyhladavanie.dart';
import 'package:blood_app/Darca/Odber/odberCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../DatabaseManager.dart';

class pridavanieOdberuPage extends StatefulWidget {
  const pridavanieOdberuPage({Key? key}) : super(key: key);


  @override
  State<pridavanieOdberuPage> createState() => _pridavanieOdberuPageState();
}

class MyScrollBehaviour extends ScrollBehavior{
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _pridavanieOdberuPageState extends State<pridavanieOdberuPage> with SingleTickerProviderStateMixin{
  final _formKey = GlobalKey<FormState>();

  var _controllerautoodber=TextEditingController();
  var _controlleridDarca=TextEditingController();
  var _controllerdatum=TextEditingController();
  var _controllerkomplikacia=TextEditingController();
  var _controllerkoniec=TextEditingController();
  var _controllermnozstvo=TextEditingController();
  var _controllertlakkrvi=TextEditingController();
  var _controllertrvanie=TextEditingController();
  var _controllertyp=TextEditingController();
  var _controllervyjazd=TextEditingController();
  var _controllerzaciatok=TextEditingController();
  var _controllerTrvanieOdberu = TextEditingController();


  var _controllerVyhladavanie=TextEditingController();
  String vyrazHladaj="";

  String _autoodber="";
  String _idDarca="";
  //String _datum=DateTime.now().toString().split(" ")[0];
  String _datum=DateTime.now().toString();
  String _komplikacia="";
  String _koniec="";
  String _mnozstvo="";
  String _tlakkrvi="";
  String _trvanie="";
  String _typ="";
  String _vyjazd="";
  String _zaciatok="";
  String _trvanieOdberu = "";


  late TabController tabController;
  List userOdberyList= [];
  List userOdberyListid=[];
  dynamic resultant;
  dynamic resultantid;



  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2,initialIndex: 0, vsync: this);
    _controlleridDarca.addListener(() {
      final String text = _controlleridDarca.text;
      _controlleridDarca.value = _controlleridDarca.value.copyWith(
        text: text,
      );
    });
    _controllerkomplikacia.addListener(() {
      final String text = _controllerkomplikacia.text;
      _controllerkomplikacia.value = _controllerkomplikacia.value.copyWith(
        text: text,
      );
    });
    _controllerTrvanieOdberu.addListener(() {
      final String text = _controllerTrvanieOdberu.text;
      _controllerTrvanieOdberu.value = _controllerTrvanieOdberu.value.copyWith(
        text: text,
      );
    });
    _controllermnozstvo.addListener(() {
      final String text = _controllermnozstvo.text;
      _controllermnozstvo.value = _controllermnozstvo.value.copyWith(
        text: text,
      );
    });
    _controllertlakkrvi.addListener(() {
      final String text = _controllertlakkrvi.text;
      _controllertlakkrvi.value = _controllertlakkrvi.value.copyWith(
        text: text,
      );
    });
    _controllervyjazd.addListener(() {
      final String text = _controllervyjazd.text;
      _controllervyjazd.value = _controllervyjazd.value.copyWith(
        text: text,
      );
    });
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{

    List resulty=await databaseManager.getOdberList2();
    resultant = resulty[0];
    resultantid=resulty[1];
    //display=userKamenneOCList;
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        userOdberyList=[];
        for(var i=0;i< resultant.length;i++){
          if(resultant[i]["idDarca"]==vyrazHladaj){
            userOdberyList.add(resultant[i]);
            userOdberyListid.add(resultantid[i]);
          }
        }
        if(userOdberyList.length==0){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Žiaden výsledok")));
        }
      });
    }



  }
  String _dropDownValueTypOdberu = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Editacia odberov"),
          backgroundColor: Colors.red[900],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Expanded(
                    flex: 5,
                    child: TabBar(
                      indicatorColor: Colors.white,
                      controller: tabController,
                      tabs: const [
                        Tab(child: Text("Pridávanie")),
                        Tab(child: Text("Výhľadavanie a úprava")),
                      ],
                    ))
              ],
            ),
          ),
        ),

        body: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
            primarySwatch: Colors.red,
          ),
          child: TabBarView(
            controller: tabController,
            children: [
              Container(
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
                            name:"idDarca",
                            controller: _controlleridDarca,
                            cursorColor: Colors.black12,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person_outline),
                              hintText: 'ID Darcu',
                              border: InputBorder.none,
                            ),
                            /*onChanged: ((value) {
                              _idDarca=value;
                              _controlleridDarca.text=value;
                            }),*/
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prosím zadajte id darcu';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(12,0,10,2),
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(0,20,0,0),
                                    child: const Text(
                                        "Auto odber"
                                      ,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              FormBuilderRadioGroup<String>(
                                decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                      fontSize: 22,
                                    ),
                                    border: InputBorder.none,
                                ),
                                initialValue: null,
                                name: 'auto_odber',
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required()]),
                                options:
                                ['Áno', 'Nie']
                                    .map((moznosti) => FormBuilderFieldOption(
                                  value: moznosti,
                                  child: Text(moznosti),
                                ))
                                    .toList(growable: false),
                                onChanged: ((value) {
                                  _autoodber =value!;
                                  _controllerautoodber.text=value;
                                }),
                                controlAffinity: ControlAffinity.trailing,
                              ),
                            ],
                          ),
                        ),
                        /*TextFormField(
                          controller: _controllerautoodber,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.timelapse_outlined),
                            hintText: 'Auto odber',
                            labelText: 'Auto odber',
                          ),
                          onChanged: ((value) {
                            _autoodber =value;
                            _controllerautoodber.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte či sa jedná o auto odber';
                            }
                            return null;
                          },
                        ),*/
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
                                  _dropDownValueTypOdberu=val!;
                                });
                              }
                          ),
                        ),
                        /*TextFormField(
                          controller: _controllertyp,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Typ odberu',
                            labelText: 'Typ odberu',
                          ),
                          onChanged: ((value) {
                            _typ=value;
                            _controllertyp.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte typ odberu';
                            }
                            return null;
                          },
                        ),*/
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
                                lastDate: DateTime(2101),
                                selectableDayPredicate: (DateTime date){
                                  return true;
                                },
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
                          padding: EdgeInsets.fromLTRB(12,5,10,5),
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: _controllerkomplikacia,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.medical_information_outlined),
                              hintText: 'Komplikácie pri odbere',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                _komplikacia="žiadne komplikácie";
                              }
                              return null;
                            },
                          ),
                        ),

                        /*FormBuilderDateTimePicker(
                          name: 'date',
                          initialEntryMode: DatePickerEntryMode.calendar,
                          initialValue: DateTime.now(),
                          inputType: InputType.both,
                          decoration: InputDecoration(
                            labelText: 'Appointment Time',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {

                              },
                            ),
                          ),
                          initialTime: const TimeOfDay(hour: 8, minute: 0),
                          locale: Locale.fromSubtags(languageCode: 'fr'),
                        ),*/
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(12,5,10,5),
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            controller: _controllerTrvanieOdberu,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Kliknite na hodiny pre výber času',
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: (){
                                  DateTimeRangePicker(
                                      startText: "Od",
                                      endText: "Do",
                                      doneText: "Potvrdiť",
                                      cancelText: "Zrušiť",
                                      interval: 1,
                                      mode: DateTimeRangePickerMode.time,
                                      minimumTime: DateTime.now().subtract(Duration(days: 5)),
                                      maximumTime: DateTime.now().add(Duration(days: 2)),
                                      use24hFormat: true,
                                      onConfirm: (start, end) {
                                        DateFormat dateFormat = DateFormat("HH:mm");
                                        print(start);
                                        print(end);
                                        _controllerTrvanieOdberu.text = dateFormat.format(start)+" - "+dateFormat.format(end);

                                      }).showPicker(context);
                                },
                                icon: Icon(Icons.access_time_outlined),
                              ),
                            ),
                          ),
                        ),
                        /*TextFormField(
                          controller: _controllerzaciatok,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Začiatok odberu',
                            labelText: 'Začiatok odberu',
                          ),
                          onChanged: ((value) {
                            _zaciatok=value;
                            _controllerzaciatok.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte začiatok odberu';
                            }
                            return null;
                          },
                        ),*/

                        /*TextFormField(
                          controller: _controllerkoniec,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Koniec odberu',
                            labelText: 'Koniec odberu',
                          ),
                          onChanged: ((value) {
                            _koniec=value;
                            _controllerkoniec.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte koniec odberu';
                            }
                            return null;
                          },
                        ),*/
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(10,2,10,2),
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: _controllermnozstvo,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.water_drop_outlined),
                              hintText: 'Množstvo odberu',
                              labelText: 'Množstvo odberu',
                              border: InputBorder.none,
                            ),

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prosím zadajte množstvo odberu';
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
                          child: TextFormField(
                            controller: _controllertlakkrvi,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.bloodtype_outlined),
                              hintText: 'Tlak krvi',
                              labelText: 'Tlak krvi',
                              border: InputBorder.none,
                            ),

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prosím zadajte tlak krvi';
                              }
                              return null;
                            },
                          ),
                        ),

                        /*TextFormField(
                          controller: _controllertrvanie,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Trvanie odberu',
                            labelText: 'Trvanie odberu',
                          ),
                          onChanged: ((value) {
                            _trvanie=value;
                            _controllertrvanie.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte trvanie odberu';
                            }
                            return null;
                          },
                        ),*/
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(10,2,10,2),
                          decoration: BoxDecoration(
                            color:Colors.black12,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: _controllervyjazd,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.place),
                              hintText: 'Výjazd',
                              labelText: 'Výjazd',
                              border: InputBorder.none,
                            ),

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Prosím zadajte výjazd';
                              }
                              return null;
                            },
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

                                /*if(_controllerdatum.text==""){
                                  String a=DateTime.now().toString().split(" ")[0];
                                  _controllerdatum.text=a;
                                }*/
                                //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                                var db=FirebaseFirestore.instance.collection("Odber").add({
                                  "datum":_controllerdatum.text,
                                  "idDarca":_controlleridDarca.text,
                                  "vyjazd":_controllervyjazd.text,
                                  "trvanie":_controllertrvanie.text,
                                  "tlakkrvi":_controllertlakkrvi.text,
                                  "mnozstvo":_controllermnozstvo.text,
                                  "koniec":_controllerkoniec.text,
                                  "zaciatok":_controllerzaciatok.text,
                                  "komplikacia":_controllerkomplikacia.text,
                                  "autoodber":_controllerautoodber.text,
                                  "typ":_controllertyp.text,
                                });

                                _controllerdatum.clear();
                                _controllervyjazd.clear();
                                _controllertrvanie.clear();
                                _controllertlakkrvi.clear();
                                _controllermnozstvo.clear();
                                _controllerkoniec.clear();
                                _controllerzaciatok.clear();
                                _controllerkomplikacia.clear();
                                _controlleridDarca.clear();
                                _controllerautoodber.clear();
                                _controllertyp.clear();

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Odber pridaný")));
                              }
                            },
                            child: const Text(
                              "Pridať",
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

              //prvy widget v tomto je prvy tab a druhy je druhy
              Container(
                child: Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                          },
                          controller: _controllerVyhladavanie,
                          decoration: const InputDecoration(
                            labelText: "",
                            hintText: "Vyhľadaj Odber podľa ID darcu",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.red[900],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: (){
                            vyrazHladaj=_controllerVyhladavanie.text;
                            if(vyrazHladaj.length>2){
                              fetchDatabaseList();
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Minimalne 3 znaky!")));
                            }
                          },
                          style: TextButton.styleFrom(
                            shape: const StadiumBorder(
                              side: BorderSide(color: Color.fromRGBO(183, 28, 28, 1), style: BorderStyle.solid),
                            ),
                          ),
                          child: const Text(
                            "Hľadaj",
                            style: TextStyle(color: Colors.white,fontSize: 25),
                          ),
                        ),
                      ),

                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: userOdberyList.length,
                            itemBuilder:(context, index) {
                              print(userOdberyList[index]);
                              odber odb1=new odber(userOdberyList[index]['idDarca'],userOdberyList[index]['mnozstvo'],userOdberyList[index]['datum'],userOdberyList[index]['typ'],userOdberyList[index]['autoodber'],userOdberyList[index]['komplikacia'],userOdberyList[index]['koniec'],userOdberyList[index]['tlakkrvi'],userOdberyList[index]['vyjazd'],userOdberyList[index]['zaciatok'],userOdberyList[index]['trvanie']);
                              return OdberCardVyhladavanie(odb1,userOdberyListid[index].toString());
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
