import 'package:blood_app/Admin/AdminOC/rezervacia.dart';
import 'package:blood_app/Admin/AdminOC/rezervaciaCardDetails.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCardDetails.dart';
import 'package:blood_app/Darca/Profil/preukazDarcu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RezervaciaCardUser extends StatelessWidget {
  final rezervacia _rezervacia;

  RezervaciaCardUser(this._rezervacia);

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
                      child: Text("Id darcu: ${_rezervacia.idDarca}"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Meno: ${_rezervacia.meno}"),
                    )
                  ],
                ),
                Row(children: [
                  Text("Dátum: ${_rezervacia.datum}"),
                  Text(" Čas: ${_rezervacia.cas}"),
                ],)
              ],
            ),
          ),

        ),
      ),
    );
  }
}
