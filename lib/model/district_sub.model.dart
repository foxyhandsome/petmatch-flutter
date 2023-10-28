class DistrictSubModel {
  int? idSubdistrict;
  String? nameSubdistrict;
  int? idDistrict;
  String? nameDistrict;
  String? provinceName;

  DistrictSubModel(
      {this.idSubdistrict,
      this.nameSubdistrict,
      this.idDistrict,
      this.nameDistrict,
      this.provinceName});

  DistrictSubModel.fromJson(Map<String, dynamic> json) {
    idSubdistrict = json['id_subdistrict'];
    nameSubdistrict = json['name_subdistrict'];
    idDistrict = json['id_district'];
    nameDistrict = json['name_district'];
    provinceName = json['province_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_subdistrict'] = this.idSubdistrict;
    data['name_subdistrict'] = this.nameSubdistrict;
    data['id_district'] = this.idDistrict;
    data['name_district'] = this.nameDistrict;
    data['province_name'] = this.provinceName;
    return data;
  }
}
