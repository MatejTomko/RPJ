import 'package:blood_app/Admin/AdminOC/kontrolaTerminovPage.dart';
import 'package:blood_app/Admin/AdminOC/pridanieDarcuPage.dart';
import 'package:blood_app/Admin/AdminOC/pridavanieOdberuPage.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaOtazkyPage.dart';
import 'package:blood_app/Admin/AdminVseobecny/zobrazovanieNapisteNamPage.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';

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
import 'Autentifikacia/Utils.dart';
import 'Navstevnik/Informacie/domovPage.dart';


class HomeAdminOC extends StatefulWidget {
  const HomeAdminOC({Key? key}) : super(key: key);

  @override
  State<HomeAdminOC> createState() => _HomeAdminOCState();

}

class _HomeAdminOCState extends State<HomeAdminOC> {

  @override
  void initState() {
    //getDocId();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
    kontrolaTerminovPage(),
    pridavanieOdberuPage(),
    pridanieDarcuPage(),
    viacPage(),
  ];
  int _selectedIndex= 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[_selectedIndex],
      bottomNavigationBar: isKeyboardOpen
          ? null
          : BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type:   BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[700],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:"Domov",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Termíny",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Odbery",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Darca",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: "Viac",
          ),
        ],
      ),


    );
  }
}