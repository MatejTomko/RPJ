import 'package:blood_app/Admin/AdminOC/rezervacia.dart';
import 'package:blood_app/Admin/AdminOC/rezervaciaCardDetails.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCardDetails.dart';
import 'package:blood_app/Darca/Profil/preukazDarcu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RezervaciaCardUser extends StatelessWidget {
  final rezervacia _rezervacia;

  RezervaciaCardUser(this._rezervacia);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      ),
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.19,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  child: Container(
                    //padding: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${_rezervacia.datum}", //TODO DANEK upravit na slovensky date format
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${_rezervacia.cas}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                padding: const EdgeInsets.only(left: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        //Padding(padding: EdgeInsets.only(right: 5), child: Image.asset("assets/blood-bank.png", width: 24)),
                        Text("${_rezervacia.oc}", style: TextStyle(fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                      Text("Typ odberu: "),
                      Text("${_rezervacia.typ}", style: TextStyle(fontWeight: FontWeight.w500),),
                    ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined)),//TODO DANEK pridat mazanie ked tam ma byt a prepojenie ked ma byt
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
