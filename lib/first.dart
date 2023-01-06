import 'package:blood_app/homenavstevnik.dart';
import 'package:flutter/material.dart';
import 'package:blood_app/home.dart';
import 'package:blood_app/Autentifikacia/login.dart';


class First extends StatefulWidget{
  const First({Key? key}) : super(key: key);

  @override
  State <First> createState() => _FirstState();
}

class _FirstState extends State<First>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prihlásenie"),
        backgroundColor: Colors.red[900],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Image(
                    image: AssetImage("assets/blood.png"),
                    width: 150,
                    ///logo
                  ),
                ),
                const SizedBox(height: 100),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: (){
                      //TODO prepojenie na home screen
                      Navigator.pushNamed(context, "/login");
                    },
                    style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    child: const Text(
                      "Prihlásenie",
                      style: TextStyle(color: Colors.white,fontSize: 22),
                    ),
                  ),
                ),
                /// Registration
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    onPressed: (){
                      //TODO prepojenie na home screen
                      Navigator.pushNamed(context, "/register");
                    },
                    style: TextButton.styleFrom(
                      shape: const StadiumBorder(
                        side: BorderSide(color: Color.fromRGBO(183, 28, 28, 1), width: 2, style: BorderStyle.solid),
                      ),
                    ),
                    child: const Text(
                      "Registrácia",
                      style: TextStyle(color: Color.fromRGBO(183, 28, 28, 1),fontSize: 22),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                TextButton(
                  onPressed: (){
                    //TODO prepojenie na homescreen pre navstevnika
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeNavstevnik())
                    );
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

