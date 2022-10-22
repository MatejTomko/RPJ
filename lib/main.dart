import 'package:blood_app/home.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/loading.dart';
import 'package:blood_app/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "/",
    routes:{
      "/":(context) => Login(),
      "/home": (context) => Home(),
    },
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}

