import 'package:blood_app/Autentifikacia/loginWidget.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text("Nastalá chyba"));
          }else if(snapshot.hasData){
            return Home();
          }else{
            return LoginWidget();
          }
        },
      )
    );
  }
}

