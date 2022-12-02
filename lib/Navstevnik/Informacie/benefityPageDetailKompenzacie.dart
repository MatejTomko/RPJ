import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class benefityPageDetailKompenzacie extends StatelessWidget{

  benefityPageDetailKompenzacie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zákonom určené kompenzácie"),
        backgroundColor: Colors.red[900],
      ),

      body:
        Container(
          padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: const [
                  Text(
                    "Národná transfúzna služba SR poskytuje darcom krvi výhody, ktoré sú v súlade s legislatívou SR. Na Slovensku upravuje dobrovoľné darovanie krvi zákon č. 362/2011 Z.z. o liekoch a zdravotníckych pomôckach a o zmene a doplnení niektorých zákonov v znení neskorších predpisov, kde § 13 ods. 14 ustanovuje:"
                        "\nPoskytovateľ zdravotnej starostlivosti nemôže za odber krvi a zložiek z krvi priamo ani nepriamo sľúbiť, poskytnúť alebo nechať poskytnúť, a to ani prostredníctvom tretej osoby, žiadnu odmenu, náhradu ani protihodnotu v akejkoľvek forme ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "okrem poskytnutia jednorazového drobného občerstvenia a príspevku na občerstvenie najviac vo výške 75 % stravného poskytovaného podľa osobitného predpisu (zákon o cestovných náhradách) a preukázaných nákladov na cestovné.”",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:5),
                  Text(
                    "V zmysle § 138 ods. 2 Zákonníka práce je darovanie krvi a aferézy prekážkou na strane zamestnanca z dôvodu všeobecného záujmu, pri ktorej patrí zamestnancovi náhrada mzdy v sume jeho priemerného zárobku.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Pracovné voľno patrí na nevyhnutne potrebný čas a to za čas cesty na odber a späť a za čas na zotavenie po odbere, pokiaľ tieto skutočnosti zasahujú do pracovného času zamestnanca.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Podľa charakteru odberu a zdravotného stavu darcu môže lekár určiť, že čas potrebný na jeho zotavenie sa predlžuje, najviac po dobu zasahujúcu do pracovného času v rámci 96 hodín od nástupu cesty na odber. Ak nedôjde k odberu, poskytne sa pracovné voľno s náhradou mzdy v sume jeho priemerného zárobku len za preukázaný nevyhnutne potrebný čas neprítomnosti v práci.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
