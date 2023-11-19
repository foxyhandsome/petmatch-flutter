class Pet {
  String? namePet;
  int? agePet;
  int? idSkin;
  int? idBlood;
  int? idUser;
  int? idBreed;
  String? typeSkin;
  String? typeBlood;
  String? nameBreed;
  String? username;
  String? password;
  String? information;
  String? contact;
  int? idDistrict;
  int? idSubdistrict;
  int? idTypeuser;
  String? nameDistrict;
  String? provinceName;
  String? nameSubdistrict;
  String? picturePet;
  int? idMatch;
  int? idUserhome;
  int? idPethome;
  int? idUserguest;
  int? idPetguest;
  int? matchUserguest;
  int? matchUserguestDeny;
  int? matchUserhome;
  int? matchDislike;
  int? idPet;
  String? sexPet;
  String? healthPet;

  Pet(
      {this.namePet,
      this.agePet,
      this.idSkin,
      this.idBlood,
      this.idUser,
      this.idBreed,
      this.typeSkin,
      this.typeBlood,
      this.nameBreed,
      this.username,
      this.password,
      this.information,
      this.contact,
      this.idDistrict,
      this.idSubdistrict,
      this.idTypeuser,
      this.nameDistrict,
      this.provinceName,
      this.nameSubdistrict,
      this.picturePet,
      this.idMatch,
      this.idUserhome,
      this.idPethome,
      this.idUserguest,
      this.idPetguest,
      this.matchUserguest,
      this.matchUserguestDeny,
      this.matchUserhome,
      this.matchDislike,
      this.idPet,
      this.sexPet,
      this.healthPet});

  Pet.fromJson(Map<String, dynamic> json) {
    namePet = json['name_pet'];
    agePet = json['age_pet'];
    idSkin = json['id_skin'];
    idBlood = json['id_blood'];
    idUser = json['id_user'];
    idBreed = json['id_breed'];
    typeSkin = json['type_skin'];
    typeBlood = json['type_blood'];
    nameBreed = json['name_breed'];
    username = json['username'];
    password = json['password'];
    information = json['information'];
    contact = json['contact'];
    idDistrict = json['id_district'];
    idSubdistrict = json['id_subdistrict'];
    idTypeuser = json['id_typeuser'];
    nameDistrict = json['name_district'];
    provinceName = json['province_name'];
    nameSubdistrict = json['name_subdistrict'];
    picturePet = json['picture_pet'];
    idMatch = json['id_match'];
    idUserhome = json['id_userhome'];
    idPethome = json['id_pethome'];
    idUserguest = json['id_userguest'];
    idPetguest = json['id_petguest'];
    matchUserguest = json['match_userguest'];
    matchUserguestDeny = json['match_userguest_deny'];
    matchUserhome = json['match_userhome'];
    matchDislike = json['match_dislike'];
    idPet = json['id_pet'];
    sexPet = json['sex_pet'];
    healthPet = json['health_pet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_pet'] = this.namePet;
    data['age_pet'] = this.agePet;
    data['id_skin'] = this.idSkin;
    data['id_blood'] = this.idBlood;
    data['id_user'] = this.idUser;
    data['id_breed'] = this.idBreed;
    data['type_skin'] = this.typeSkin;
    data['type_blood'] = this.typeBlood;
    data['name_breed'] = this.nameBreed;
    data['username'] = this.username;
    data['password'] = this.password;
    data['information'] = this.information;
    data['contact'] = this.contact;
    data['id_district'] = this.idDistrict;
    data['id_subdistrict'] = this.idSubdistrict;
    data['id_typeuser'] = this.idTypeuser;
    data['name_district'] = this.nameDistrict;
    data['province_name'] = this.provinceName;
    data['name_subdistrict'] = this.nameSubdistrict;
    data['picture_pet'] = this.picturePet;
    data['id_match'] = this.idMatch;
    data['id_userhome'] = this.idUserhome;
    data['id_pethome'] = this.idPethome;
    data['id_userguest'] = this.idUserguest;
    data['id_petguest'] = this.idPetguest;
    data['match_userguest'] = this.matchUserguest;
    data['match_userguest_deny'] = this.matchUserguestDeny;
    data['match_userhome'] = this.matchUserhome;
    data['match_dislike'] = this.matchDislike;
    data['id_pet'] = this.idPet;
    data['sex_pet'] = this.sexPet;
    data['health_pet'] = this.healthPet;
    return data;
  }
}
