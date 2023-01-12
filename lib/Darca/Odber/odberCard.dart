import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCardDetails.dart';
import 'package:blood_app/Darca/Profil/preukazDarcu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OdberCard extends StatelessWidget {
  final odber _odber;

  OdberCard(this._odber);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child:InkWell(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "${_odber.datum}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 10,
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.water_drop),
                      Text(
                        _odber.typ,
                      ),
                      Text(
                        "| ${_odber.mnozstvo} ml",
                        style: TextStyle(fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => odberCardDetails(_odber)));
          },
        ),
      ),
    );
  }
}
