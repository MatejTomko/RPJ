import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class oceneniaPage extends StatefulWidget {
  const oceneniaPage({Key? key}) : super(key: key);

  @override
  State<oceneniaPage> createState() => _oceneniaPageState();
}

class _oceneniaPageState extends State<oceneniaPage> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ocenenia"),
        backgroundColor: Colors.red[900],
      ),


      body:
        Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    "Ocenenia za darovanie",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    "Za účelom získania ocenenia sa odber krvi alebo plazmy započíta darcovi ako jeden odber,"
                        "odber krvných doštičiek sa započíta ako dva odbery.",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "Oceňovanie darcov krvi plaketami prof. MUDr. Jana Janského alebo medailou prof. MUDr. Jána Kňazovického za mnohonásobné darovanie krvi vykonáva Slovenský Červený kríž. "
                        "Po dosiahnutí nároku na udelenie príslušnej plakety si darca vyplní tlačivo,,Návrh na udelenie ocenenia“, a vhodí ho do schránky na odbernom pracovisku. "
                        "Plaketa s kartičkou držiteľa plakety bude darcovi doručená zo strany Slovenského Červeného kríža poštou.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Počet odberov, za ktoré môžete získať ocenenie",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Muži Ženy Bronzová plaketa 10 10 Strieborná plaketa 20 20 Zlatá plaketa 40 30 Diamantová plaketa 80 60 Kňazovického medaila 100 80",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
