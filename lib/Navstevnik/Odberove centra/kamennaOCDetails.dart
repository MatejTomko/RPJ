
import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'kamennaOC.dart';
import 'package:latlong2/latlong.dart';

class kamennaOCDetails extends StatelessWidget{
  final kamennaOC _koc;

  kamennaOCDetails(this._koc);
  double lat=0;
  double lng=0;

  @override
  Widget build(BuildContext context) {
    String latlng=_koc.mapy;
    lat=double.parse(latlng.split(" ")[0]);
    lng=double.parse(latlng.split(" ")[1]);
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
                        SizedBox(height:3),
                        Text(
                          "Pondelok: "+_koc.hodinypo,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height:3),
                        Text(
                          "Utorok: "+_koc.hodinyut,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height:3),
                        Text(
                          "Streda: "+_koc.hodinyst,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height:3),
                        Text(
                          "Štvrtok: "+_koc.hodinysr,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height:3),
                        Text(
                          "Piatok: "+_koc.hodinypi,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
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
                        Text(
                          "Email: "+_koc.email,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Informácie: "+_koc.informacie,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Objednávanie: "+_koc.objednavacie,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
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

          body:
            FlutterMap(
              options: MapOptions(
                center: LatLng(lat, lng),
                zoom: 15,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(point: LatLng(lat, lng), builder: (context) => FlutterLogo() )//TODO daco lepsie nech ukazuje
                  ],
                ),
              ],
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
