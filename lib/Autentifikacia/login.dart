import 'package:flutter/material.dart';
import 'package:blood_app/home.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);
  
  @override
  State <Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Prihlásenie"),
        backgroundColor: Colors.red[900],
      ),

    );
  }
}

