import 'package:blood_app/Navstevnik/Lieky/lieky.dart';
import 'package:blood_app/Navstevnik/Otazky/otazky.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Darca/Odber/odber.dart';

class otazkyCard extends StatelessWidget {
  final otazky _otazky;

  otazkyCard(this._otazky);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.red[600],secondary: Colors.grey),
    primarySwatch: Colors.red,
    ),
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child:
                        ExpansionTile(
                          title: Text(_otazky.otazka,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          children: <Widget>[
                            Text(_otazky.odpoved,

                            ),
                          ],
                        )
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
      ),
      ),
    );
  }
}