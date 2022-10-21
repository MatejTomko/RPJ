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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 150,
                  ///tu bude logo
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: "E-mail",
                    hintText: "Zadajte E-mail"
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:15.0,right:15.0,top:15,bottom:0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: "Heslo",
                    hintText: "Zadaj silné heslo",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:15.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: (){
                        //TODO zabudnute heslo obrazovka
                      },
                      child: Text(
                        "Zabudli ste heslo?",
                        style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 15,
                        ),
                      ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: (){
                    //TODO prepojenie na home screen
                    Navigator.pushNamed(context, "/home");
                  },
                  child: const Text(
                    "Prihlásiť sa",
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              TextButton(
                onPressed: (){
                  //TODO prepojenie na homescreen pre navstevnika
                },
                child: Text(
                  "Pokračovať bez registrácie",
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

