import 'dart:ffi';

import 'package:blood_app/Admin/AdminOC/rezervacia.dart';
import 'package:blood_app/Admin/AdminOC/rezervaciaCard.dart';
import 'package:blood_app/Darca/Odber/odberObjednanie.dart';
import 'package:blood_app/Darca/Profil/preukazDarcu.dart';
import 'package:blood_app/Darca/Profil/rezervaciaCardUser.dart';
import 'package:blood_app/DatabaseManager.dart';
import 'package:blood_app/Darca/Profil/darca.dart';
import 'package:blood_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
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
  List userOdberList = [];
  List userRezervaciaList = [];
  darca user=new darca("", "", "", "", "", "", "","");
  int pocetOdberov=0;
  int zachraneneZivoty=0;
  int plaketa1=0;
  int plaketa2=10;
  double percent=0.0;
  String pl1="";
  String pl2="";

  @override
  void initState() {
    getDocId();
    fetchDatabaseList();
    super.initState();
  }

  DatabaseManager databaseManager=new DatabaseManager();
  String profilovka="assets/avatar.png";

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getDarcaList();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        userDarcaList=resultant;
        for(var i=0;i< userDarcaList.length;i++){
          String help=userDarcaList[i]['idDarca'].toString();
          if(help == idDarcu){
            user.adresa=userDarcaList[i]['adresa'];
            user.priezvisko=userDarcaList[i]['priezvisko'];
            user.meno=userDarcaList[i]['meno'];
            user.krvnaskupina=userDarcaList[i]['krvnaskupina'];
            user.idDarca=userDarcaList[i]['idDarca'].toString();
            user.rodnecislo=userDarcaList[i]['rodnecislo'].toString();
            user.email=userDarcaList[i]['email'].toString();
            user.pocetodberov=0.toString();
          }
        }
      });
    }

    dynamic resultant2=await databaseManager.getOdberList();
    if(resultant2==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        userOdberList=resultant2;
        for(var i=0;i< userOdberList.length;i++){
          String help=userOdberList[i]['idDarca'].toString();
          if(help == idDarcu){
            if((userOdberList[i]['typ'].toString())=="Krvné doštičky"){
              pocetOdberov+=2;
            }else{
              pocetOdberov+=1;
            }
          }
        }
        user.pocetodberov=pocetOdberov.toString();
      });
    }
    zachraneneZivoty=pocetOdberov*3;
    String gender=user.idDarca[2];
    print(gender);
    if(gender=="0"||gender=="1") {
      profilovka="assets/avatar.png";
      if (pocetOdberov < 10) {
        plaketa1 = 0;
        plaketa2 = 10;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 10 && pocetOdberov < 20) {
        plaketa1 = 10;
        plaketa2 = 20;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 20 && pocetOdberov < 40) {
        plaketa1 = 20;
        plaketa2 = 40;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 40 && pocetOdberov < 80) {
        plaketa1 = 40;
        plaketa2 = 80;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 80 && pocetOdberov < 100) {
        plaketa1 = 80;
        plaketa2 = 100;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 100) {
        plaketa1 = 100;
        plaketa2 = 100;
        percent = 1.0;
        //TODO urobit inak
      }
      user.pocetodberov = this.pocetOdberov.toString();
      pl1 = plaketa1.toString();
      pl2 = plaketa2.toString();
    }else{
      profilovka="assets/womanavatar.png";
      if (pocetOdberov < 10) {
        plaketa1 = 0;
        plaketa2 = 10;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 10 && pocetOdberov < 20) {
        plaketa1 = 10;
        plaketa2 = 20;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 20 && pocetOdberov < 30) {
        plaketa1 = 20;
        plaketa2 = 30;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 30 && pocetOdberov < 60) {
        plaketa1 = 30;
        plaketa2 = 60;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 60 && pocetOdberov < 80) {
        plaketa1 = 60;
        plaketa2 = 80;
        int pomocny = pocetOdberov - plaketa1;
        int pomocny2 = plaketa2 - plaketa1;
        percent = 1.0 * pomocny / pomocny2;
      } else if (pocetOdberov >= 80) {
        plaketa1 = 80;
        plaketa2 = 80;
        percent = 1.0;
      }
      user.pocetodberov = this.pocetOdberov.toString();
      pl1 = plaketa1.toString();
      pl2 = plaketa2.toString();
    }


    dynamic resultant3 = await databaseManager.getRezervaciaList();
    if(resultant3==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultant3.length;i++){
          String help=resultant3[i]['idDarca'].toString();
          if(help == idDarcu){
            userRezervaciaList.add(resultant3[i]);
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
      body:
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/avatar.png"), //tu treba dat nech je profilovka zena/muz
              radius: 40.0,
            ),
            Text(
              '${user.meno} ${user.priezvisko}',
              style: const TextStyle(
                letterSpacing: 1.5,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15,20,15,5),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1.5,
                    blurStyle: BlurStyle.normal,
                    //blurRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          width: 32,
                          image: AssetImage("assets/heart_beat.png"),
                          color: Colors.red[700],
                        ),
                        SizedBox(height: 3),
                        Text(
                            '$zachraneneZivoty',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Zachránené životy',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image(
                          width: 32,
                          image: AssetImage("assets/blood_drop.png"),
                          color: Colors.red[700],
                        ),
                        SizedBox(height: 3),
                        Text(
                          '${user.krvnaskupina}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Krvná skupina',
                          style: TextStyle(
                            fontSize:14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image(
                          width: 32,
                          image: AssetImage("assets/blood_bag.png"),
                          color: Colors.red[700],
                        ),
                        SizedBox(height: 3),
                        Text(
                          '$pocetOdberov',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Počet odberov',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.fromLTRB(0,10,0,20),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1.5,
                      blurStyle: BlurStyle.normal,
                      //blurRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25,0,0,0),
                    child: Text(
                      "Cesta k plakete: ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15,5,15,0),
                    child:LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 80,
                      animation: true,
                      animationDuration: 1200,
                      lineHeight: 12.0,
                      percent: percent,
                      backgroundColor: Colors.grey[300],
                      progressColor: Colors.red[800],
                      barRadius: Radius.circular(12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24,0,35,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pl1,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          pl2,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15,0,15,0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => preukazDarcu(user) ));
                        },
                        icon: const Icon(
                          Icons.add_card_sharp,
                          size: 32,
                          color: Colors.black,
                        ),
                        label: const Text(
                            "Karta darcu",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 100,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => odberObjednanie() ));
                        },
                        icon: const Icon(
                          Icons.contact_mail,
                          size: 32,
                          color: Colors.black,
                        ),
                        label: const Text(
                            "Rezervácia termínu",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.fromLTRB(5,10,0,0),
              child: Text("Moje termíny",
                style: TextStyle(
                    fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: ListView.builder(
                itemCount: userRezervaciaList.length,
                itemBuilder:(context, index) {
                  String meno=user.meno+" "+user.priezvisko;
                  rezervacia rz=new rezervacia(userRezervaciaList[index]['idDarca'].toString(), userRezervaciaList[index]['oc'], userRezervaciaList[index]['datum'],meno,userRezervaciaList[index]['typ'],userRezervaciaList[index]['vybavene'],userRezervaciaList[index]['cas']);
                  return RezervaciaCardUser(rz);
                }
            ),
            )
          ],

        ),



      )
    );
  }
}