import 'package:blood_app/Admin/AdminVseobecny/editaciaMobilnaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';

//toto je uz jednotliva mobilna oc
class upravaMobilnaOCCard extends StatelessWidget {
  final mobilnaOC _mobilnaOC;

  upravaMobilnaOCCard(this._mobilnaOC);

  @override
  Widget build(BuildContext context) {
    DateTime datePomocny=_mobilnaOC.datum;
    String stringPomocny=datePomocny.toString();
    var datumbezcasu=stringPomocny.split(" ");
    return Card(
        child: Column(
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _mobilnaOC.miesto,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            "${datumbezcasu[0]}",
                            style: const TextStyle(
                              fontSize: 16,
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => editaciaMobilnaOC(_mobilnaOC)));
              },
            ),
          ],
        )
    );
  }
}
