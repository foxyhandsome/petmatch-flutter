import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petmatch/JIB_USER/Filter.dart';
import 'package:petmatch/JIB_USER/pet_match.dart';
import 'package:petmatch/constant/domain.dart';

import '../model/pet.model.dart';

class SelectPet extends StatefulWidget {
  const SelectPet({super.key});

  @override
  State<SelectPet> createState() => _SelectPetState();
}

class _SelectPetState extends State<SelectPet> {
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
          await dio.get(url_api + '/pet/get-pet-by-userid/' + idUser!);
      if (response.statusCode == 200) {
        final responseData = response.data;
        for (var element in responseData) {
          pets.add(Pet(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        elevation: 0,
        title: Text(
          "เลือกสัตว์เลี้ยงเพื่อจับคู่",
          style: TextStyle(color: Colors.black),
        ),
        actions: [],
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return Container(
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity, // ปรับความกว้างตามที่ต้องการ
              child: ListTile(
                contentPadding:
                    EdgeInsets.all(10), // ปรับระยะห่างของเนื้อหาภายใน ListTile
                tileColor: Colors.white, // สีพื้นหลังของ ListTile
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(255, 239, 83, 80),
                      width: 1), // กำหนดสีและความกว้างของเส้นกรอบ
                  borderRadius:
                      BorderRadius.circular(10), // กำหนดรูปร่างของกรอบ
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: "${pets[index].picturePet}" != null
                      ? MemoryImage(base64Decode("${pets[index].picturePet}"))
                      : null,
                ),

                title: Text(
                  "${pets[index].namePet}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        // selectedGender
                        // Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: ((context) =>
                        //                 PetMatch(pet: pets[index]))))
                        //     .then((value) => {getData()});
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Filter())));
                      },
                      icon: Icon(
                        Icons.pets,
                        color: Colors.white, // สีไอคอน
                      ),
                      label: Text(
                        'เลือก',
                        style: TextStyle(color: Colors.white), // สีของข้อความ
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(
                            255, 239, 83, 80), // สีพื้นหลังของปุ่ม
                        minimumSize: Size(100, 35), // ปรับขนาดปุ่มตามที่ต้องการ
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
