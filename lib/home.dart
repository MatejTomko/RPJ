import 'package:blood_app/DatabaseManager.dart';
import 'package:blood_app/darca.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
  }

  List userDarcaList = [];
  darca user=new darca("", "", "", "", "", "", "", "");


  @override
  void initState() {
    getDocId();
    fetchDatabaseList();
    super.initState();
  }

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
      dynamic resultant = await databaseManager.getDarcaList();
      if(resultant==null){
        print('Unable to retrieve');
      }else{
        setState(() {
          userDarcaList=resultant;
          for(var i=0;i< userDarcaList.length;i++){
            String help=userDarcaList[i]['idDarca'].toString();
          if(help == "1000"){
              user.adresa=userDarcaList[i]['adresa'];
              user.priezvisko=userDarcaList[i]['priezvisko'];
              user.meno=userDarcaList[i]['meno'];
              user.krvnaskupina=userDarcaList[i]['krvnaskupina'];
              user.idDarca=userDarcaList[i]['idDarca'].toString();
              user.pocetodberov=userDarcaList[i]['pocetodberov'];
              user.poslednyodber=userDarcaList[i]['poslednyodber'].toString();
              user.rodnecislo=userDarcaList[i]['rodnecislo'].toString();
            }
          }
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(
                    "Meno a Priezvisko",
                    style: TextStyle(
                      color: Colors.red[800],
                      fontSize: 18,
                    ),
                  ),
                Text(
                  user.meno +" "+user.priezvisko,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
                Text(
                  "rodnecislo",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
                Text(
                  user.rodnecislo,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Krvna skupina",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
                Text(
                  user.krvnaskupina,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Pocet odberov",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
                Text(
                  user.pocetodberov,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Posledny odber",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
                Text(
                  user.poslednyodber,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),

              ],
            )
        ),
      ),


    );
  }
}