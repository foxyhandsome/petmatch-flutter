import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'dart:io';
import 'package:petmatch/authenticationsScreen/editdog.dart';

List<String> list4 = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];

class registerdog2jib extends StatefulWidget {
  @override
  _registerdog2jibState createState() => _registerdog2jibState();
}

class _registerdog2jibState extends State<registerdog2jib> {
  final dio = Dio();
  login(){
    if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
      
    }
  }
  File? _image;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String dropdownValue4 = list4.first;




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

                SizedBox(height: 20.0),
                    Text (
                    "กรุ๊ปเลือด",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
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
                        dropdownMenuEntries: list4.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),
                
                SizedBox(height: 20.0),
                     Text (
                    "อัปโหลดใบตรวจสุขภาพสัตว์เลี้ยง",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: getImage,
                child: Container(
                  width: 300,  // Set the desired width
                  height: 500, // Set the desired height
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255), // Change to the desired background color
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                  ),
                  child: ClipRect(
                    child: _image == null
                        ? Icon(
                            Icons.local_hospital,
                            size: 100,
                            color: Color.fromARGB(255, 236, 112, 99), // Change to desired color
                          )
                        : Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            width: 300, // Set width to match the container width
                            height: 500, // Set height to match the container height
                          ),
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
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => loginjib())));
                },
                child: Text('หน้าต่อไป')
              ),
          ],
        ),
    ),
    );
  }
}