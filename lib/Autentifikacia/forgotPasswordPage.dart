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
      backgroundColor: Colors.red[900],
      elevation: 0,
      title: Text("Zabudnuté heslo"),
    ),
    body: Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
        primarySwatch: Colors.red,
      ),
      child: Form(
        key: formkey ,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Text(
                        "Heslo si obnovíte po obdržaní e-mailu.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18, color: Colors.red[700]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(10,2,10,2),
                decoration: BoxDecoration(
                  color:Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: "Zadajte E-mail", border: InputBorder.none),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: ((value) => value == null ? "Zadajte platný email" : null),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(shape: StadiumBorder()),
                   onPressed: resetPassword,
                   child: Text(
                     "Obnovenie hesla",
                     style: TextStyle(fontSize: 22, color: Colors.white),
                   )),
              )
            ],
          ),
        ),
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