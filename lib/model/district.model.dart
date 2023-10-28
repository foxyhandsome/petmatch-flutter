class Districtmodel {
  int? idDistrict;
  String? nameDistrict;
  String? provinceName;

  Districtmodel({this.idDistrict, this.nameDistrict, this.provinceName});

  Districtmodel.fromJson(Map<String, dynamic> json) {
    idDistrict = json['id_district'];
    nameDistrict = json['name_district'];
    provinceName = json['province_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_district'] = this.idDistrict;
    data['name_district'] = this.nameDistrict;
    data['province_name'] = this.provinceName;
    return data;
  }
}