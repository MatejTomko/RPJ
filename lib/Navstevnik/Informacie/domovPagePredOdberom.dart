import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class domovPagePredOdberom extends StatefulWidget {
  const domovPagePredOdberom({Key? key}) : super(key: key);

  @override
  State<domovPagePredOdberom> createState() => _domovPagePredOdberomState();
}

class _domovPagePredOdberomState extends State<domovPagePredOdberom> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pred odberom krvi"),
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
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/softdrinks.png"),width: 100,),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5,bottom: 5),
                                      child: Text(
                                        "Tekutiny",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "24 hodín pred odberom vypite min. 2 litre (vodu, minerálku, čaje, ovocné šťavy). Ráno pred odberom vypite 500 ml tekutín. Čierna káva je tiež povolená.",
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
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/strava.png"),width: 100,),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5,bottom: 5),
                                      child: Text(
                                        "Strava",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Nehladujte! Na odber nechoďte nalačno! 12 hodín pred odberom nejedzte tučné jedlá (syry, maslo, smotanu, údeniny...). Vhodné sú sacharidové jedlá: ovocie, zelenina, sucháre, netukové pečivo, džem, med...",
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
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/oddych.png"),width: 100,),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5,bottom: 5),
                                      child: Text(
                                        "Oddychujte",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Dbajte na to, aby ste boli oddýchnutí, čerství, po výdatnom spánku, pretože Váš fyzický stav sa odzrkadlí na kvalite Vašej krvi.",
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
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/smoke.png"),width: 110,),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5,bottom: 5),
                                      child: Text(
                                        "Nefajčite",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Minimálne 6 hodín pred odberom nefajčite.",
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
                        SizedBox(height: 10),
                        Image(image: AssetImage("assets/alcohol.png"),width: 120,),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5,bottom: 5),
                                      child: Text(
                                        "Bez alkoholu",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [

                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Minimálne 12 hodín pred odberom nepite alkohol.",
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
                        SizedBox(height: 20),
                        Image(image: AssetImage("assets/namaha2.png"),width: 100,),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 5,bottom: 5),
                                      child: Text(
                                        "Bez námahy",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [

                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "24 hodín pred odberom sa nevystavujte priveľkej psychickej a fyzickej námahe, vynechajte tréningy a návštevu posilňovne",
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
              ],
            ),
          ),
        )

    );
  }
}
