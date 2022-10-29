import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseManager{

  final CollectionReference darcaList = FirebaseFirestore.instance.collection('Darca');

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
}