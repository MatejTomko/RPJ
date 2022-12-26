import 'package:blood_app/Admin/AdminVseobecny/editaciaOtazka.dart';
import 'package:blood_app/Admin/AdminVseobecny/napisteNam.dart';
import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:blood_app/Navstevnik/Otazky/otazky.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Darca/Odber/odber.dart';

class upravaNapisteNamCard extends StatelessWidget {
  final napisteNam _napisteNam;

  upravaNapisteNamCard(this._napisteNam);

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
                        child: Column(
                          children: [
                            Text(_napisteNam.menopriezvisko),
                            Text(_napisteNam.email),
                            Text(_napisteNam.oblast),
                            Text(_napisteNam.sprava),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          /*onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ));
          },*/
        ),


      ),
    );
  }
}