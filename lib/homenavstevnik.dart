import 'package:blood_app/Admin/AdminOC/kontrolaTerminovPage.dart';
import 'package:blood_app/Admin/AdminOC/pridavanieOdberuPage.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaOtazkyPage.dart';
import 'package:blood_app/Admin/AdminVseobecny/zobrazovanieNapisteNamPage.dart';
import 'package:blood_app/Darca/Odber/odberObjednanie.dart';
import 'package:blood_app/DatabaseManager.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/Navstevnik/Informacie/benefityPage.dart';
import 'package:blood_app/Navstevnik/Informacie/napisteNamPage.dart';
import 'package:blood_app/Navstevnik/Informacie/oceneniaPage.dart';
import 'package:blood_app/Navstevnik/Lieky/liekyPage.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/ocPage.dart';
import 'package:blood_app/Darca/Odber/odberyPage.dart';
import 'package:blood_app/Darca/Profil/profilePage.dart';
import 'package:blood_app/Navstevnik/Otazky/otazkyPage.dart';
import 'package:blood_app/viacPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Admin/AdminVseobecny/zobrazovanieNapisteNamPage.dart';
import 'Navstevnik/Informacie/domovPage.dart';

class HomeNavstevnik extends StatefulWidget {
  const HomeNavstevnik({Key? key}) : super(key: key);

  @override
  State<HomeNavstevnik> createState() => _HomeNavstevnikState();
}

class _HomeNavstevnikState extends State<HomeNavstevnik> {
  /*int _idDarca=1;

  //document IDs
  String docIds = "";

  //get Database id veci,...
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('Darca').get().then(
        (snapshot) => snapshot.docs.forEach((element) {
          if(element.reference.id=="1"){
            docIds=element.reference.id;
          }
        })
    );
  }*/

  @override
  void initState() {
    //getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigationBar(),
    );
  }

}

class MyBottomNavigationBar extends StatefulWidget{
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>
{

  List<Widget> pages=
  [
    domovPage(),
    viacPage(),
    //liekyPage(),
    //ocPage(),
    // oceneniaPage(),
    // benefityPage(),
    // napisteNamPage(),
    // otazkyPage(),

  ];
  int _selectedIndex= 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type:   BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[700],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:"Domov",
          ),


          // BottomNavigationBarItem(
          //   icon: Icon(Icons.pest_control),
          //   label:"Ocenenia",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.pest_control),
          //   label:"Benefity",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.pest_control),
          //   label:"Napište Nám",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.pest_control),
          //   label:"Faq",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: "Viac",
          ),

        ],
      ),


    );
  }
}