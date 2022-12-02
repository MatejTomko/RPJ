import 'package:blood_app/DatabaseManager.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/Navstevnik/Informacie/benefityPage.dart';
import 'package:blood_app/Navstevnik/Informacie/napisteNamPage.dart';
import 'package:blood_app/Navstevnik/Informacie/oceneniaPage.dart';
import 'package:blood_app/Navstevnik/Lieky/liekyPage.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/ocPage.dart';
import 'package:blood_app/Darca/Odber/odberyPage.dart';
import 'package:blood_app/Darca/Profil/profilePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    profilePage(),
    odberyPage(),
    liekyPage(),
    ocPage(),
    oceneniaPage(),
    benefityPage(),
    napisteNamPage(),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label:"Odbery"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_rounded),
              label:"Lieky"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label:"OC"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pest_control),
            label:"Ocenenia",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pest_control),
            label:"Benefity",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pest_control),
            label:"Napište Nám",
          ),
        ],
      ),


    );
  }
}