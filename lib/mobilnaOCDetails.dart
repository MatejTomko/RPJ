import 'package:blood_app/kamennaOC.dart';
import 'package:blood_app/mobilnaOC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'mobilnaOC.dart';

class mobilnaOCDetails extends StatelessWidget{
  final mobilnaOC _moc;

  mobilnaOCDetails(this._moc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_moc.miesto),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
            children: [
              Text(_moc.datum)
            ]
        ),
      ),
    );
  }
}
