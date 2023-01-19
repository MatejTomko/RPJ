import 'package:blood_app/Admin/AdminVseobecny/editaciaOtazka.dart';
import 'package:blood_app/Admin/AdminVseobecny/napisteNam.dart';
import 'package:blood_app/Admin/AdminVseobecny/napisteNamOdosielanie.dart';
import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:blood_app/Navstevnik/Otazky/otazky.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Darca/Odber/odber.dart';

class upravaNapisteNamCard extends StatelessWidget {
  final napisteNam _napisteNam;
  final String _napisteNamId;

  upravaNapisteNamCard(this._napisteNam,this._napisteNamId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.only(top:5, left: 5,right: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child:InkWell(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Image.asset("assets/otazka-person.png",
                                        width: 32),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(_napisteNam.menopriezvisko,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 1),
                                      Text(_napisteNam.email,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(_napisteNam.oblast,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Container(
                                child: Text(_napisteNam.sprava)
                            ),


                          ],
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
                    builder: (context) => napisteNamOdosielanie(_napisteNam, _napisteNamId) ));
          },
        ),


      ),
    );
  }
}