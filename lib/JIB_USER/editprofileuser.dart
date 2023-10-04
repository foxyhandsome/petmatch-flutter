import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/profiledog.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:petmatch/JIB_USER/registerdogjib.dart';
import 'dart:io';

import 'package:petmatch/authenticationsScreen/editdog.dart';

class editprofileuser extends StatefulWidget {
  @override
  _editprofileuserState createState() => _editprofileuserState();
}

class _editprofileuserState extends State<editprofileuser> {
  final dio = Dio();
  login(){
    if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
      
    }
  }
  File? _image;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedDistrict = 'เขตพระนคร';


  Future getImage() async {
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "แก้ไขข้อมูลตนเอง",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),


    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color.fromARGB(255, 234, 64, 128), Color.fromARGB(255, 238, 128, 95)], // เลือกสีที่คุณต้องการ
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: getImage,
              child: ClipOval(
                child: _image == null
                    ? CircleAvatar(
                        radius: 100,
                        child: Icon(Icons.person, size: 100),
                      )
                    : CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(_image!),
                      ),
              ),
            ),

                SizedBox(height: 20.0),
                TextField(
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
                      color: Colors.white, // สีเส้นขอบเมื่อไม่ได้รับการกด
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 72, 201, 176), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่ชื่อผู้ใช้งาน',
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 20.0), 
              TextField(
                decoration: InputDecoration(
                  labelText: 'แก้ไขรหัสผ่าน',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0), // สีเส้นขอบ
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.white, // สีเส้นขอบเมื่อไม่ได้รับการกด
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 72, 201, 176), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่รหัสผ่าน',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

                SizedBox(height: 20.0),
                TextField(
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
                      color: Colors.white, // สีเส้นขอบเมื่อไม่ได้รับการกด
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 72, 201, 176), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่เบอร์โทรศัพท์',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),

                SizedBox(height: 20.0),
                TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'แก้ไขช่องทางติดต่อออนไลน์',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.white, // สีเส้นขอบ
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.white, // สีเส้นขอบเมื่อไม่ได้รับการกด
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 72, 201, 176), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่ช่องทางติดต่อออนไลน์',
                  prefixIcon: Icon(Icons.chat_bubble_outline),
                ),
              ),

           SizedBox(height: 20),
            // Dropdown เพศ
            Text(
              'แก้ไขเขต',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: selectedDistrict,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDistrict= newValue!;
                });
              },
              items: <String>['เขตพระนคร', 
                              'เขตดุสิต',
                              'เขตหนองจอก',
                              'เขตบางรัก',
                              'เขตบางเขน',
                              'เขตบางกะปิ',
                              'เขตปทุมวัน',
                              'เขตป้อมปราบศัตรูพ่าย',
                              'เขตพระโขนง',
                              'เขตมีนบุรี',
                              'เขตลาดกระบัง',
                              'เขตยานนาวา',
                              'เขตสัมพันธวงศ์',
                              'เขตพญาไท',
                              'เขตธนบุรี',
                              'เขตบางกอกใหญ่',
                              'เขตห้วยขวาง',
                              'เขตคลองสาน',
                              'เขตตลิ่งชัน',
                              'เขตบางกอกน้อย',
                              'เขตบางขุนเทียน',
                              'เขตภาษีเจริญ',
                              'เขตหนองแขม',
                              'เขตราษฎร์บูรณะ',
                              ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

              
              SizedBox(height: 5.0), 
               ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 72, 201, 176),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => profileuser())));
                },
                child: Text('บันทึก')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: editprofileuser(),
  ));
}