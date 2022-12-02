import 'package:blood_app/Navstevnik/Odberove%20centra/kamennaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOC.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/mobilnaOCCard.dart';
import 'package:blood_app/Navstevnik/Odberove%20centra/vyjazdoveOC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class benefityPageDetailVyhody extends StatelessWidget{

  benefityPageDetailVyhody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zákonom určené výhody"),
        backgroundColor: Colors.red[900],
      ),

      body:
      Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    "Podľa § 2 ods. 1 písm. k) zákona č. 577/2004 Z.z. o rozsahu zdravotnej starostlivosti uhrádzanej na základe verejného zdravotného poistenia a o úhradách za služby súvisiace s poskytovaním zdravotnej starostlivosti v znení neskorších predpisov je na základe verejného zdravotného poistenia plne uhrádzaná jedna preventívna prehliadka poistenca raz za rok evidovaným darcom krvi, darcom orgánov alebo tkanív,  u lekára so špecializáciou v špecializačnom odbore všeobecné lekárstvo alebo u lekára so špecializáciou v špecializačnom odbore všeobecná starostlivosť o deti a dorast (v porovnaní s jednou prehliadkou raz za dva roky v prípade poistencov, ktorí nie sú darcami).",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Podľa § 38 ods. 8 písm. a) zákona č. 577/2004 Z.z. o rozsahu zdravotnej starostlivosti uhrádzanej na základe verejného zdravotného poistenia a o úhradách za služby súvisiace s poskytovaním zdravotnej starostlivosti v znení neskorších predpisov nositeľ najmenej striebornej Janského plakety je oslobodený od povinnosti úhrady za stravovanie a pobyt na lôžku pri poskytovaní ústavnej starostlivosti a ústavnej starostlivosti v liečebni, v prírodných liečebných kúpeľoch a kúpeľných liečebniach (platí pri zdravotnej starostlivosti plne uhrádzanej alebo čiastočne uhrádzanej na základe verejného zdravotného poistenia).",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Podľa § 9 ods. 1 a 2 vyhlášky Ministerstva zdravotníctva SR č. 412/2009 Z.z., ktorou sa ustanovujú podrobnosti o zozname poistencov čakajúcich na poskytnutie plánovanej zdravotnej starostlivosti zdravotná poisťovňa v zozname poistencov čakajúcich na poskytnutie plánovanej zdravotnej starostlivosti:",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "1)môže uprednostniť bezpríspevkových darcov krvi nositeľov bronzovej plakety alebo striebornej plakety prof. MUDr.  Jána Janského.",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "2)uprednostní bezpríspevkových darcov krvi nositeľov zlatej plakety alebo diamantovej plakety prof. MUDr. Jána Janského a darcov krvi ocenených medailou MUDr. Jána Kňazovického.",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
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
