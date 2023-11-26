import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/menu.dart';
import 'dart:io';
import 'package:petmatch/authenticationsScreen/editdog.dart';

import '../constant/domain.dart';
import '../model/district.model.dart';
import '../model/district_sub.model.dart';
import '../model/pet.model.dart';
import '../model/user.model.dart';

List<String> list1 = <String>['แขวง 1', 'แขวง 2']; //แขวง
List<String> list2 = <String>['เขต 1', 'เขต 2', 'เขต 3']; //เขต

class editprofileuser extends StatefulWidget {
  @override
  _editprofileuserState createState() => _editprofileuserState();
}

class _editprofileuserState extends State<editprofileuser> {
  final dio = Dio();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController subdistrictController = TextEditingController();
  int? id_district;
  int? id_subdistrict;
  String? idUser;
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();

  List<DropdownMenuEntry<Districtmodel>> dataList =
      <DropdownMenuEntry<Districtmodel>>[];
  Future<void> getData() async {
    try {
      dataList = [];
      final response = await dio.get(url_api + '/district/get-district');
      if (response.statusCode == 200) {
        final responseData = response.data;
        for (var element in responseData) {
          dataList.add(DropdownMenuEntry<Districtmodel>(
            value: Districtmodel.fromJson(element),
            label: element["name_district"],
          ));
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

  List<DropdownMenuEntry<DistrictSubModel>> dataSubList =
      <DropdownMenuEntry<DistrictSubModel>>[];
  Future<void> getDataSub(int id) async {
    try {
      final response = await dio.get(url_api +
          '/subdistrict/get-subdistrictbydistrictid/' +
          id.toString());
      if (response.statusCode == 200) {
        final responseData = response.data;
        // dataSubList = [];
        for (var element in responseData) {
          dataSubList.add(DropdownMenuEntry<DistrictSubModel>(
            value: DistrictSubModel.fromJson(element),
            label: element["name_subdistrict"],
          ));
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
      setState(() {});
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  List<User> users = [];
  Future<void> getDatauser() async {
    try {
      users = [];
      idUser = await storageToken.read(key: 'id_user');
      final response = await dio.get(url_api + '/user/get-user/' + idUser!);
      if (response.statusCode == 200) {
        final responseData = response.data;
        for (var element in responseData) {
          users.add(User(
            idUser: element["id_user"],
            username: element["username"],
            password: element["password"],
            information: element["information"],
            contact: element["contact"],
            idDistrict: element["idDistrict"],
            idSubdistrict: element["id_subdistrict"],
            idTypeuser: element["id_typeuser"],
            nameDistrict: element["name_district"],
            provinceName: element["province_name"],
            nameSubdistrict: element["name_subdistrict"],
          ));
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

  Future<void> edit(BuildContext context) async {
    try {
      // Ensure that you call getDatauser before using the users list
      await getDatauser();

      if (users.isNotEmpty) {
        final Map<String, dynamic> dataToUpdate = {};

        if (usernameController.text?.isNotEmpty ??
            false && usernameController.text != users[0]?.username) {
          dataToUpdate['username'] = usernameController.text;
        }

        if (passwordController.text?.isNotEmpty ??
            false && passwordController.text != users[0]?.password) {
          dataToUpdate['password'] = passwordController.text;
        }

        if (contactController.text?.isNotEmpty ??
            false && contactController.text != users[0]?.contact) {
          dataToUpdate['contact'] = contactController.text;
        }

        if (infoController.text?.isNotEmpty ??
            false && infoController.text != users[0]?.information) {
          dataToUpdate['information'] = infoController.text;
        }

        if (id_district != null &&
            id_district != 0 &&
            id_district != users[0]?.idDistrict) {
          dataToUpdate['id_district'] = id_district;
        }

        if (id_subdistrict != null &&
            id_subdistrict != 0 &&
            id_subdistrict != users[0]?.idSubdistrict) {
          dataToUpdate['id_subdistrict'] = id_subdistrict;
        }

        final response = await dio.post(
          url_api + '/user/edit-user/' + idUser!,
          data: dataToUpdate,
        );

        if (response.statusCode == 200) {
        } else {
          print('Request failed with status: ${response.statusCode}');
          // Handle failure
        }
      } else {
        print('Users list is empty.');
        // Handle empty users list case
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
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "แก้ไขข้อมูล",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color:
              Color.fromARGB(255, 255, 255, 255), // Set your desired color here
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "ข้อมูลเจ้าของสัตว์เลี้ยง",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 300, // ปรับความกว้างตามที่ต้องการ
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'แก้ไขชื่อผู้ใช้งาน',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white, // สีเส้นขอบ
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // สีเส้นขอบเมื่อไม่ได้รับการกด
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 239, 83, 80), // สีเส้นขอบเมื่อได้รับการกด
                      ),
                    ),
                    // Gradient ขอบของ TextField
                    contentPadding: EdgeInsets.all(10.0),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300, // ปรับความกว้างตามที่ต้องการ
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'แก้ไขรหัสผ่าน',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white, // สีเส้นขอบ
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // สีเส้นขอบเมื่อไม่ได้รับการกด
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 239, 83, 80), // สีเส้นขอบเมื่อได้รับการกด
                      ),
                    ),
                    // Gradient ขอบของ TextField
                    contentPadding: EdgeInsets.all(10.0),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300, // ปรับความกว้างตามที่ต้องการ
                child: TextField(
                  controller: contactController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'แก้ไขเบอร์โทรศัพท์',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white, // สีเส้นขอบ
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // สีเส้นขอบเมื่อไม่ได้รับการกด
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 239, 83, 80), // สีเส้นขอบเมื่อได้รับการกด
                      ),
                    ),
                    // Gradient ขอบของ TextField
                    contentPadding: EdgeInsets.all(10.0),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300, // ปรับความกว้างตามที่ต้องการ
                child: TextField(
                  controller: infoController,
                  decoration: InputDecoration(
                    labelText: 'แก้ไขแนะนำเพิ่มเติม',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white, // สีเส้นขอบ
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black, // สีเส้นขอบเมื่อไม่ได้รับการกด
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 239, 83, 80), // สีเส้นขอบเมื่อได้รับการกด
                      ),
                    ),
                    // Gradient ขอบของ TextField
                    contentPadding: EdgeInsets.all(10.0),
                    prefixIcon: Icon(Icons.chat),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "แก้ไขเขต",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              DropdownMenu<Districtmodel>(
                hintText: 'เลือกเขต',
                dropdownMenuEntries: dataList,
                onSelected: (Districtmodel? data) {
                  setState(() {
                    dataSubList = [];
                  });
                  id_district = data!.idDistrict!;
                  getDataSub(data.idDistrict!);
                },
                width: 300,
              ),
              SizedBox(height: 10.0),
              if (dataSubList.length > 0)
                Text(
                  "แก้ไขแขวง",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 5.0),
              if (dataSubList.length > 0)
                DropdownMenu<DistrictSubModel>(
                  hintText: 'เลือกแขวง',
                  dropdownMenuEntries: dataSubList,
                  onSelected: (DistrictSubModel? data) {
                    id_subdistrict = data!.idSubdistrict!;
                  },
                  width: 300,
                ),
              SizedBox(height: 15.0),
              Container(
                width: 250, // กำหนดความกว้างของปุ่ม
                height: 50, // กำหนดความสูงของปุ่ม
                child: ElevatedButton(
                  onPressed: () {
                    edit(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Menu()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 80, 239, 181),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // ปรับความโค้งมน
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.save,
                        size: 32.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'บันทึก',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
