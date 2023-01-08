import 'package:blood_app/Admin/AdminOC/rezervacia.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCDetails.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';



class rezervaciaCardDetails extends StatelessWidget {
  late final rezervacia _rezevacia;

  rezervaciaCardDetails(this._rezevacia);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text("Detaily Rezervacia/Uprava rezervacie: "),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  "Robi sa: Tu dame ze ozancit ako vybaveny",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
