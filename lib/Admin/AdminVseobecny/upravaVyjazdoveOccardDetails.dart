import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';

//toto je ked kliknes na vyjazdove odbery oc presov

class upravaVyjazdoveOCcardDetails extends StatelessWidget{
  final vyjazdoveOC _vyjazdoveOC;
  final List userMobilneOcListId;

  upravaVyjazdoveOCcardDetails(this._vyjazdoveOC,this.userMobilneOcListId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Výjazdové odbery "+_vyjazdoveOC.meno),
        backgroundColor: Colors.red[900],
      ),

      body: Theme(
        data: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey)
        ),
        child: ListView.builder(
            itemCount: _vyjazdoveOC.listMobilnychOC.length,
            itemBuilder:(context, index) {
              mobilnaOC moc=new mobilnaOC(_vyjazdoveOC.listMobilnychOC[index]['cas'],_vyjazdoveOC.listMobilnychOC[index]['mapy'],_vyjazdoveOC.listMobilnychOC[index]['miesto'],_vyjazdoveOC.listMobilnychOC[index]['oc'],_vyjazdoveOC.listMobilnychOC[index]['datum']);
              return upravaMobilnaOCCard(moc,userMobilneOcListId[index]);
            }),
      ),

    );
  }
}
