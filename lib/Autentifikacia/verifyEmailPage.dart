import 'dart:async';

import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget{
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage>{
  bool isEmailVerified=false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState(){
    super.initState();
    isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified){
      sendVerificationEmail();

      timer= Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified() );
    }
  }

  @override
  void dispose(){
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if(isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async{
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail=false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail=true);
    }catch (e){
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? Home()
      : Scaffold(
    appBar: AppBar(
      title: Text("Overte email!"),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Overovací email bol odoslaný na váš mail.",
            style:TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: canResendEmail ? sendVerificationEmail: null,
              icon: Icon(Icons.email,size: 32),
              label: Text("Odoslať znovu",style: TextStyle(fontSize: 24))
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: Icon(Icons.email,size: 32),
              label: Text("Cancel",style: TextStyle(fontSize: 24))
          )
        ],
      ),
    ),
  );

}