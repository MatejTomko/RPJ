import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Darca/Odber/odber.dart';

class liekyCard extends StatelessWidget {
  lieky _lieky;

  liekyCard(this._lieky);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: _lieky.mozemdarovat == "nie" ? Colors.redAccent : Colors.green
              ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Liek: ${_lieky.liek}"),
                    ),
                  )
                ],
              ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("Kedy najskôr: ${_lieky.kedynajskor}"),
                      ),
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
                  Expanded(child: Text("Poznámka: ${_lieky.poznamka}"),)
                ],)
              ],
            ),
          )
      ),
    );
  }
}