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
        title: const Text("Ocenenia"),
        backgroundColor: Colors.red[900],
      ),


      body:
        Container(
          child:SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0,0,15,0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Ocenenia za darovanie",
                          style: TextStyle(
                            color: Color.fromRGBO(211, 47, 47, 1),
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const Text(
                        "Za účelom získania ocenenia sa odber krvi alebo plazmy započíta darcovi ako jeden odber,"
                            "odber krvných doštičiek sa započíta ako dva odbery.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        "Oceňovanie darcov krvi plaketami prof. MUDr. Jana Janského alebo medailou prof. MUDr. Jána Kňazovického za mnohonásobné darovanie krvi vykonáva Slovenský Červený kríž. "
                            "Po dosiahnutí nároku na udelenie príslušnej plakety si darca vyplní tlačivo,,Návrh na udelenie ocenenia“, a vhodí ho do schránky na odbernom pracovisku. "
                            "Plaketa s kartičkou držiteľa plakety bude darcovi doručená zo strany Slovenského Červeného kríža poštou.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      const Text("Počet odberov, za ktoré môžete získať ocenenie: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      DataTable(
                        columns: const [
                          DataColumn(label: Text(
                              'Plaketa',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          )),
                          DataColumn(label: Text(
                              'Muži',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          )),
                          DataColumn(label: Text(
                              'Ženy',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                          )),
                        ],
                        rows: const [
                          DataRow(cells: [
                            DataCell(Text('Bronzová plaketa')),
                            DataCell(Text('10')),
                            DataCell(Text('10')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Strieborná plaketa')),
                            DataCell(Text('20')),
                            DataCell(Text('20')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Zlatá plaketa')),
                            DataCell(Text('40')),
                            DataCell(Text('30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Diamantová plaketa')),
                            DataCell(Text('80')),
                            DataCell(Text('60')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Kňazovického medaila')),
                            DataCell(Text('100')),
                            DataCell(Text('80')),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
      ),
    );
  }
}
