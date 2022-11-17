import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseManager{

  final CollectionReference darcaList = FirebaseFirestore.instance.collection('Darca');
  final CollectionReference odberList = FirebaseFirestore.instance.collection('Odber');
  final CollectionReference liekyList = FirebaseFirestore.instance.collection('Lieky');
  final CollectionReference kamenneOCList = FirebaseFirestore.instance.collection('KamenneOC');
  final CollectionReference mobilneOCList = FirebaseFirestore.instance.collection('MobilneOC');

  Future<void> createDarcaData(
      String adresa,idDarca,krvnaskupina,meno,pocetodberov,poslednyodber,priezvisko,rodnecislo) async {
    return await darcaList.doc().set({
      'adresa':adresa,
      'idDarca':idDarca,
      'krvnaskupina':krvnaskupina,
      'meno':meno,
      'pocetodberov':pocetodberov,
      'poslednyodber':poslednyodber,
      'priezvisko':priezvisko,
      'rodnecislo':rodnecislo,
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

  Future<void> createOdberData(
      String idDarca,mnozstvo,datum) async {
    return await odberList.doc().set({
      'datum':datum,
      'idDarca':idDarca,
      'mnozstvo':mnozstvo,
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

    try{
      await mobilneOCList.get().then((snapshot) => snapshot.docs.forEach((element) {
        itemsList.add(element.data());
      })
      );
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}