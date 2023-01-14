
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Autentifikacia/register.dart';
import 'package:blood_app/Darca/Profil/profilePage.dart';
import 'package:blood_app/HomeAdmin.dart';
import 'package:blood_app/HomeAdminOC.dart';
import 'package:blood_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/loading.dart';
import 'package:blood_app/Autentifikacia/login.dart';
import 'package:blood_app/first.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';

import 'DatabaseManager.dart';

final navigatorKey = GlobalKey<NavigatorState>();
String idDarcu="";
String oc="";

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
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await fetchDatabaseList();
  print(FirebaseAuth.instance.currentUser?.uid);
  String route="/";
  if(FirebaseAuth.instance.currentUser?.uid=="Dj7lNzj5KibfhRFGWoMwZqlhF7b2"){
    oc="OC Prešov";
    route="/homeAdminOC";
  }else if(FirebaseAuth.instance.currentUser?.uid=="jMmJROBoVcRLhV4dbQsyr4Hp9pD3"){
    oc="OC Poprad";
    route="/homeAdminOC";
  }else if(FirebaseAuth.instance.currentUser?.uid=="eeVqGtnQETQrKCf231q0msf138F2"){
    route="/homeAdmin";
  }else if(FirebaseAuth.instance.currentUser?.uid != null){
    route="/home";
  }else{
    route="/";
  }
  runApp(MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
    navigatorKey: navigatorKey,
    initialRoute: route,
    routes:{
      "/":(context) => First(),
      "/home": (context) => Home(),
      "/homeAdminOC": (context) => HomeAdminOC(),
      "/homeAdmin": (context) => HomeAdmin(),
      "/login": (context) => Login(),
      "/register": (context) => Register(),
      "/upravaMobilnaOCPage": (context) => upravaMobilnaOCPage(),
      "/profile": (context) => profilePage(),
    },
    theme: ThemeData(
      primarySwatch: Colors.red,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.red,
      )
    ),
  ));
}

