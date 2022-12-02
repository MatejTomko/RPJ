import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'odber.dart';

class OdberCard extends StatelessWidget {
  final odber _odber;

  OdberCard(this._odber);

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
                      child: Text("Množstvo: ${_odber.mnozstvo}"),
                  )
                ],
              ),
              Row(children: [
                Text("Dátum: ${_odber.datum}"),
              ],)
            ],
          ),
        )
      ),
    );
  }
}
