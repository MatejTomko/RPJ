import 'package:blood_app/kamennaOC.dart';
import 'package:blood_app/kamennaOCDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'kamennaOC.dart';

class kamennaOCCard extends StatelessWidget {
  final kamennaOC _kamennaOC;

  kamennaOCCard(this._kamennaOC);

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
                            _kamennaOC.meno,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _kamennaOC.adresa,
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
                          builder: (context) => kamennaOCDetails(_kamennaOC)));
                },
              ),
            ],
          )
      ),
    );
  }
}
