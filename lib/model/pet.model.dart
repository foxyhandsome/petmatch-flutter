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
  String? typeSkin;
  String? typeBlood;
  String? username;
  String? password;
  String? information;
  String? contact;
  int? idDistrict;
  int? idSubdistrict;
  int? idTypeuser;
  String? nameBreed;

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
      this.idBreed,
      this.typeSkin,
      this.typeBlood,
      this.username,
      this.password,
      this.information,
      this.contact,
      this.idDistrict,
      this.idSubdistrict,
      this.idTypeuser,
      this.nameBreed});

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
    typeSkin = json['type_skin'];
    typeBlood = json['type_blood'];
    username = json['username'];
    password = json['password'];
    information = json['information'];
    contact = json['contact'];
    idDistrict = json['id_district'];
    idSubdistrict = json['id_subdistrict'];
    idTypeuser = json['id_typeuser'];
    nameBreed = json['name_breed'];
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
    data['type_skin'] = this.typeSkin;
    data['type_blood'] = this.typeBlood;
    data['username'] = this.username;
    data['password'] = this.password;
    data['information'] = this.information;
    data['contact'] = this.contact;
    data['id_district'] = this.idDistrict;
    data['id_subdistrict'] = this.idSubdistrict;
    data['id_typeuser'] = this.idTypeuser;
    data['name_breed'] = this.nameBreed;
    return data;
  }
}
