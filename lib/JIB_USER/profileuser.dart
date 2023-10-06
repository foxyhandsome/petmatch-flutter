import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/editprofileuser.dart';
import 'package:petmatch/JIB_USER/profiledog.dart';
import 'package:petmatch/authenticationsScreen/edituser.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/navigationbar.dart';


class profileuser extends StatefulWidget {
  @override
  _profileuserState createState() => _profileuserState();
}

class _profileuserState extends State<profileuser> {
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
          "โปรไฟล์",
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
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => editprofileuser())));
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
              backgroundImage: NetworkImage('https://images.lifestyleasia.com/wp-content/uploads/sites/7/2023/05/05185049/Kim-Seon-ho-TV-Shows-2.jpg'),
            ),
            ),
      

                    SizedBox(height: 15.0),
                    Text (
                    "ชื่อผู้ใช้งาน",
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
                    "jib.cnc_101",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                 ),

                    SizedBox(height: 10.0),
                    Text (
                    "เบอร์โทรศัพท์",
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
                    "0970466989",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    ),
                  ),
                 ),
          
                    SizedBox(height: 10.0),
                    Text (
                    "ช่องทางติดต่อออนไลน์",
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
                    "FB-Jib Chanokchon,Line-jib.cnc",
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
                       Navigator.push(context, MaterialPageRoute(builder: ((context) => profiledog()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
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
                          'ไปยังโปรไฟล์สัตว์เลี้ยง',
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


