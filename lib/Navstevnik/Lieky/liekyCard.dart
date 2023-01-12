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
      margin: EdgeInsets.fromLTRB(5,5,5,0),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: _lieky.mozemdarovat == "nie" ? Color.fromRGBO(255, 220, 220, 1) : Color.fromRGBO(220, 255, 220, 1),
          border: Border.all(
            color: _lieky.mozemdarovat == "nie" ? Colors.redAccent : Colors.green
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Image.asset("assets/medicine.png"),
                ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                            "${_lieky.liek}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Môžem darovať: ",
                          ),
                          Text(
                            "${_lieky.mozemdarovat}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Text("Kedy najskôr: ${_lieky.kedynajskor}"),
                        ),
                      )
                    ],
                  ),
                  Row(children: [
                    Expanded(child: Text("Poznámka: ${_lieky.poznamka}"),)
                  ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}