import 'package:blood_app/Admin/AdminOC/pridavanieOdberuPage.dart';
import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget{
  @override
  _ForgotPasswordPageState createState()=> _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>{
  final formkey= GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      title: Text("Reset Password"),
    ),
    body: Form(
      key: formkey ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "Heslo si obnovíte po obdržaní emailu.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: "email"),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: ((value) => value == null ? "Zadajte platný email" : null),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
              onPressed: resetPassword,
              icon: Icon(Icons.email_outlined),
              label: Text(
                "Obnovenie hesla",
                style: TextStyle(fontSize: 24),
              ))
        ],
      ),
    ),
  );

  Future resetPassword() async {
    /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
    );*/

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim());

      Utils.showSnackBar("Email na obnovenie heslá bol odoslaný");
    } on FirebaseAuthException catch (e){
      print(e);

      Utils.showSnackBar(e.message);
    }

    //navigatorKey.currentState!.popUntil((route) => route.isFirst); //TODO dorobi nech neukazuje ten showdialog

  }

}