import 'package:flutter/material.dart';
import 'package:petmatch/authenticationsScreen/editdog.dart';
import 'package:petmatch/authenticationsScreen/edituser.dart';

class profiledog extends StatefulWidget {
  @override
  _profiledogState createState() => _profiledogState();
}

class _profiledogState extends State<profiledog> {
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
        title: Text('โปรไฟล์สัตว์เลี้ยง'),
      ),

      body: Container(
            decoration: BoxDecoration(
            gradient: linearGradient,
        ),
        child: Center(
          child: Column(
            children:  [
              const SizedBox(
                height: 30,
              ),

            CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage('URL_TO_PROFILE_IMAGE'),
            ),
          
           SizedBox(height: 16.0),
            FloatingActionButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: ((context) => editdog()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
              },
              backgroundColor: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังของปุ่ม
              child: Icon(Icons.edit),
              foregroundColor: Color.fromARGB(255, 167, 175, 187), // เปลี่ยนสีไอคอนเป็นสีแดง
            )
          ],
          ),
        ),
      ),
    );
  }
}
