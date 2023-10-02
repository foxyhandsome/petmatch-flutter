import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
        title: Text('แก้ไขโปรไฟล์'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: getImage,
              child: ClipOval(
                child: _image == null
                    ? CircleAvatar(
                        radius: 60,
                        child: Icon(Icons.person, size: 60),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(_image!),
                      ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'ชื่อผู้ใช้งาน',
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                print('ชื่อผู้ใช้งาน: $username');
                // ทำการบันทึกข้อมูล
              },
              child: Text('บันทึก'),
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