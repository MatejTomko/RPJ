import 'dart:ffi';

import 'package:blood_app/Navstevnik/Informacie/domovPagePoOdbere.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPagePredOdberom.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPagePredOdberomPlazmy.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPageProcesDarovania.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class domovPage extends StatefulWidget {
  const domovPage({Key? key}) : super(key: key);

  @override
  State<domovPage> createState() => _domovPageState();
}

class _domovPageState extends State<domovPage> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Domov"),
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
                                  Image(image: AssetImage("assets/predOdberomKrvi.jpg")),
                                  Row(
                                    children: [
                                      Text(
                                        "Pred odberom krvi",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => domovPagePredOdberom()));
                            },
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
                                  Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
                                  Row(
                                    children: [
                                      Text(
                                        "Proces darovania krvi",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => domovPageProcesDarovania()));
                            },
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
                                  Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
                                  Row(
                                    children: [
                                      Text(
                                        "Po odbere krvi",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => domovPagePoOdbere() ));
                            },
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
                                  Image(image: AssetImage("assets/chybaObrazok.png"),width: 100,),
                                  Row(
                                    children: [
                                      Text(
                                        "Pred odberom plazmy",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => domovPagePredOdberomPlazmy() ));
                            },
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
