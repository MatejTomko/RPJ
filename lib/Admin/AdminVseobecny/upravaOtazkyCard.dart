import 'package:blood_app/Admin/AdminVseobecny/editaciaOtazka.dart';
import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:blood_app/Navstevnik/Otazky/otazky.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Darca/Odber/odber.dart';

class upravaOtazkyCard extends StatelessWidget {
  final otazky _otazky;
  String _idotazky;

  upravaOtazkyCard(this._otazky,this._idotazky);

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
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child:
                          Text(_otazky.otazka,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => editaciaOtazka(_otazky,_idotazky)));
          },
        ),


      ),
    );
  }
}