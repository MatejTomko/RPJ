import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class domovPagePredOdberomPlazmy extends StatefulWidget {
  const domovPagePredOdberomPlazmy({Key? key}) : super(key: key);

  @override
  State<domovPagePredOdberomPlazmy> createState() => _domovPagePredOdberomPlazmyState();
}

class _domovPagePredOdberomPlazmyState extends State<domovPagePredOdberomPlazmy> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pred odberom plazmy"),
          backgroundColor: Colors.red[900],
        ),

        body:
        Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
            primarySwatch: Colors.red,
          ),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                      child: Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Plazma",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "Túto životne dôležitú tekutinu môžu poskytnúť iba darcovia plazmy, nemožno ju synteticky vytvoriť ani vyrobiť v laboratóriu. Vyrábajú sa z nej život zachraňujúce lieky ako albumíny, imunoglobulíny, faktory ovplyvňujúce zrážanie krvi. Darovanie plazmy pomáha zachrániť a zlepšiť život ľudí na celom svete, ktorí trpia život ohrozujúcimi stavmi, ako je hemofília a iné poruchy zrážania krvi, imunitná nedostatočnosť, autoimúnne ochorenia, ťažké krvácania.",
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),

                  Card(
                      child: Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Pred prvým darovaním plazmy",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "Darca plazmy musí spĺňať rovnaké základné kritériá ako darca krvi.Pred prvým odberom plazmy musí darca absolvovať krátke lekárske vyšetrenie a laboratórne testy. Je nutné potvrdiť spôsobilosť darcu na darovanie plazmy a uistiť sa, že jeho plazma obsahuje dostatok bielkovín a imunuglobulínov (v opačnom prípade by odber plazmy mohol darcovi uškodiť).",
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),

                  Card(
                      child: Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Pravidelní darcovia krvi",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "V prípade záujmu odporúčame informovať lekára odberného centra pri lekárskom vyšetrení pred darovaním krvi, aby naplánoval kontrolné testy povinné pred odberom plazmy už pri darovaní krvi.",
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Card(
                      child: Column(
                        children: [
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Prvodarcovia",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      "Musia rátať s tým, že pri prvej návšteve Odberného centra budú môcť darovať krv alebo sa im odoberú len vzorky na povinné testy a absolvujú pohovor s lekárom. O výsledkoch testov ich bude odberné centrum informovať a zároveň im ponúkne dátum na prvý odber plazmy.",
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                    height: 200,
                    child: Card(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8,right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "1200",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "130",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "600",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Text(
                                            "odberov na liečbu 1 pacienta s hemofíliou",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Text(
                                            "odberov na liečbu 1 pacienta trpiaceho Primárnym syndrómom imúnnej nedostatočnosti",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "odberov na liečbu 1 pacienta s Alpha-1 deficitom",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
