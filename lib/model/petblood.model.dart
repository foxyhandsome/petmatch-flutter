class Petblood {
  int? idBlood;
  String? typeBlood;

  Petblood({this.idBlood, this.typeBlood});

  Petblood.fromJson(Map<String, dynamic> json) {
    idBlood = json['id_blood'];
    typeBlood = json['type_blood'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_blood'] = this.idBlood;
    data['type_blood'] = this.typeBlood;
    return data;
  }
}
