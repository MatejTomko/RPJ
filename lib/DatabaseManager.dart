
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseManager{

  final CollectionReference darcaList = FirebaseFirestore.instance.collection('Darca');
  final CollectionReference odberList = FirebaseFirestore.instance.collection('Odber');
  final CollectionReference liekyList = FirebaseFirestore.instance.collection('Lieky');
  final CollectionReference kamenneOCList = FirebaseFirestore.instance.collection('KamenneOC');
  final CollectionReference mobilneOCList = FirebaseFirestore.instance.collection('MobilneOC');
  final CollectionReference otazkyList = FirebaseFirestore.instance.collection('Otazky');
  final CollectionReference napisteNamList = FirebaseFirestore.instance.collection('NapisteNam');
  final CollectionReference rezervaciaList = FirebaseFirestore.instance.collection('Rezervacia');




  Future<void> createDarcaData(
      String adresa,idDarca,krvnaskupina,meno,priezvisko,rodnecislo,email) async {
    return await darcaList.doc().set({
      'adresa':adresa,
      'idDarca':idDarca,
      'krvnaskupina':krvnaskupina,
      'meno':meno,
      'priezvisko':priezvisko,
      'rodnecislo':rodnecislo,
      'email':email,
    });
  }

  Future getDarcaList() async{
    List itemsList=[];

    try{
      await darcaList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future getDarcaList2() async{
    List itemsList=[];
    List itemsListId=[];
    List returnovat=[];

    try{
      await darcaList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
        itemsListId.add(element.id);
      })
      );
      returnovat.add(itemsList);
      returnovat.add(itemsListId);
      return returnovat;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> createOdberData(
      String idDarca,mnozstvo,trvanie,datum,typ,autoodber,komplikacia,koniec,tlakkrvi,vyjazd,zaciatok) async {
    return await odberList.doc().set({
      'datum':datum,
      'idDarca':idDarca,
      'mnozstvo':mnozstvo,
      'typ':typ,
      'autoodber':autoodber,
      'komplikacia':komplikacia,
      'koniec':koniec,
      'tlakkrvi':tlakkrvi,
      'vyjazd':vyjazd,
      'zaciatok':zaciatok,
      'trvanie':trvanie,
    });
  }

  Future getOdberList() async{
    List itemsList=[];

    try{
      await odberList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> createLiekyData(
      String kedynajskor,liek,mozemdarovat,poznamka) async {
    return await liekyList.doc().set({
      'kedy najskôr':kedynajskor,
      'liek':liek,
      'môžem darovať':mozemdarovat,
      'poznámka':poznamka,
    });
  }

  Future getLiekyList() async{
    List itemsList=[];

    try{
      await liekyList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> createKamenneOCData(
      String adresa,email,hodinypi,hodinypo,hodinysr,hodinyut,hodinyst,informacie,mapy,meno,objednavacie) async {
    return await kamenneOCList.doc().set({
      'adresa':adresa,
      'email':email,
      'hodinypi':hodinypi,
      'hodinypo':hodinypo,
      'hodinysr':hodinysr,
      'hodinyut':hodinyut,
      'hodinyst':hodinyst,
      'informacie':informacie,
      'mapy':mapy,
      'meno':meno,
      'objednavacie':objednavacie,
    });
  }

  Future getKamenneOCList() async{
    List itemsList=[];

    try{
      await kamenneOCList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> createMobilneOCData(
      String cas,datum,mapy,miesto,oc) async {
    return await mobilneOCList.doc().set({
      'cas':cas,
      'datum':datum,
      'mapy':mapy,
      'miesto':miesto,
      'oc':oc,
    });
  }

  Future getMobilneOCList() async{
    List itemsList=[];
    List idecka=[];
    List returnovat=[];

    try{
      await mobilneOCList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
        idecka.add(element.id);
      })
      );
      returnovat.add(itemsList);
      returnovat.add(idecka);
      return returnovat;
    }catch(e){
      print(e.toString());
      return null;
    }
  }



  Future getOdberList2() async{
    List itemsList=[];
    List id=[];
    List returnovat=[];
    try{
      await odberList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
        id.add([element.id]);
      })
      );
      returnovat.add(itemsList);
      returnovat.add(id);
      return returnovat;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> createOtazkyData(
      String otazka,odpoved) async {
    return await otazkyList.doc().set({
      'otazka':otazka,
      'odpoved':odpoved,
    });
  }

  Future getOtazkyist() async{
    List itemsList=[];

    try{
      await otazkyList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future getOtazkyListId() async{
    List itemsList=[];

    try{
      await otazkyList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.id);
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> createNapisteNamData(
      String email,menopriezvisko,oblast,sprava) async {
    return await napisteNamList.doc().set({
      'email':email,
      'menopriezvisko':menopriezvisko,
      'oblast':oblast,
      'sprava':sprava,

    });
  }

  Future getNapisteNamList() async{
    List itemsList=[];

    try{
      await napisteNamList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  Future<void> createRezervaciaData(
      String datum,idDarca,oc,typ,vybavene,cas) async {
    return await napisteNamList.doc().set({
      'datum':datum,
      'idDarca':idDarca,
      'oc':oc,
      'typ':typ,
      'vybavene':vybavene,
      'cas':cas,
    });
  }

  Future getRezervaciaList() async{
    List itemsList=[];

    try{
      await rezervaciaList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future getRezervaciaList2() async{
    List itemsList=[];
    List id=[];
    List returnovat=[];

    try{
      await rezervaciaList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
        id.add(element.id);
      })
      );
      returnovat.add(itemsList);
      returnovat.add(id);
      return returnovat;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}