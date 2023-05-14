import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';




class vyhladavanieOdberCardDetails extends StatelessWidget {
  late final odber _odber;
  final String _odberid;

  static final _formKey = GlobalKey<FormState>();

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

  vyhladavanieOdberCardDetails(this._odber, this._odberid);
  String _dropDownValueTypOdberu = "";


  @override
  Widget build(BuildContext context) {
    _autoodber=_odber.autoodber;
    _idDarca=_odber.idDarca;
    _datum=_odber.datum;
    _komplikacia=_odber.komplikacia;
    _koniec=_odber.koniec;
    _mnozstvo=_odber.mnozstvo;
    _tlakkrvi=_odber.tlakkrvi;
    _trvanie=_odber.trvanie;
    _typ=_odber.typ;
    _vyjazd=_odber.vyjazd;
    _zaciatok=_odber.zaciatok;


    _controllerautoodber.text=_autoodber;
    _controlleridDarca.text=_idDarca;
    _controllerdatum.text=_datum;
    _controllerkomplikacia.text=_komplikacia;
    _controllerkoniec.text=_koniec;
    _controllermnozstvo.text=_mnozstvo;
    _controllertlakkrvi.text=_tlakkrvi;
    _controllertrvanie.text=_trvanie;
    _controllertyp.text=_typ;
    _controllervyjazd.text=_vyjazd;
    _controllerzaciatok.text=_zaciatok;
    _dropDownValueTypOdberu=_typ;
    DateTime initialStart=DateTime.parse("2023-01-01 "+_zaciatok+":00.00000");
    DateTime initialEnd=DateTime.parse("2023-01-01 "+_koniec+":00.00000");
    print(initialEnd);
    print(initialStart);
    DateFormat dateFormat = DateFormat("HH:mm");
    _controllerTrvanieOdberu.text=dateFormat.format(initialStart)+"-"+dateFormat.format(initialEnd);


    return Scaffold(
      appBar: AppBar(
        title: Text("Detaily odberu: "),
        backgroundColor: Colors.red[900],
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
          primarySwatch: Colors.red,
        ),
        child: Container(
          margin: EdgeInsets.all(15),
          child:SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    "Začiatok odberu: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.zaciatok,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Koniec odberu: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.koniec,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Trvanie: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.trvanie+" min.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Komplikácie:",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.komplikacia,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Výjazd: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.vyjazd,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Autoodber: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.autoodber,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Tlak krvi: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.tlakkrvi,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Datum: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.datum.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Množstvo: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.mnozstvo+" ml",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Typ odberu: ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _odber.typ,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                child:SingleChildScrollView(
                  child: Form(
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
                              onChanged: ((value) {
                              _idDarca=value!;
                              _controlleridDarca.text=value;
                            }),
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
                                  initialValue: _autoodber,
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
                                initialValue: _typ,
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
                                    _dropDownValueTypOdberu=val!;
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
                                  builder: (context, child) {
                                    return Theme(data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(
                                      primary: Colors.red,
                                    )),
                                        child: child!);
                                  },
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now().subtract(Duration(days: 365 * 1)),
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
                                          _controllerTrvanieOdberu.text = dateFormat.format(start)+" - "+dateFormat.format(end);
                                          _zaciatok=dateFormat.format(start).toString();
                                          _koniec=dateFormat.format(end).toString();
                                          _controllerkoniec.text=_koniec;
                                          _controllerzaciatok.text=_zaciatok;

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
                                  String ideckoDoc=_odberid.substring(1,_odberid.length-1);
                                    /*if(_controllerdatum.text==""){
                                    String a=DateTime.now().toString().split(" ")[0];
                                    _controllerdatum.text=a;
                                  }*/
                                  //var id=FirebaseFirestore.instance.collection("MobilneOC").where("id",whereIn:;
                                  var db=FirebaseFirestore.instance.collection("Odber").doc(ideckoDoc).update({
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
                                    "typ":_dropDownValueTypOdberu,
                                  });
                                  Utils.showSnackBar("Odber upravený");
                                }
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Upraviť",
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
                                String ideckoDoc=_odberid.substring(1,_odberid.length-1);
                                await FirebaseFirestore.instance.collection("Odber").doc(ideckoDoc).delete();
                                Utils.showSnackBar("Odber vymazaný");
                                //TODO
                                //Navigator.pushNamed(context, "/pridavanieodberupage");
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Vymaž Odber",
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
            ],
          ),
          ),
        ),
      ),
    );
  }
}
