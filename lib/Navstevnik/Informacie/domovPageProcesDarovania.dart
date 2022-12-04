import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class domovPageProcesDarovania extends StatefulWidget {
  const domovPageProcesDarovania({Key? key}) : super(key: key);

  @override
  State<domovPageProcesDarovania> createState() => _domovPageProcesDarovaniaState();
}
class _domovPageProcesDarovaniaState extends State<domovPageProcesDarovania> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Proces darovania krvi"),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        child: Text("https://www.youtube.com/watch?v=2VN4p3dIs7E"),
      )
    );
  }
}
