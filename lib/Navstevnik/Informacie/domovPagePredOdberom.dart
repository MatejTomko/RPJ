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
                        Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
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
                                          "Tekutiny",
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
                                          "24 hod??n pred odberom vypite min. 2 litre (vodu, miner??lku, ??aje, ovocn?? ????avy). R??no pred odberom vypite 500 ml tekut??n. ??ierna k??va je tie?? povolen??.",
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
                        Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
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
                                          "Strava",
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
                                          "Nehladujte! Na odber necho??te nala??no! 12 hod??n pred odberom nejedzte tu??n?? jedl?? (syry, maslo, smotanu, ??deniny...). Vhodn?? s?? sacharidov?? jedl??: ovocie, zelenina, such??re, netukov?? pe??ivo, d??em, med...",
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
                        Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
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
                                          "Oddychujte",
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
                                          "Dbajte na to, aby ste boli odd??chnut??, ??erstv??, po v??datnom sp??nku, preto??e V???? fyzick?? stav sa odzrkadl?? na kvalite Va??ej krvi.",
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
                        Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
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
                                          "Nefaj??ite",
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
                                          "Minim??lne 6 hod??n pred odberom nefaj??ite.",
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
                        Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
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
                                          "Bez alkoholu",
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
                                          "Minim??lne 12 hod??n pred odberom nepite alkohol.",
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
                        Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
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
                                          "Bez n??mahy",
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
                                          "24 hod??n pred odberom sa nevystavujte prive??kej psychickej a fyzickej n??mahe, vynechajte tr??ningy a n??v??tevu posil??ovne",
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
