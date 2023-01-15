import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Autentifikacia/forgotPasswordPage.dart';
import 'package:blood_app/home.dart';
import 'package:blood_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget{
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>{
  final emailController = TextEditingController();
  final passwordController= TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
  Scaffold(
      appBar: AppBar(
        title: const Text("Prihlásenie"),
        backgroundColor: Colors.red[900],
      ),
    body:
    Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
        primarySwatch: Colors.red,
      ),
    child:SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: "Email"),
          ),
          SizedBox(height: 4),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: "Heslo"),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            icon: Icon(Icons.lock_open,size: 32),
            label: Text(
              "Sign in",
              style: TextStyle(fontSize: 24),
            ),
            onPressed: signIn,
          ),
          SizedBox(height: 24),
          GestureDetector(
            child: Text(
              "Zabudli ste heslo?",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.background,
                fontSize: 20,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswordPage())),
          ),
        ],
      ),
    ),
    ),
  );

  Future signIn() async {
    /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
    );*/

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      //Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e){
      print(e);
      
      Utils.showSnackBar(e.message);
      //Navigator.of(context).pop();
    }

  }

}