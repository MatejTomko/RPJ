import 'package:blood_app/mobilnaOCDetails.dart';
import 'package:blood_app/mobilnaOC.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'kamennaOC.dart';

//toto je uz jednotliva mobilna oc
class mobilnaOCCard extends StatelessWidget {
  final mobilnaOC _mobilnaOC;

  mobilnaOCCard(this._mobilnaOC);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Column(
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            _mobilnaOC.miesto,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              _mobilnaOC.cas,
                              style: const TextStyle(
                                fontSize: 16,
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => mobilnaOCDetails(_mobilnaOC)));
                },
              ),
            ],
          )
      ),
    );
  }
}
