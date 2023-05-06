import 'package:blood_app/Autentifikacia/loginWidget.dart';
import 'package:blood_app/HomeAdmin.dart';
import 'package:blood_app/HomeAdminOC.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/home.dart';

import '../DatabaseManager.dart';
import '../main.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);
  
  @override
  State <Login> createState() => _LoginState();
}


DatabaseManager databaseManager=new DatabaseManager();

fetchDatabaseList() async{
  dynamic resultant = await databaseManager.getDarcaList();
  dynamic resultant2 = await databaseManager.getNotifikovanieList();
  List resultant2id=[];
  List resultant2ListTokenov=[];
  resultant2id=resultant2[1];
  resultant2ListTokenov=resultant2[0];

  String krvnaskupina="-";
  String email="-";

  if(resultant==null){
    print('Unable to retrieve');
  }else{
    for(var i=0;i< resultant.length;i++){
      if(resultant[i]['email'] == FirebaseAuth.instance.currentUser?.email){
        idDarcu=resultant[i]['idDarca'];
        krvnaskupina=resultant[i]['krvnaskupina'];
        email=resultant[i]['email'];
      }
    }
  }


  if(resultant2ListTokenov==null){
    print('Unable to retrieve');
  }else{
    String? tokenpomocny="-";
    await FirebaseMessaging.instance.getToken().then((value) =>
    tokenpomocny=value
    );
    for(var i=0;i< resultant2ListTokenov.length;i++){
      String idecko=resultant2id[i].toString();
      idecko=idecko.substring(1,idecko.length-1);
      if(resultant2ListTokenov[i]['token'].toString() == tokenpomocny || resultant2ListTokenov[i]['email'].toString()==email){
        await FirebaseFirestore.instance.collection("Notifikovanie").doc(idecko).delete();
      }

    }
    await FirebaseFirestore.instance
        .collection("Notifikovanie").add({
      "skupina": krvnaskupina,
      "token": tokenpomocny,
      "email": email,
    });
  }
}

class _LoginState extends State<Login>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {


          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text("Nastalá chyba"));
          }else if(FirebaseAuth.instance.currentUser?.uid=="Dj7lNzj5KibfhRFGWoMwZqlhF7b2" || FirebaseAuth.instance.currentUser?.uid=="jMmJROBoVcRLhV4dbQsyr4Hp9pD3"){
            if(FirebaseAuth.instance.currentUser?.uid=="Dj7lNzj5KibfhRFGWoMwZqlhF7b2") {
              oc = "OC Prešov";
            }else{
              oc="OC Poprad";
            }
            return HomeAdminOC();
          }else if(FirebaseAuth.instance.currentUser?.uid=="eeVqGtnQETQrKCf231q0msf138F2"){
            return HomeAdmin();
          }else if(snapshot.hasData){
            fetchDatabaseList();
            return Home();
          }else{
            return LoginWidget();
          }
        },
      )
    );
  }
}

