import 'package:blood_app/kamennaOC.dart';
import 'package:blood_app/mobilnaOC.dart';
import 'package:blood_app/mobilnaOCCard.dart';
import 'package:blood_app/mobilnaOCZaciatocna.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'kamennaOC.dart';

//toto je ked kliknes na vyjazdove odbery oc presov

class mobilnaOCCardZaciatocnaDetails extends StatelessWidget{
  final mobilnaOCZaciatocna _mobilnaOCZaciatocna;

  mobilnaOCCardZaciatocnaDetails(this._mobilnaOCZaciatocna);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Výjazdové odbery "+_mobilnaOCZaciatocna.meno),
        backgroundColor: Colors.red[900],
      ),

        body: Theme(
          data: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey)
          ),
          child: ListView.builder(
              itemCount: _mobilnaOCZaciatocna.listMobilnychOC.length,
              itemBuilder:(context, index) {
                print('_mobilnaOCZaciatocna.listMobilnychOC.length');
                mobilnaOC moc=new mobilnaOC(_mobilnaOCZaciatocna.listMobilnychOC[index]['cas'],_mobilnaOCZaciatocna.listMobilnychOC[index]['datum'].toString(),_mobilnaOCZaciatocna.listMobilnychOC[index]['mapy'],_mobilnaOCZaciatocna.listMobilnychOC[index]['miesto'],_mobilnaOCZaciatocna.listMobilnychOC[index]['oc']);
                return mobilnaOCCard(moc);
              }),
        ),

    );
  }
}
