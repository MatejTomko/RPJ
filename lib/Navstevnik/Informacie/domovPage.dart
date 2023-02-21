import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPagePoOdbere.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPagePredOdberom.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPagePredOdberomPlazmy.dart';
import 'package:blood_app/Navstevnik/Informacie/domovPageProcesDarovania.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class domovPage extends StatefulWidget {
  const domovPage({Key? key}) : super(key: key);


  launchURL (String url) async {
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url));
    }else{
      throw "Could not launch $url";
    }
  }

  @override
  State<domovPage> createState() => _domovPageState();
}

class _domovPageState extends State<domovPage> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Domov"),
        backgroundColor: Colors.red[900],
      ),

      body:
          Theme(
            data: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
              primarySwatch: Colors.red,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child:Column(
                children: [
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(top: 20,bottom: 25, left: 15),
                    child: Text(
                      "Darovanie krvi",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => domovPagePredOdberom())
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image(
                                                image: AssetImage("assets/predOdberomKrvi.jpg"),
                                                height: MediaQuery.of(context).size.height*0.158,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: AutoSizeText(
                                          "Pred odberom krvi",
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                )
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  onTap: (){
                                    const url = "https://www.youtube.com/watch?v=2VN4p3dIs7E";
                                    launchUrl(Uri.parse(url));
                                    /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => domovPageProcesDarovania()));*/
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image(
                                                image: AssetImage("assets/procesDarovania.jpg"),
                                                height: MediaQuery.of(context).size.height*0.158,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: AutoSizeText(
                                          "Proces darovania krvi",
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => domovPagePoOdbere() ));
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image(
                                                image: AssetImage("assets/poOdbere.jpg"),
                                                height: MediaQuery.of(context).size.height*0.158,
                                                fit: BoxFit.fill,
                                              ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: AutoSizeText(
                                        "Po odbere krvi",
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                        ),
                          ),

                          Expanded(
                            flex: 5,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => domovPagePredOdberomPlazmy() ));
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: Image(
                                                  image: AssetImage("assets/predOdberomPlazma.jpg"),
                                                  height: MediaQuery.of(context).size.height*0.158,
                                                  fit: BoxFit.fill,
                                                ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: AutoSizeText(
                                          "Pred odberom plazmy",
                                          maxLines: 2,
                                          minFontSize: 18,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                ],
              ),
            ),
          )

    );
  }
}
