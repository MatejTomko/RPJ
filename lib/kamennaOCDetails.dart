import 'package:blood_app/kamennaOC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'kamennaOC.dart';

class kamennaOCDetails extends StatelessWidget{
  final kamennaOC _koc;

  kamennaOCDetails(this._koc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_koc.meno),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
            children: [
              Text(_koc.adresa)
            ]
        ),
      ),
    );
  }
}
