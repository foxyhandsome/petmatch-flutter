class RequestMatch {
  String age;
  int? petbreedSelect;
  int? petskinSelect;
  int? petbloodsSelect;
  int? id_district;
  String? sexPet;

  RequestMatch({
    required this.age,
    this.petbreedSelect,
    this.petskinSelect,
    this.petbloodsSelect,
    this.id_district,
    this.sexPet,
  });

  factory RequestMatch.fromJson(Map<String, dynamic> json) {
    return RequestMatch(
      age: json['age'],
      petbreedSelect: json['petbreedSelect'],
      petskinSelect: json['petskinSelect'],
      petbloodsSelect: json['petbloodsSelect'],
      id_district: json['id_district'],
      sexPet: json['sex_pet'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "age": age,
      "petbreedSelect": petbreedSelect,
      "petskinSelect": petskinSelect,
      "petbloodsSelect": petbloodsSelect,
      "id_district": id_district,
      "sex_pet": sexPet,
    };
  }
}
