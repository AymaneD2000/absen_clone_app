class SendingBox {
  //mdc(Max Data Cascading) npd(Nombre de ports de données) dbmp(Débit binaire maximal par port)
  //cv (Compression vidéo) tc( Tension d'alimentation ) cm(Courant maximal)
  String boxName;
  int npd;
  int dbmp;
  int cv;
  double tc;
  double cm;
  SendingBox(
      {required this.dbmp,
      required this.boxName,
      required this.tc,
      required this.cm,
      required this.cv,
      required this.npd});
}
