import 'package:blood_app/Autentifikacia/loginWidget.dart';
import 'package:blood_app/Autentifikacia/signupWidget.dart';
import 'package:blood_app/Autentifikacia/verifyEmailPage.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/home.dart';

class Register extends StatefulWidget{
  const Register({Key? key}) : super(key: key);

  @override
  State <Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if(snapshot.hasError){
              return Center(child: Text("Nastalá chyba"));
            }else if(snapshot.hasData){
              return VerifyEmailPage();
            }else{
              return SignupWidget();
            }
          },
        )
    );
  }
}

