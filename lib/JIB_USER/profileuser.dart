import 'package:flutter/material.dart';
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
    var linearGradient = LinearGradient(
            colors: [Color.fromARGB(255, 234, 64, 128), Color.fromARGB(255, 238, 128, 95)], // เลือกสีที่คุณต้องการ
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          );
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


      body: Container(
            decoration: BoxDecoration(
            gradient: linearGradient,
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
               Navigator.push(context, MaterialPageRoute(builder: ((context) => edituser()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
              },
              backgroundColor: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังของปุ่ม
              child: Icon(Icons.edit),
              foregroundColor: Color.fromARGB(255, 167, 175, 187), // เปลี่ยนสีไอคอนเป็นสีแดง
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
            
          
            SizedBox(height: 0.0),
            Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white, // สีขอบ
                width: 5.0,         // ความหนาของเส้นขอบ
              ),
              shape: BoxShape.circle, // กำหนดรูปร่างของ Container เป็นวงกลม
            ),
            
              child:CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage('https://asianwiki.com/images/8/8b/A_Good_Day_to_Be_a_Dog-a00.jpg'),
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

            ],
          ),
        ),
      ),
    );
  }
}


