import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/editprofiledog.dart';
import 'package:petmatch/JIB_USER/profiledog.dart';
import 'package:petmatch/JIB_USER/profiledog2.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:petmatch/authenticationsScreen/edituser.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/navigationbar.dart';


class profiledog2 extends StatefulWidget {
  @override
  _profiledog2State createState() => _profiledog2State();
}

class _profiledog2State extends State<profiledog2> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

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
        "โปรไฟล์สัตว์เลี้ยง",
        style: TextStyle(color: Colors.black),
      ),
    ),


    body: SingleChildScrollView(
      child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color.fromARGB(255, 234, 64, 128), Color.fromARGB(255, 238, 128, 95)], // เลือกสีที่คุณต้องการ
        ),
      ),
      child: Center(
        child: Column(
          children:  [
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  SizedBox(width: 100.0),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => editprofiledog())));
                    },
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: Icon(Icons.edit),
                    foregroundColor: Color.fromARGB(255, 167, 175, 187),
                  ),
                  SizedBox(height: 2.0),
                  Text (
                    "แก้ไขข้อมูล",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

                    Text (
                    "กรุ๊ปเลือด",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                    SizedBox(height: 10.0),
                    Container(
                    padding: EdgeInsets.all(10.0), // กำหนด Padding ให้กับ Container
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.0), // กำหนดสีและความหนาของเส้นขอบ
                      borderRadius: BorderRadius.circular(10.0), // กำหนดขนาดของมุมขอบ
                    ),
                     child:Text (
                    "A",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                    ),

                    SizedBox(height: 15.0),
                    Text (
                    "ใบตรวจสุขภาพสัตว์เลี้ยง",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                    SizedBox(height: 5.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0), // กำหนดขอบเขตของรูปภาพ
                      child: Container(
                        width: 400, // กำหนดความกว้างของ Container
                        height: 600, // กำหนดความสูงของ Container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                          ),
                        ),
                        child: Image.network(
                          'https://www.thaiticketmajor.com/imgUpload/images/pic-coupon-RTB.jpg',
                          fit: BoxFit.cover, // ให้รูปภาพปรับขนาดให้พอดีกับ Container
                        ),
                      ),
                    ),

                  SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: ((context) => profileuser()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 26, 188, 156), // เปลี่ยนสีพื้นหลังของปุ่ม
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 32.0, // ปรับขนาดไอคอนตามต้องการ
                          color: Colors.white, // เปลี่ยนสีไอคอน
                        ),
                        Text(
                          'ไปยังโปรไฟล์ตนเอง',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white, // เปลี่ยนสีของข้อความ
                          ),
                        ),
                      ],
                    ),
                  ),
               ],
            ),
          ),
        ),
      ),
    );
  }
}


