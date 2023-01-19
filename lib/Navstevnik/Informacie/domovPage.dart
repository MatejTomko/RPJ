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
          Theme(
            data: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
              primarySwatch: Colors.red,
            ),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child:SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Darovanie krvi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                        child: Column(
                          children: [
                            InkWell(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image(
                                          image: AssetImage("assets/predOdberomKrvi.jpg"),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(15),
                                            child: Text(
                                              "Pred odberom krvi",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => domovPagePredOdberom())
                                );
                              },
                            ),
                          ],

                        )
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        image: AssetImage("assets/procesDarovania.jpg"),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(15),
                                          child: Text(
                                            "Proces darovania krvi",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image(image: AssetImage("assets/poOdbere.jpg"))
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(15),
                                          child: Text(
                                            "Po odbere krvi",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image(image: AssetImage("assets/predOdberomPlazma.jpg"),
                                        )
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(15),
                                          child: Text(
                                            "Pred odberom plazmy",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
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
            ),
          )

    );
  }
}
