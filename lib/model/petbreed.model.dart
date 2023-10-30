class Petbreed {
  int? idBreed;
  String? nameBreed;

  Petbreed({this.idBreed, this.nameBreed});

  Petbreed.fromJson(Map<String, dynamic> json) {
    idBreed = json['id_breed'];
    nameBreed = json['name_breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_breed'] = this.idBreed;
    data['name_breed'] = this.nameBreed;
    return data;
  }
}
