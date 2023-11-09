class PetMatchModel {
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
  int? idMatch;
  int? idUserhome;
  int? idPethome;
  int? idUserguest;
  int? idPetguest;
  bool? matchUserguest;
  bool? matchUserhome;
  bool? matchDislike;

  PetMatchModel(
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
      this.idMatch,
      this.idUserhome,
      this.idPethome,
      this.idUserguest,
      this.idPetguest,
      this.matchUserguest,
      this.matchUserhome,
      this.matchDislike});

  PetMatchModel.fromJson(Map<String, dynamic> json) {
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
    idMatch = json['id_match'];
    idUserhome = json['id_userhome'];
    idPethome = json['id_pethome'];
    idUserguest = json['id_userguest'];
    idPetguest = json['id_petguest'];
    matchUserguest = json['match_userguest'] ?? false;
    matchUserhome = json['match_userhome'] ?? false;
    matchDislike = json['match_dislike'] ?? false;
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
    data['id_match'] = this.idMatch;
    data['id_userhome'] = this.idUserhome;
    data['id_pethome'] = this.idPethome;
    data['id_userguest'] = this.idUserguest;
    data['id_petguest'] = this.idPetguest;
    data['match_userguest'] = this.matchUserguest;
    data['match_userhome'] = this.matchUserhome;
    data['match_dislike'] = this.matchDislike;
    return data;
  }
}
