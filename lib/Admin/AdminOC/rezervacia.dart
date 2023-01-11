import 'package:cloud_firestore/cloud_firestore.dart';

class rezervacia{
  String idDarca,oc;
  String meno;
  String datum;
  String typ;
  String vybavene;
  String cas;

  rezervacia(
      this.idDarca,
      this.oc,
      this.datum,
      this.meno,
      this.typ,
      this.vybavene,
      this.cas,
      );


}