import 'package:cloud_firestore/cloud_firestore.dart';

class odber{
  String idDarca,mnozstvo,typ,autoodber,komplikacia,koniec,tlakkrvi,vyjazd,zaciatok,trvanie;
  DateTime datum;

  odber(
      this.idDarca,
      this.mnozstvo,
      this.datum,
      this.typ,
      this.autoodber,
      this.komplikacia,
      this.koniec,
      this.tlakkrvi,
      this.vyjazd,
      this.zaciatok,
      this.trvanie,);


}