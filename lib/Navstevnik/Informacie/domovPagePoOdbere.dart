import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class domovPagePoOdbere extends StatefulWidget {
  const domovPagePoOdbere({Key? key}) : super(key: key);

  @override
  State<domovPagePoOdbere> createState() => _domovPagePoOdbereState();
}

class _domovPagePoOdbereState extends State<domovPagePoOdbere> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Po odbere krvi"),
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
                                          "Zvýšte príjem tekutín počas nasledujúcich 48 hodín",
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
                                          "Vyhýbajte sa zvýšenej fyzickej námahe 5 hodín po odbere",
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
                                          "24 hodín po odbere konzumujte vyváženú stravu",
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
                                          "Obmedzte pitie alkoholických nápojov a fajčenie cigariet",
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
                                          "V prípade modrín v mieste vpichu, aplikujte studený obklad",
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
                                          "Vo zvýšenej miere relaxujte",
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
                                          "Zvýšte opatrnosť pri vedení motorového vozidla",
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
                                          "V prípade zhoršenia zdravotného stavu, kontaktujte lekára NTS",
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
