import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';




class preukazDarcu extends StatelessWidget {
  late final darca _darca;

  preukazDarcu(this._darca);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.red[900],
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 3),
            padding: EdgeInsets.all(10),
            child: Text("Preukaz darcu",
                style: TextStyle(
                    color: Colors.red[800],
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                )
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            child: Container(
              margin: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:3.0),
                        child: Icon(Icons.person_outline, color: Colors.grey.shade500),
                      ),
                      Text(
                        "Meno a priezvisko",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 28),
                    child: Text(
                      _darca.meno+" "+_darca.priezvisko,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:3.0),
                        child: Image.asset("assets/heart.png", color: Colors.grey.shade500, width: 24)
                      ),
                      Text(
                        "Počet odberov",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 28),
                    child: Text(
                      _darca.pocetodberov,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:3.0),
                        child: Icon(Icons.water_drop_outlined, color: Colors.grey.shade500),
                      ),
                      Text(
                        "Krvná skupina",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 28),
                    child: Text(
                      _darca.krvnaskupina,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:3.0),
                        child: Icon(Icons.qr_code_outlined, color: Colors.grey.shade500),
                      ),
                      Text(
                        "Evidenčné číslo darcu ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 65,
                    padding: EdgeInsets.fromLTRB(22,5,0,0),
                    child: SfBarcodeGenerator(
                      value: _darca.idDarca,
                      showValue: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
