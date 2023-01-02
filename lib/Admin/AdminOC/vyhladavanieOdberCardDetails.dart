import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';




class vyhladavanieOdberCardDetails extends StatelessWidget {
  late final odber _odber;
  final String _odberid;

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Detaily odberu: "),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
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
                        TextFormField(
                          controller: _controlleridDarca,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.home),
                            hintText: 'idDarca',
                            labelText: 'idDarca',
                          ),
                          onChanged: ((value) {
                            _idDarca=value;
                            _controlleridDarca.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte id darcu';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
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
                        ),
                        TextFormField(
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
                        ),

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
                                return true;
                              },

                            );

                            if (zvolenyDatum != null) {
                              String formattedDate = DateFormat('yyyy-MM-dd').format(zvolenyDatum);
                              _datum=zvolenyDatum.toString();
                              _controllerdatum.text = formattedDate;
                            }else{
                              print("Dátum nebol zvolený");
                            }
                          },
                        ),

                        TextFormField(
                          controller: _controllerkomplikacia,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Komplikácia pri odbere',
                            labelText: 'Komplikácia',
                          ),
                          onChanged: ((value) {
                            _komplikacia=value;
                            _controllerkomplikacia.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte typ komplikáciu';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
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
                        ),

                        TextFormField(
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
                        ),


                        TextFormField(
                          controller: _controllermnozstvo,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Množstvo odberu',
                            labelText: 'Množstvo odberu',
                          ),
                          onChanged: ((value) {
                            _mnozstvo=value;
                            _controllermnozstvo.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte množstvo odberu';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: _controllertlakkrvi,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Tlak krvi',
                            labelText: 'Tlak krvi',
                          ),
                          onChanged: ((value) {
                            _tlakkrvi=value;
                            _controllertlakkrvi.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte tlak krvi';
                            }
                            return null;
                          },
                        ),

                        TextFormField(
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
                        ),

                        TextFormField(
                          controller: _controllervyjazd,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.place),
                            hintText: 'Výjazd',
                            labelText: 'Výjazd',
                          ),
                          onChanged: ((value) {
                            _vyjazd=value;
                            _controllervyjazd.text=value;
                          }),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Prosím zadajte výjazd';
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
                                  "typ":_controllertyp.text,
                                });


                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Odber upravený")));
                              }
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
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Odber vymazany")));


                              //TODO
                              //Navigator.pushNamed(context, "/pridavanieodberupage");
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
    );
  }
}
