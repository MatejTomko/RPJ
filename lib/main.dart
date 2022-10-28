import 'package:blood_app/home.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/loading.dart';
import 'package:blood_app/login.dart';
import 'package:blood_app/first.dart';
import 'package:blood_app/registration.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes:{
    "/":(context) => First(),
    "/home": (context) => Home(),
    "/login": (context) => Login(),
    "/registration": (context) => Registration(),
  },
  theme: ThemeData(
    primarySwatch: Colors.red,
  ),
));

