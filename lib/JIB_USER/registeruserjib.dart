import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/menu.dart';
import 'dart:io';
import 'package:petmatch/authenticationsScreen/editdog.dart';
import 'package:petmatch/model/district.model.dart';
import 'package:petmatch/model/district_sub.model.dart';

import '../constant/domain.dart';

class Registeruserjib extends StatefulWidget {
  @override
  State<Registeruserjib> createState() => _RegisteruserjibState();
}

class _RegisteruserjibState extends State<Registeruserjib> {
  final dio = Dio();

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

  Future<void> register(BuildContext context) async {
    try {
      final response = await dio.post(url_api + '/user/create-user', data: {
        "username": username.text,
        "password": password.text,
        "contact": contact.text,
        "information": information.text,
        "id_district": id_district,
        "id_subdistrict": id_subdistrict,
        "id_typeuser": 1
      });
      if (response.statusCode == 200) {
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
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

  File? _image;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController information = TextEditingController();
  int? id_district;
  int? id_subdistrict;

  List<bool> isSelected = [false, false]; // 0 = เพศผู้, 1 = เพศเมีย

  Future getImageDog() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImagePetCert() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
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
          "สมัครสมาชิก",
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
                  controller: username,
                  decoration: InputDecoration(
                    labelText: 'ชื่อผู้ใช้งาน',
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
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'ใส่ชื่อผู้ใช้งาน',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300, // ปรับความกว้างตามที่ต้องการ
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
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
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'ใส่รหัสผ่าน',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300, // ปรับความกว้างตามที่ต้องการ
                child: TextField(
                  controller: contact,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'เบอร์โทรศัพท์',
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
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'ใส่เบอร์โทรศัพท์',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300, // ปรับความกว้างตามที่ต้องการ
                child: TextField(
                  controller: information,
                  decoration: InputDecoration(
                    labelText: 'แนะนำเพิ่มเติม',
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
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: '',
                    prefixIcon: Icon(Icons.chat),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "เขต",
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
                  "แขวง",
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              Loginjib()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                },
                child: Text(
                  'หากมีบัญชีผู้ใช้แล้ว กดเพื่อเข้าสู่ระบบ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(
                        255, 239, 83, 80), // สีเส้นขอบเมื่อได้รับการกด
                  ),
                ),
              ),
              Container(
                width: 300, // ปรับความกว้างตามที่ต้องการ
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 239, 83, 80),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      register(context).then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Menu()))));
                    },
                    child: Text('สมัครสมาชิก')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
