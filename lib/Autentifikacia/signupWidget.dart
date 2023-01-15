import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/DatabaseManager.dart';
import 'package:blood_app/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupWidget extends StatefulWidget{
  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget>{
  final formKey= GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController= TextEditingController();
  final passwordController2= TextEditingController();
  final eanController= TextEditingController();


  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    passwordController2.dispose();
    eanController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    fetchDatabaseList();
    super.initState();
  }

  List userDarcovia=[];
  List userDarcoviaId=[];

  DatabaseManager databaseManager=new DatabaseManager();

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getDarcaList2();
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultant[0].length;i++){
          userDarcovia.add(resultant[0][i]);
          userDarcoviaId.add(resultant[1][i]);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text("Registrácia"),
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
          child: Form(
            key: formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: "Email"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) =>
                value == null
                  ? "Zadajte platný email"
                    : null),
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Heslo"),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) => value != null && value.length<6
                    ? "Zadajte minimálne 6 znakov!" : null),
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: passwordController2,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Heslo"),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) => value != null && value.length<6
                    ? "Zadajte minimálne 6 znakov!" : null),
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: eanController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Evidečný kód"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ((value) => value != null && value.length<10
                    ? "Zadajte Váš evidenčný kód!" : null),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.lock_open,size: 32),
                label: Text(
                  "Zaregistrovať sa",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signUp,
              )
            ],
          ),
          ),
        ),
        ),
      );

  Future signUp() async {
    final isValid= formKey.currentState!.validate();
    if(!isValid) return;
    if(passwordController.text!=passwordController2.text){
      Utils.showSnackBar("Heslá sa nezhodujú!");
      return;
    }
    for(var i=0;i<userDarcovia.length;i++){
      if(userDarcovia[i]['idDarca']==eanController.text){
        if(userDarcovia[i]['email']=="-"){
          var db=FirebaseFirestore.instance.collection("Darca").doc(userDarcoviaId[i]).update({
            "adresa":userDarcovia[i]['adresa'],
            "email":emailController.text,
            "idDarca":userDarcovia[i]['idDarca'],
            "krvnaskupina":userDarcovia[i]['krvnaskupina'],
            "meno":userDarcovia[i]['meno'],
            "priezvisko":userDarcovia[i]['priezvisko'],
            "rodnecislo":userDarcovia[i]['rodnecislo'],
          });
          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );
          } on FirebaseAuthException catch (e){
            print(e);

            Utils.showSnackBar(e.message);
          }
          Utils.showSnackBar("Ste zaregistrovaný!");
          emailController.clear();
          passwordController2.clear();
          passwordController.clear();
          eanController.clear();
          return;
        }
      }
    }
    Utils.showSnackBar("Daný evidenčný kod neexistuje alebo darca už je zaregistrovaný!");


    /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
    );*/

    //navigatorKey.currentState!.popUntil((route) => route.isFirst); //TODO dorobi nech neukazuje ten showdialog
  }

}