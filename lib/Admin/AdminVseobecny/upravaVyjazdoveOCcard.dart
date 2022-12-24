import 'package:blood_app/Admin/AdminVseobecny/upravaVyjazdoveOccardDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOCDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOCcardDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOC.dart';

//toto su tie karty ze VYJAZDOVE ODBERY OC PRESOV
class upravaVyjazdoveOCcard extends StatelessWidget {
  final vyjazdoveOC _vyjazdoveOC;
  final List userMobilneOcListId;
  upravaVyjazdoveOCcard(this._vyjazdoveOC,this.userMobilneOcListId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
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
                          Text(
                            "Výjazdove odbery "+_vyjazdoveOC.meno,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
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
                          builder: (context) => upravaVyjazdoveOCcardDetails(_vyjazdoveOC,userMobilneOcListId)));
                },
              ),
            ],
          )
      ),
    );
  }
}
