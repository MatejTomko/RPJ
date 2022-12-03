import 'dart:ffi';

import 'package:blood_app/Navstevnik/Informacie/benefityPageDetailKompenzacie.dart';
import 'package:blood_app/Navstevnik/Informacie/benefityPageDetailVyhody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class benefityPage extends StatefulWidget {
  const benefityPage({Key? key}) : super(key: key);

  @override
  State<benefityPage> createState() => _benefityPageState();
}

class _benefityPageState extends State<benefityPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Benefity"),
        backgroundColor: Colors.red[900],
      ),

      body: Container(
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
                                  Text(
                                    "Zákonom určené kompenzácie",
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
                                  builder: (context) => benefityPageDetailKompenzacie()));
                        },
                      ),
                    ],
                  ),
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
                                    "Zákonom určené výhody",
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
                                  builder: (context) => benefityPageDetailVyhody()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),

    );
  }
}
