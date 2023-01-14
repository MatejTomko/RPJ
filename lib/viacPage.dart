import 'dart:ffi';
import 'package:blood_app/Navstevnik/Informacie/benefityPage.dart';
import 'package:blood_app/Navstevnik/Informacie/napisteNamPage.dart';
import 'package:blood_app/Navstevnik/Informacie/oceneniaPage.dart';
import 'package:blood_app/Navstevnik/Lieky/liekyPage.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/ocPage.dart';
import 'package:blood_app/Navstevnik/Otazky/otazkyPage.dart';
import 'package:blood_app/first.dart';
import 'package:blood_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restart_app/restart_app.dart';

class viacPage extends StatefulWidget {
  const viacPage({Key? key}) : super(key: key);

  @override
  State<viacPage> createState() => _viacPageState();
}
class _viacPageState extends State<viacPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Viac"),
          backgroundColor: Colors.red[900],
        ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20,10,20,10),
        height: 490,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15,10,20,10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ocPage())
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20,20,20,10),
                      child: Text(
                          "Odberné centrá",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Colors.red[800]),
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => oceneniaPage())
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20,20,20,10),
                      child: Text(
                        "Ocenenia za darovanie",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Colors.red[800]),
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => benefityPage())
                    );
                  },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20,20,20,10),
                      child: Text(
                        "Benefity pre darcov",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Colors.red[800]),
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => liekyPage())
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20,20,20,10),
                      child: Text(
                        "Darovanie krvi pri užívaní liekov",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Colors.red[800]),
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => otazkyPage())
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20,20,20,10),
                      child: Text(
                        "FAQ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Colors.red[800]),
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => napisteNamPage())
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20,20,20,10),
                      child: Text(
                        "Napíšte nám",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Colors.red[800]),
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () async{
                  FirebaseAuth.instance.signOut();
                  SystemNavigator.pop();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20,20,20,10),
                      child: Text(
                        "Odhlásiť sa",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Colors.red[800]),
                  ],
                ),
              ),
              Divider(),

            ],
          ),
        ),
      ),
    );
  }
}
