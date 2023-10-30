import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petmatch/JIB_USER/addpet.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/profileuser2.dart';

import '../constant/domain.dart';
import '../model/pet.model.dart';

class Allpet extends StatefulWidget {
  const Allpet({super.key});

  @override
  State<Allpet> createState() => _AllpetState();
}

class _AllpetState extends State<Allpet> {
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
          "สัตว์เลี้ยงทั้งหมด",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => addpet())));
            },
          ),
        ],
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Profileuser(pet:pets[index]))));
                      },
                      icon: Icon(
                        Icons.pets,
                        color: Colors.white, // สีไอคอน
                      ),
                      label: Text(
                        'เข้าสู่โปรไฟล์',
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
