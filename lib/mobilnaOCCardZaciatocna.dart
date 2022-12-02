import 'package:blood_app/kamennaOC.dart';
import 'package:blood_app/kamennaOCDetails.dart';
import 'package:blood_app/mobilnaOCCardZaciatocnaDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'kamennaOC.dart';
import 'mobilnaOCZaciatocna.dart';

//toto su tie karty ze VYJAZDOVE ODBERY OC PRESOV
class mobilnaOCCardZaciatocna extends StatelessWidget {
  final mobilnaOCZaciatocna _mobilnaOCZaciatocna;

  mobilnaOCCardZaciatocna(this._mobilnaOCZaciatocna);

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
                            "Výjazdove odbery "+_mobilnaOCZaciatocna.meno,
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
                          builder: (context) => mobilnaOCCardZaciatocnaDetails(_mobilnaOCZaciatocna)));
                },
              ),
            ],
          )
      ),
    );
  }
}
