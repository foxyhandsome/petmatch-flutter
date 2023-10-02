import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/registerdog2jib.dart';
import 'dart:io';
import 'package:petmatch/authenticationsScreen/editdog.dart';

List<String> list = <String>['เพศผู้', 'เพศเมีย'];
List<String> list2 = <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
List<String> list3 = <String>['พันธุ์', 'พันธุ์2', 'พันธุ์3', 'พันธุ์4', 'พันธุ์5', 'พันธุ์6'];

class registerdogjib extends StatefulWidget {
  @override
  _registerdogjibState createState() => _registerdogjibState();
}

class _registerdogjibState extends State<registerdogjib> {
  final dio = Dio();
  login(){
    if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
      
    }
  }
  File? _image;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String dropdownValue = list.first;
  String dropdownValue2 = list2.first;
  String dropdownValue3 = list3.first;




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
          "สมัครสมาชิกสัตว์เลี้ยง",
          style: TextStyle(color: Colors.black),
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
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
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'ชื่อสัตว์เลี้ยง',
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
                  hintText: 'ใส่ชื่อชื่อสัตว์เลี้ยง',
                  prefixIcon: Icon(Icons.pets),
                ),
              ),

                SizedBox(height: 20.0),
                    Text (
                    "เพศ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5.0),
                  DropdownMenu<String>(
                        initialSelection: list.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),
 
                SizedBox(height: 20.0),
                    Text (
                    "อายุ(ปี)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
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
                        dropdownMenuEntries: list2.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                    SizedBox(height: 20.0),
                    Text (
                    "สายพันธุ์",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                  SizedBox(height: 5.0),
                  DropdownMenu<String>(
                        initialSelection: list3.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue3 = value!;
                          });
                        },
                        dropdownMenuEntries: list3.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                SizedBox(height: 20.0),
                TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'สีขน',
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
                  hintText: 'ใส่สีขน',
                  prefixIcon: Icon(Icons.cloud),
                ),
              ),

              TextButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: ((context) => loginjib()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                },
                child: Text(
                  'หากมีบัญชีผู้ใช้แล้ว กดเพื่อเข้าสู่ระบบ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white ,
                  ),
                ),
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
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => registerdog2jib())));
                },
                child: Text('หน้าต่อไป')
              ),
          ],
        ),
    ),
    );
  }
}
