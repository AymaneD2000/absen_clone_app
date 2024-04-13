class SendingBox {
  //mdc(Max Data Cascading) npd(Nombre de ports de données) dbmp(Débit binaire maximal par port)
  //cv (Compression vidéo) tc( Tension d'alimentation ) cm(Courant maximal)
  int? id;
  String boxName;
  int npd;
  int dbmp;
  int cv;
  double tc;
  double cm;
  SendingBox(
      {required this.dbmp,
      this.id,
      required this.boxName,
      required this.tc,
      required this.cm,
      required this.cv,
      required this.npd});
  Map<String, dynamic> toMap() {
    return {
      'boxName': boxName,
      'npd': npd,
      'dbmp': dbmp,
      'cv': cv,
      'tc': tc,
      'cm': cm,
    };
  }

  factory SendingBox.fromJson(Map<String, dynamic> map) {
    return SendingBox(
      id: map['id'],
      boxName: map['boxName'],
      npd: map['npd'],
      dbmp: map['dbmp'],
      cv: map['cv'],
      tc: map['tc'],
      cm: map['cm'],
    );
  }
}
