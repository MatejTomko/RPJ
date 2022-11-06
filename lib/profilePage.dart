import 'package:blood_app/DatabaseManager.dart';
import 'package:blood_app/darca.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  int _idDarca=1000;

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
  darca user=new darca("", "", "", "", "", "", "",DateTime.now());

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
            user.poslednyodber=userDarcaList[i]['poslednyodber'].toDate();
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
        title: Text("Profil darcu"),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26),
              color: Color.fromRGBO(245,245,245, 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(child: Icon(Icons.person_outline_outlined,)),
                            TextSpan(text: "${user.meno} ${user.priezvisko}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                            )),
                          ]
                        )
                      ),
                      if (user.krvnaskupina=="A+") Image(image: AssetImage("assets/a_positive.png"), width: 40),
                      if (user.krvnaskupina=="A-") Image(image: AssetImage("assets/a_negative.png"), width: 40,),
                      if (user.krvnaskupina=="B+") Image(image: AssetImage("assets/b_positive.png"), width: 40,),
                      if (user.krvnaskupina=="B-") Image(image: AssetImage("assets/b_negative.png"), width: 40,),
                      if (user.krvnaskupina=="AB+") Image(image: AssetImage("assets/ab_positive.png"), width: 40,),
                      if (user.krvnaskupina=="AB-") Image(image: AssetImage("assets/ab_negative.png"), width: 40,),
                      if (user.krvnaskupina=="0+") Image(image: AssetImage("assets/zero_positive.png"), width: 40,),
                      if (user.krvnaskupina=="0+") Image(image: AssetImage("assets/zero_negative.png"), width: 40,),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        "Rodné číslo: ${user.rodnecislo}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Počet odberov: ${user.pocetodberov}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        "Posledný odber: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${user.poslednyodber}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),

    );
  }
}