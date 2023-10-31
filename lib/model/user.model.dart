class User {
  int? idUser;
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

  User(
      {this.idUser,
      this.username,
      this.password,
      this.information,
      this.contact,
      this.idDistrict,
      this.idSubdistrict,
      this.idTypeuser,
      this.nameDistrict,
      this.provinceName,
      this.nameSubdistrict});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
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
    return data;
  }
}