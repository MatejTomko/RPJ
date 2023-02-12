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
        margin: EdgeInsets.fromLTRB(15,30,15,10),
        height: MediaQuery.of(context).size.height*0.56,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                ),
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ocPage())
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,15,20,15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/hospital-oc.png", scale: 4.5),
                      Text(
                          "Odberné centrá",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.red[800], size: 25),
                    ],
                  ),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => oceneniaPage())
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,15,20,15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/medal.png", scale: 4.25),
                      Text(
                        "Ocenenia za darovanie",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.red[800], size: 25),
                    ],
                  ),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => benefityPage())
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,15,20,15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/increase.png", scale: 4.25),
                      Text(
                        "Benefity pre darcov",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.red[800], size: 25),
                    ],
                  ),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => liekyPage())
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,15,20,15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/drugs.png", scale: 4.25),
                      Text(
                        "Darovanie krvi pri užívaní liekov",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.red[800], size: 25),
                    ],
                  ),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => otazkyPage())
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,15,20,15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/faq.png", scale: 4.25),
                      Text(
                        "FAQ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.red[800], size: 25),
                    ],
                  ),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => napisteNamPage())
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,15,20,15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/contact-us.png", scale: 4.25),
                      Text(
                        "Napíšte nám",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.red[800], size: 25),
                    ],
                  ),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: () async{
                  FirebaseAuth.instance.signOut();
                  SystemNavigator.pop();
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(25,15,20,15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/logout.png", scale: 4.5),
                      Text(
                        "Odhlásiť sa",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.red[800], size: 25),
                    ],
                  ),
                ),
              ),
              Divider(height: 5),
              /*Divider(),
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
              Divider(),*/

            ],
          ),
        ),
      ),
    );
  }
}
