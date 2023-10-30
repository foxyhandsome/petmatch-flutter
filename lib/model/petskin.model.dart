class Petskin {
  int? idSkin;
  String? typeSkin;

  Petskin({this.idSkin, this.typeSkin});

  Petskin.fromJson(Map<String, dynamic> json) {
    idSkin = json['id_skin'];
    typeSkin = json['type_skin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_skin'] = this.idSkin;
    data['type_skin'] = this.typeSkin;
    return data;
  }
}
