import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/menu.dart';
import 'dart:io';
import 'package:petmatch/authenticationsScreen/editdog.dart';

List<String> list1 = <String>['แขวง 1', 'แขวง 2']; //แขวง
List<String> list2 = <String>['เขต 1', 'เขต 2', 'เขต 3']; //เขต
List<String> list3 = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
]; //อายุ
List<String> list4 = <String>[
  'พันธุ์ 1',
  'พันธุ์ 2',
  'พันธุ์ 3',
  'พันธุ์ 4',
  'พันธุ์ 5',
]; //พันธุ์
List<String> list5 = <String>['สี 1', 'สี 2', 'สี 3', 'สี 4', 'สี 5']; //สีขน
List<String> list6 = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G']; //กรุ๊ปเลือด

class editprofileuser extends StatefulWidget {
  @override
  _editprofileuserState createState() => _editprofileuserState();
}

class _editprofileuserState extends State<editprofileuser> {
  final dio = Dio();
  login() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {}
  }

  File? _image;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String dropdownValue1 = list1.first; //แขวง
  String dropdownValue2 = list2.first; //เขต
  String dropdownValue3 = list3.first; //อายุ
  String dropdownValue4 = list4.first; //พันธุ์
  String dropdownValue5 = list5.first; //สีขน
  String dropdownValue6 = list6.first; //กรุ๊ปเลือด

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
                  controller: usernameController,
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
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'ใส่ชื่อผู้ใช้งาน',
                    prefixIcon: Icon(Icons.chat),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "แก้ไขแขวง",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              DropdownMenu<String>(
                initialSelection: list1.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue1 = value!;
                  });
                },
                dropdownMenuEntries:
                    list1.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
                width: 300,
              ),
              SizedBox(height: 10.0),
              Text(
                "แก้ไขเขต",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              DropdownMenu<String>(
                initialSelection: list2.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue2 = value!;
                  });
                },
                dropdownMenuEntries:
                    list2.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
                width: 300,
              ),
              SizedBox(height: 30.0),
                Container(
                  width: 250, // กำหนดความกว้างของปุ่ม
                  height: 50, // กำหนดความสูงของปุ่ม
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Menu())));
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
                            fontWeight: FontWeight.bold
                          ),
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
