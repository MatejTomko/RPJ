import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';
import 'package:blood_app/home.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/loading.dart';
import 'package:blood_app/Autentifikacia/login.dart';
import 'package:blood_app/first.dart';
import 'package:blood_app/Autentifikacia/registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "/",
    routes:{
      "/":(context) => First(),
      "/home": (context) => Home(),
      "/login": (context) => Login(),
      "/registration": (context) => Registration(),
      "/upravaMobilnaOCPage": (context) => upravaMobilnaOCPage(),
    },
    theme: ThemeData(
      primarySwatch: Colors.red,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.red,
      )
    ),
  ));
}

