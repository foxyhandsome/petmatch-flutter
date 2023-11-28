import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:petmatch/JIB_USER/reviewother.dart';
import 'package:petmatch/JIB_USER/select_pet_review.dart';
import 'package:petmatch/model/pet.model.dart';

import '../authenticationsScreen/navigationbar/profileother.dart';
import '../constant/domain.dart';

class HistoryReal extends StatefulWidget {
  const HistoryReal({super.key});

  @override
  State<HistoryReal> createState() => _HistoryRealState();
}

class _HistoryRealState extends State<HistoryReal> {
  final dio = Dio();
  String? idUser;
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();

  @override
  void initState() {
    getData();
    super.initState();
  }

  List<Pet> pets = [];
  Future<void> getData() async {
    try {
      pets = [];
      idUser = await storageToken.read(key: 'id_user');
      final response =
          await dio.post(url_api + '/match/pet-match-history', data: {
        "id_userhome": int.parse(idUser!),
      });
      if (response.statusCode == 201) {
        final responseData = response.data;
        for (var element in responseData) {
          pets.add(Pet(
              provinceName: element["province_name_guest"],
              nameDistrict: element["name_district_guest"],
              nameSubdistrict: element["name_subdistrict_guest"],
              username: element["username_guest"],
              typeSkin: element["type_skin_guest"],
              typeBlood: element["type_blood_guest"],
              password: element["password_guest"],
              nameBreed: element["name_breed_guest"],
              information: element["information_guest"],
              idTypeuser: element["id_typeuser_guest"],
              idSubdistrict: element["id_subdistrict_guest"],
              idDistrict: element["id_district_guest"],
              contact: element["contact_guest"],
              agePet: element["age_pet_guest"],
              healthPet: element["health_pet_guest"],
              idBlood: element["id_blood_guest"],
              idBreed: element["id_breed_guest"],
              idPet: element["id_pet_guest"],
              idSkin: element["id_skin_guest"],
              idUser: element["id_user_guest"],
              namePet: element["name_pet_guest"],
              picturePet: element["picture_pet_guest"],
              create_date: element["create_date"],
              update_date: element["update_date"],
              sexPet: element["sex_pet_guest"]));
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  String convertDateTime(String? dateTimeString) {
    if (dateTimeString == null) {
      DateTime dateTime = DateTime.now();
      var formattedDateTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
      return formattedDateTime;
    }
    DateTime dateTime = DateTime.parse(dateTimeString);
    var formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    return formattedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 239, 83, 80),
          elevation: 0,
          title: Text(
            "ประวัติที่จับคู่",
            style: TextStyle(color: Colors.black),
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
            child: pets.length > 0
                ? Column(
                    children: List.generate(
                      pets.length, // Assuming you have only one item in the list, adjust accordingly
                      (index) => SizedBox(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.all(
                                    10), // ปรับระยะห่างของเนื้อหาภายใน ListTile
                                tileColor:
                                    Colors.white, // สีพื้นหลังของ ListTile
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 239, 83, 80),
                                      width:
                                          1), // กำหนดสีและความกว้างของเส้นกรอบ
                                  borderRadius: BorderRadius.circular(
                                      10), // กำหนดรูปร่างของกรอบ
                                ),
                                leading: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => profileother()),
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: MemoryImage(base64Decode(
                                        "${pets[index].picturePet}")),
                                  ),
                                ),
                                title: Row(
                                  children: <Widget>[
                                    Text(
                                      "${pets[index].namePet}",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.location_on,
                                            color:
                                                Colors.grey), // ไอคอนของที่อยู่
                                        SizedBox(
                                            width:
                                                4), // ระยะห่างระหว่างไอคอนกับข้อความ
                                        Container(
                                          width: 100,
                                          child: Text(
                                            "${pets[index].nameSubdistrict},${pets[index].nameDistrict}",
                                            style: TextStyle(
                                                overflow: TextOverflow.clip),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_month,
                                            color:
                                                Colors.grey), // ไอคอนของที่อยู่
                                        SizedBox(
                                            width:
                                                4), // ระยะห่างระหว่างไอคอนกับข้อความ
                                        Container(
                                          width: 100,
                                          child: Text(
                                            "ตอบกลับวันที่ ${convertDateTime(pets[index].update_date != null ? pets[index].update_date : null)}",
                                            style: TextStyle(
                                                overflow: TextOverflow.clip),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.star),
                                      color: Colors.yellow, // ไอคอนของโปรไฟล์
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    SelectPetReview(
                                                      pet_guest: pets[index],
                                                    ))));
                                      },
                                    ),
                                    SizedBox(width: 8),
                                    IconButton(
                                      icon: Icon(Icons.pets),
                                      color: Color.fromARGB(
                                          255, 239, 83, 80), // ไอคอนของรีวิว
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    profileother(
                                                      pet: pets[index],
                                                    ))));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(child: Text("ไม่มี")),
                  )));
  }
}
