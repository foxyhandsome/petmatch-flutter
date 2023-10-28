class Pet {
  int? idPet;
  String? picturePet;
  String? sexPet;
  String? healthPet;
  String? namePet;
  int? agePet;
  int? idSkin;
  int? idBlood;
  int? idUser;
  int? idBreed;

  Pet(
      {this.idPet,
      this.picturePet,
      this.sexPet,
      this.healthPet,
      this.namePet,
      this.agePet,
      this.idSkin,
      this.idBlood,
      this.idUser,
      this.idBreed});

  Pet.fromJson(Map<String, dynamic> json) {
    idPet = json['id_pet'];
    picturePet = json['picture_pet'];
    sexPet = json['sex_pet'];
    healthPet = json['health_pet'];
    namePet = json['name_pet'];
    agePet = json['age_pet'];
    idSkin = json['id_skin'];
    idBlood = json['id_blood'];
    idUser = json['id_user'];
    idBreed = json['id_breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pet'] = this.idPet;
    data['picture_pet'] = this.picturePet;
    data['sex_pet'] = this.sexPet;
    data['health_pet'] = this.healthPet;
    data['name_pet'] = this.namePet;
    data['age_pet'] = this.agePet;
    data['id_skin'] = this.idSkin;
    data['id_blood'] = this.idBlood;
    data['id_user'] = this.idUser;
    data['id_breed'] = this.idBreed;
    return data;
  }
}
