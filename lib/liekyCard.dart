import 'package:blood_app/lieky.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'odber.dart';

class liekyCard extends StatelessWidget {
  final lieky _lieky;

  liekyCard(this._lieky);

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
                      child: Text("Kedy najskôr: ${_lieky.kedynajskor}"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Liek: ${_lieky.liek}"),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Môžem darovať: ${_lieky.mozemdarovat}"),
                    )
                  ],
                ),
                Row(children: [
                  Text("Poznámka: ${_lieky.poznamka}"),
                ],)
              ],
            ),
          )
      ),
    );
  }
}