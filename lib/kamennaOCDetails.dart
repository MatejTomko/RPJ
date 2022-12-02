
import 'package:blood_app/kamennaOC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'kamennaOC.dart';

class kamennaOCDetails extends StatelessWidget{
  final kamennaOC _koc;

  kamennaOCDetails(this._koc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_koc.meno),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:SlidingUpPanel(
          minHeight: 150,
          renderPanelSheet: false,

          panel: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 253, 253, 253),
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          _koc.meno,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          _koc.adresa,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        const Text(
                          "Otváracie hodiny: ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height:5),
                        const Text(
                          "Kontakt: ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),
          ),
          collapsed: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 253, 253, 253),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
            ),
            margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _koc.meno,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      _koc.adresa,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: const Center(
            child: Text("Mapa"),
            //TODO tutak bude mapa
          ),
          /*Column(
            children: [
              Text(_moc.datum),


            ]*/

        ),
      ),
    );
  }
}
