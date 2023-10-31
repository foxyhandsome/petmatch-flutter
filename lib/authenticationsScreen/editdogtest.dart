import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:petmatch/authenticationsScreen/editdog.dart';


class editdogtest extends StatefulWidget {
  @override
  _editdogtestState createState() => _editdogtestState();
}

class _editdogtestState extends State<editdogtest> {
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
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
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
                controller: passwordController,
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
                  labelText: 'ช่องทางติดต่อออนไลน์',
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
              'เพศของสัตว์เลี้ยง',
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

              // TextButton(
              //   onPressed: () {Navigator.push(context, MaterialPageRoute(builder: ((context) => test()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
              //   },
              //   child: Text(
              //     'หากมีบัญชีผู้ใช้แล้ว กดเพื่อเข้าสู่ระบบ',
              //     style: TextStyle(
              //       fontSize: 12,
              //       color: Colors.white ,
              //     ),
              //   ),
              // ),
              
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
                  editdog();
                },
                child: Text('สมัครสมาชิก')
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: editdogtest(),
  ));
}