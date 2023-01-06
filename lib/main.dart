import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Autentifikacia/register.dart';
import 'package:blood_app/home.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/loading.dart';
import 'package:blood_app/Autentifikacia/login.dart';
import 'package:blood_app/first.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:blood_app/Admin/AdminVseobecny/upravaMobilnaOCPage.dart';

final navigatorKey = GlobalKey<NavigatorState>();


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
    navigatorKey: navigatorKey,
    initialRoute: "/",
    routes:{
      "/":(context) => First(),
      "/home": (context) => Home(),
      "/login": (context) => Login(),
      "/register": (context) => Register(),
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

