import 'package:blood_app/Autentifikacia/loginWidget.dart';
import 'package:blood_app/HomeAdmin.dart';
import 'package:blood_app/HomeAdminOC.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  if(resultant==null){
    print('Unable to retrieve');
  }else{
    for(var i=0;i< resultant.length;i++){
      if(resultant[i]['email'] == FirebaseAuth.instance.currentUser?.email){
        idDarcu=resultant[i]['idDarca'];
      }
    }
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

