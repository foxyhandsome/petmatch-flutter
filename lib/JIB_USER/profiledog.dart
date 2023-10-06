import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/editprofiledog.dart';
import 'package:petmatch/JIB_USER/profiledog.dart';
import 'package:petmatch/JIB_USER/profiledog2.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:petmatch/authenticationsScreen/edituser.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/navigationbar.dart';


class profiledog extends StatefulWidget {
  @override
  _profiledogState createState() => _profiledogState();
}

class _profiledogState extends State<profiledog> {
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
                shape: BoxShape.circle,
              ),
            
              child:CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage('https://www.hdwallpapers.in/download/german_shepherd_4k_hd-1440x2560.jpg'),
            ),
            ),
      

                    SizedBox(height: 15.0),
                    Text (
                    "ชื่อสัตว์เลี้ยง",
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
                    "โบ้",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                    ),

                    SizedBox(height: 10.0),
                    Text (
                    "เพศ",
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
                    "เพศผู้",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                 ),
          
                    SizedBox(height: 10.0),
                    Text (
                    "อายุ",
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
                    "2(ปี)",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                    SizedBox(height: 10.0),
                    Text (
                    "สายพันธุ์",
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
                    "เยอรมันเชพเพิร์ด",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                   SizedBox(height: 10.0),
                    Text (
                    "สีขน",
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
                    "น้ำตาล,ดำ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                    SizedBox(height: 10.0),
                    Text (
                    "อายุ",
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
                    "2(ปี)",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: ((context) => profiledog2()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
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
                          'หน้าต่อไป',
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


