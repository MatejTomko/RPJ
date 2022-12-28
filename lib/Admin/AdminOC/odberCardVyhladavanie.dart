import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCardDetails.dart';
import 'package:blood_app/Darca/Profil/preukazDarcu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OdberCardVyhladavanie extends StatelessWidget {
  final odber _odber;

  OdberCardVyhladavanie(this._odber);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child:InkWell(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Množstvo: ${_odber.mnozstvo}"),
                    )
                  ],
                ),
                Row(children: [
                  Text("Dátum: ${_odber.datum}"),
                ],)
              ],
            ),
          ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => odberCardDetails(_odber)));
          },
        ),
      ),
    );
  }
}
