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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(_kamennaOC.meno),
                    )
                  ],
                ),
                Row(children: [
                  Text(_kamennaOC.adresa),
                ],
                ),
                ListTile(
                  onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => kamennaOCDetails(_kamennaOC)));

                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}
