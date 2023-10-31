import "dart:io";

import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";

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

class Editprofiledog extends StatefulWidget {
  const Editprofiledog({super.key});

  @override
  State<Editprofiledog> createState() => _EditprofiledogState();
}

class _EditprofiledogState extends State<Editprofiledog> {
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
///////////////////////////สัตว์เลี้ยง//////////////////////////////////////////////////////////////////////////////////////


              SizedBox(height: 10.0),
              GestureDetector(
                onTap: getImageDog,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // กำหนดให้เป็นรูปวงกลม
                    border: Border.all(
                      color: Color.fromARGB(255, 239, 83, 80), // สีขอบ
                      width: 5.0, // ความหนาของ border
                    ),
                  ),
                  child: ClipOval(
                    child: _image == null
                        ? CircleAvatar(
                            radius: 120,
                            backgroundColor: Color.fromRGBO(255, 255, 255, 0.69), // สีพื้นหลังของ CircleAvatar
                            child: Icon(Icons.pets, size: 100, color: Colors.black),
                          )
                        : CircleAvatar(
                            radius: 120,
                            backgroundImage: FileImage(_image!),
                          ),
                  ),
                ),
              ),

              SizedBox(height: 20.0),
              ToggleButtons(
                children: <Widget>[
                  Column(
                    children: [
                      Icon(
                        Icons.male,
                        size: 35.0,
                      ),
                      Text('เพศผู้'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.female,
                        size: 35.0,
                      ),
                      Text('เพศเมีย'),
                    ],
                  ),
                ],
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                constraints: BoxConstraints.tightFor(
                  width: 60.0, // ปรับความกว้างตามต้องการ
                  height: 60.0,
                ),
              ),

              SizedBox(height: 10.0),
              Text(
                "แก้ไขพันธุ์",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              DropdownMenu<String>(
                initialSelection: list4.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue4 = value!;
                  });
                },
                dropdownMenuEntries:
                    list4.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),

              SizedBox(height: 10.0),
              Text(
                "แก้ไขสีขน",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              DropdownMenu<String>(
                initialSelection: list5.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue5 = value!;
                  });
                },
                dropdownMenuEntries:
                    list5.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),

              SizedBox(height: 10.0),
              Text(
                "แก้ไขกรุ๊ปเลือด",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              DropdownMenu<String>(
                initialSelection: list6.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue6 = value!;
                  });
                },
                dropdownMenuEntries:
                    list6.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),

              SizedBox(height: 30.0),
              Text(
                "แก้ไขใบพันธุ์ประวัติสัตว์เลี้ยง",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10.0),
              GestureDetector(
                onTap: getImageDog,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 239, 83, 80),
                      width: 5.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: _image == null
                        ? Container(
                            width: 300,
                            height: 300,
                            color: Color.fromARGB(255, 255, 255, 255),
                            child: Icon(Icons.local_hospital, size: 100),
                          )
                        : Container(
                            width: 400,
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(_image!),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
                Container(
                  width: 250, // กำหนดความกว้างของปุ่ม
                  height: 50, // กำหนดความสูงของปุ่ม
                  child: ElevatedButton(
                    onPressed: () {
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
