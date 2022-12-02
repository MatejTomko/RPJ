import 'package:blood_app/home.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/loading.dart';
import 'package:blood_app/login.dart';
import 'package:blood_app/first.dart';
import 'package:blood_app/registration.dart';
import 'package:firebase_core/firebase_core.dart';

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
    },
    theme: ThemeData(
      primarySwatch: Colors.red,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.red,
      )
    ),
  ));
}

