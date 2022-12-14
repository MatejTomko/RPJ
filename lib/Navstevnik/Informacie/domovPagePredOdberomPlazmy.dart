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
        Container(
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
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Plazma",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "T??to ??ivotne d??le??it?? tekutinu m????u poskytn???? iba darcovia plazmy, nemo??no ju synteticky vytvori?? ani vyrobi?? v laborat??riu. Vyr??baj?? sa z nej ??ivot zachra??uj??ce lieky ako album??ny, imunoglobul??ny, faktory ovplyv??uj??ce zr????anie krvi. Darovanie plazmy pom??ha zachr??ni?? a zlep??i?? ??ivot ??ud?? na celom svete, ktor?? trpia ??ivot ohrozuj??cimi stavmi, ako je hemof??lia a in?? poruchy zr????ania krvi, imunitn?? nedostato??nos??, autoim??nne ochorenia, ??a??k?? krv??cania.",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
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
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Pred prv??m darovan??m plazmy",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Darca plazmy mus?? sp????a?? rovnak?? z??kladn?? krit??ri?? ako darca krvi.Pred prv??m odberom plazmy mus?? darca absolvova?? kr??tke lek??rske vy??etrenie a laborat??rne testy. Je nutn?? potvrdi?? sp??sobilos?? darcu na darovanie plazmy a uisti?? sa, ??e jeho plazma obsahuje dostatok bielkov??n a imunuglobul??nov (v opa??nom pr??pade by odber plazmy mohol darcovi u??kodi??).",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
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
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Pravideln?? darcovia krvi",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "V pr??pade z??ujmu odpor????ame informova?? lek??ra odbern??ho centra pri lek??rskom vy??etren?? pred darovan??m krvi, aby napl??noval kontroln?? testy povinn?? pred odberom plazmy u?? pri darovan?? krvi.",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
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
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Prvodarcovia",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Musia r??ta?? s t??m, ??e pri prvej n??v??teve Odbern??ho centra bud?? m??c?? darova?? krv alebo sa im odober?? len vzorky na povinn?? testy a absolvuj?? pohovor s lek??rom. O v??sledkoch testov ich bude odbern?? centrum informova?? a z??rove?? im pon??kne d??tum na prv?? odber plazmy.",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )

                                  ],
                                ),
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
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Komu pom????e Va??a plazma",
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "1200",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "odberov na lie??bu 1 pacienta s hemof??liou",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "130",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "odberov na lie??bu 1 pacienta trpiaceho Prim??rnym syndr??mom im??nnej nedostato??nosti",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "600",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "odberov na lie??bu 1 pacienta s Alpha-1 deficitom",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ),



              ],
            ),
          ),
        )

    );
  }
}
