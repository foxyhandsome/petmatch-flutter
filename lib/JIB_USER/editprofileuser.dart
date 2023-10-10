import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/menu.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'dart:io';
import 'package:petmatch/authenticationsScreen/editdog.dart';


List<String> list1 = <String>['แขวง 1', 'แขวง 2']; //แขวง
List<String> list2 = <String>['เขต 1', 'เขต 2', 'เขต 3']; //เขต
List<String> list3 = <String>['1', '2','3','4','5','6','7','8','9','10',]; //อายุ
List<String> list4 = <String>['พันธุ์ 1', 'พันธุ์ 2', 'พันธุ์ 3', 'พันธุ์ 4','พันธุ์ 5',]; //พันธุ์
List<String> list5 = <String>['สี 1', 'สี 2' , 'สี 3', 'สี 4', 'สี 5']; //สีขน
List<String> list6 = <String>['A', 'B','C','D','E','F','G']; //กรุ๊ปเลือด



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
        backgroundColor: Color.fromARGB(255,239,83,80),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
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
            color: Color.fromARGB(255, 255, 255, 255), // Set your desired color here
          ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

                    Text (
                    "ข้อมูลเจ้าของสัตว์เลี้ยง",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),


                SizedBox(height: 10.0),
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
                      color: Colors.black, // สีเส้นขอบเมื่อไม่ได้รับการกด
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
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
                      color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
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
                      color: Colors.black, // สีเส้นขอบเมื่อไม่ได้รับการกด
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
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
                decoration: InputDecoration(
                  labelText: 'แก้ไขช่องทางการติดต่ออื่นๆ',
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
                      color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่ชื่อผู้ใช้งาน',
                  prefixIcon: Icon(Icons.chat),
                ),
              ),

                    SizedBox(height: 10.0),
                    Text (
                    "แก้ไขแขวง",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
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
                        dropdownMenuEntries: list1.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                    SizedBox(height: 10.0),
                    Text (
                    "แก้ไขเขต",
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



///////////////////////////สัตว์เลี้ยง//////////////////////////////////////////////////////////////////////////////////////
                    
                  
                    SizedBox(height: 25.0),
                    Text (
                    "ข้อมูลของสัตว์เลี้ยง",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                    SizedBox(height: 10.0),
                    GestureDetector(
                    onTap: getImageDog,
                    child: ClipOval(
                      child: _image == null
                          ? CircleAvatar(
                              radius: 150,
                              child: Icon(Icons.pets, size: 100),
                            )
                          : CircleAvatar(
                              radius: 150,
                              backgroundImage: FileImage(_image!),
                            ),
                    ),
                  ),


                    SizedBox(height: 20.0),
                    ToggleButtons(
                      children: <Widget>[
                        Column(
                          children: [
                            Icon(Icons.male,size: 35.0,),
                            Text('เพศผู้'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.female,size: 35.0,),
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

                SizedBox(height: 20.0),
                TextField(
                decoration: InputDecoration(
                  labelText: 'แก้ไขชื่อสัตว์เลี้ยง',
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
                      color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่ชื่อสัตว์เลี้ยง',
                  prefixIcon: Icon(Icons.pets),
                ),
              ),

                    SizedBox(height: 10.0),
                    Text (
                    "แก้ไขอายุ(ปี)",
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

                    SizedBox(height: 10.0),
                    Text (
                    "แก้ไขสายพันธุ์",
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

                    SizedBox(height: 10.0),
                    Text (
                    "แก้ไขสีขน",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
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
                        dropdownMenuEntries: list5.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(value: value, label: value);
                        }).toList(),
                      ),

                    SizedBox(height: 10.0),
                    Text (
                    "แก้ไขกรุ๊ปเลือด",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
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
                          dropdownMenuEntries: list6.map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(value: value, label: value);
                          }).toList(),
                        ),

                    SizedBox(height: 20.0),
                    Text (
                        "แก้ไขใบตรวจสุขภาพสัตว์เลี้ยง",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),

                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: getImagePetCert,
                      child: Container(
                        width: 400,  // Set the desired width
                        height: 600, // Set the desired height
                        decoration: BoxDecoration(
                        border: Border.all(
                        color: Colors.black, // สีขอบ
                        width: 2.0, // ความหนาขอบ
                        ),
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
                                  width: 200, // Set width to match the container width
                                  height: 400, // Set height to match the container height
                                ),
                        ),
                      ),
                    ),



                SizedBox(height: 10.0),
                ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255,239,83,80),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => Menu())));
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