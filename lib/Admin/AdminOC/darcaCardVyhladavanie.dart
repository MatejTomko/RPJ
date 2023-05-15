import 'package:blood_app/Admin/AdminOC/vyhladavanieDarcaCardDetails.dart';
import 'package:blood_app/Admin/AdminOC/vyhladavanieOdberCardDetails.dart';
import 'package:blood_app/Darca/Odber/odber.dart';
import 'package:blood_app/Darca/Odber/odberCardDetails.dart';
import 'package:blood_app/Darca/Profil/preukazDarcu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Darca/Profil/darca.dart';

class darcaCardVyhladavanie extends StatelessWidget {
  final darca _darca;
  final String _darcaid;

  darcaCardVyhladavanie(this._darca,this._darcaid);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      ),
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.19,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  child: Container(
                    //padding: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${_darca.idDarca}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                padding: const EdgeInsets.only(left: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        //Padding(padding: EdgeInsets.only(right: 5), child: Image.asset("assets/blood-bank.png", width: 24)),
                        Text("${_darca.meno}", style: TextStyle(fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text("${_darca.priezvisko}", style: TextStyle(fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => vyhladavanieDarcaCardDetails(_darca,_darcaid)));
                    }, icon: Icon(Icons.edit)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
