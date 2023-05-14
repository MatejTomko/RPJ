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
          SizedBox(height: 150),
          Container(
            padding: EdgeInsets.fromLTRB(10,2,10,2),
            decoration: BoxDecoration(
              color:Colors.black12,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: emailController,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(hintText: "E-mail", border: InputBorder.none),
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.fromLTRB(10,2,10,2),
            decoration: BoxDecoration(
              color:Colors.black12,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              decoration: InputDecoration(hintText: "Heslo", border: InputBorder.none),
              obscureText: true,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
              style: TextButton.styleFrom( shape: StadiumBorder()),
              child: Text(
                "Prihlásiť sa",
                style: TextStyle(color: Colors.white,fontSize: 24),
              ),
              onPressed: signIn,
            ),
          ),
          SizedBox(height: 36),
          TextButton(
            child: Text(
              "Zabudli ste heslo?",
              style: TextStyle(
                color: Colors.red[800],
                fontSize: 20,
              ),
            ),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswordPage())),
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
      print(e.message);
      switch(e.message){
        case "Given String is empty or null":
          Utils.showSnackBar("Vypĺnte všetky políčka!");
          break;
        case "The email address is badly formatted.":
          Utils.showSnackBar("Zlý format emailu!");
          break;
        case "There is no user record corresponding to this identifier. The user may have been deleted.":
          Utils.showSnackBar("Neexistujúci používatel!");
          break;
        case "The password is invalid or the user does not have a password.":
          Utils.showSnackBar("Zlý email alebo heslo!");
          break;
        default:
          Utils.showSnackBar(e.message);
      }
    }

  }

}