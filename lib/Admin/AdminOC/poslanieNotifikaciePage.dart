import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:blood_app/Autentifikacia/Utils.dart';
import 'package:blood_app/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

import '../../DatabaseManager.dart';


class poslanieNotifikaciePage extends StatefulWidget{
  const poslanieNotifikaciePage({Key? key}) : super(key: key);

  @override
  State<poslanieNotifikaciePage> createState() => _poslanieNotifikaciePageState();

}
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

Future sendEmail({
  required String name,
  required String email,
  required String message,
}) async{
  final serviceId='service_d2z81rs';
  final templateId='template_oe4dlbe';
  final userId='gaHIMydx86ehMFXfn';

  final url=Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params':{
        'to_name':name,
        'blood':message,
        'user_email':email,
      },
    }),
  );

  print(response.body);
}

class _poslanieNotifikaciePageState extends State<poslanieNotifikaciePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  var _controllerkrvnaskupina=TextEditingController();
  String? token=" ";
  List UserDarcaList=[];
  List UserNotifikaciaList=[];

  DatabaseManager databaseManager=new DatabaseManager();
  bool _isButtonDisabled = false;
  late Timer _timer;
  int _currentTimeValue=0;
  int _timerDuration=600;

  void _onButtonPressed(){
    if(!_isButtonDisabled){
      setState(() {
        _isButtonDisabled=true;
      });
      _timer=Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if(_currentTimeValue<_timerDuration){
            _currentTimeValue++;
          }else{
            _isButtonDisabled=false;
            _timer.cancel();
          }
        });
      });

    }
  }

  fetchDatabaseList() async{
    dynamic resultant = await databaseManager.getDarcaList();
    //display=userKamenneOCList;
    if(resultant==null){
      print('Unable to retrieve');
    }else{
      setState(() {
        for(var i=0;i< resultant.length;i++){
          UserDarcaList.add(resultant[i]);
        }
      });
    }

    dynamic resultant2 = await databaseManager.getNotifikovanieList();
    UserNotifikaciaList=resultant2[0];
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
    /*FirebaseMessaging _firebaseMessaging=FirebaseMessaging.instance;
    _firebaseMessaging.getToken().then((value){
      token=value;
      print("My token $token");
    });*/

    _controllerkrvnaskupina.addListener(() {
      final String text = _controllerkrvnaskupina.text;
      _controllerkrvnaskupina.value = _controllerkrvnaskupina.value.copyWith(
        text: text,
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Poslanie notifikácie"),
          backgroundColor: Colors.red[900],
        ),

        body: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
            primarySwatch: Colors.red,
          ),
          child: Container(
            child:SingleChildScrollView(
              child: FormBuilder(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(12,0,10,2),
                        decoration: BoxDecoration(
                          color:Colors.black12,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(0,20,0,0),
                                  child: const Text(
                                    "Krvná skupina"
                                    ,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            FormBuilderRadioGroup<String>(
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                ),
                                border: InputBorder.none,
                              ),
                              initialValue: null,
                              name: 'krvna_skupina',
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required()]),
                              options:
                              ['A-', 'A+','B-', 'B+','AB-', 'AB+','0-', '0+']
                                  .map((moznosti) => FormBuilderFieldOption(
                                value: moznosti,
                                child: Text(moznosti),
                              ))
                                  .toList(growable: false),
                              onChanged: ((value) {
                                _controllerkrvnaskupina.text=value!;
                              }),
                              controlAffinity: ControlAffinity.trailing,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: 250,
                        child: TextButton(
                          style:  !_isButtonDisabled? TextButton.styleFrom(
                            foregroundColor: Colors.red[100],
                            backgroundColor: Colors.red[900],
                            shape: StadiumBorder(),
                          ): TextButton.styleFrom(foregroundColor: Colors.black12, backgroundColor: Colors.black26,shape: StadiumBorder()),
                          onPressed: () async{
                            if(_formKey.currentState!.validate() && _isButtonDisabled==false ){

                              /*var db=FirebaseFirestore.instance.collection("Darca").add({
                                "krvnaskupina":_controllerkrvnaskupina.text,
                              });*/
                              //_controllerkrvnaskupina.clear();
                              //FirebaseMessaging messaging = FirebaseMessaging.instance;

                              for(var i=0;i<UserDarcaList.length;i++){
                                if(UserDarcaList[i]['krvnaskupina']==_controllerkrvnaskupina.text){
                                  String meno=UserDarcaList[i]['meno']+" "+UserDarcaList[i]['priezvisko'];
                                  sendEmail(name: meno, email: UserDarcaList[i]['email'], message: UserDarcaList[i]['krvnaskupina']);
                                }
                              }
                              for(var i=0;i<UserNotifikaciaList.length;i++){
                                if(UserNotifikaciaList[i]['skupina']==_controllerkrvnaskupina.text) {
                                  pushNotificationsSpecificDevice(
                                      token: UserNotifikaciaList[i]['token'],
                                      title: "Potrebná krv",
                                      body: "Evidujeme nedostatok krvi, ak môžete prihláste sa na odber.Ďakujeme!",
                                      url: "https://cdn-icons-png.flaticon.com/512/205/205916.png",
                                  );
                                }
                              }
                              _onButtonPressed();
                              Utils.showSnackBar("Notifikácia odoslaná");
                            }
                          },
                          child: const Text(
                            "Notifikovať darcov",
                            style: TextStyle(color: Colors.white,fontSize: 25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 130,
                      ),

                    ],
                  ),
                ),
              ),
            ),



          ),




        )
    );
  }
  
  Future<bool> pushNotificationsSpecificDevice({
    required String token,
    required String title,
    required String body,
    required String url,
  }) async{
    String dataNotifications='{ "to" : "$token",'
        '"notification" : {'
        ' "title":"$title",'
        '"body":"$body"'
        '"image":"$url"'
        '}'
        '}';
    await http.post(Uri.parse(Constants.BASE_URL),
      headers: <String,String>{
        'Content-Type':'application/json',
        'Authorization':'key=${Constants.KEY_SERVER}',
      },
      body: dataNotifications,
    );
    return true;
  }

}