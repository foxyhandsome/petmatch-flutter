import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:petmatch/JIB_USER/editprofileuser.dart';
import 'package:petmatch/JIB_USER/review_pet_me.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/profileother.dart';
import 'package:petmatch/JIB_USER/reviewother.dart';
import 'package:petmatch/constant/domain.dart';
import 'package:petmatch/model/pet.model.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
      final response = await dio.post(url_api + '/match/get-pet-like', data: {
        "id_userhome": int.parse(idUser!),
      });
      if (response.statusCode == 201) {
        final responseData = response.data;
        for (var element in responseData) {
          pets.add(Pet(
              provinceName: element["province_name"],
              nameDistrict: element["name_district"],
              nameSubdistrict: element["name_subdistrict"],
              username: element["username"],
              typeSkin: element["type_skin"],
              typeBlood: element["type_blood"],
              password: element["password"],
              nameBreed: element["name_breed"],
              information: element["information"],
              idTypeuser: element["id_typeuser"],
              idSubdistrict: element["id_subdistrict"],
              idDistrict: element["id_district"],
              contact: element["contact"],
              agePet: element["age_pet"],
              healthPet: element["health_pet"],
              idBlood: element["id_blood"],
              idBreed: element["id_breed"],
              idPet: element["id_pet"],
              idSkin: element["id_skin"],
              idUser: element["id_user"],
              namePet: element["name_pet"],
              picturePet: element["picture_pet"],
              create_date: element["create_date"],
              update_date: element["update_date"],
              sexPet: element["sex_pet"]));
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

  String convertDateTime(String dateTimeString) {
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
            "ประวัติสัตว์เลี้ยงที่ถูกใจ",
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
                                            "${convertDateTime(pets[index].create_date!)}",
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
                                                    ReviewPetMe(
                                                      pet: pets[index],
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
