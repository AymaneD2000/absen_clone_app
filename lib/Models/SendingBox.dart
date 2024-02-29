class SendingBox {
  //mdc(Max Data Cascading) npd(Nombre de ports de données) dbmp(Débit binaire maximal par port)
  //fc (Compression vidéo)
  int mdc;
  int npd;
  int dbmp;
  int fc;
  SendingBox(
      {required this.dbmp,
      required this.fc,
      required this.mdc,
      required this.npd});
}
