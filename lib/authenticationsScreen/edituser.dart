import 'package:flutter/material.dart';

class edituser extends StatefulWidget {
  @override
  _edituserState createState() => _edituserState();
}

class _edituserState extends State<edituser> {
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
        title: Text('แก้ไขโปรไฟล์เจ้าของสัตว์เลี้ยง'),
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

            const CircleAvatar(
              radius: 120,
              backgroundColor: (Colors.white),
              backgroundImage: NetworkImage('URL_TO_PROFILE_IMAGE'),
            ),

             SizedBox(height: 16.0),
                const TextField(
                style:
                  TextStyle(color: Colors.black), // Set text color to black
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ชื่อผู้ใช้งาน'),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),

              SizedBox(height: 16.0),
              const TextField(
                style:
                  TextStyle(color: Colors.black), // Set text color to black
                  obscureText: true,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('รหัสผ่าน'),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

            SizedBox(height: 16.0),
              const TextField(
                style:
                  TextStyle(color: Colors.black), // Set text color to black
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('เบอร์โทรศัพท์'),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              
              SizedBox(height: 16.0),
              const TextField(
                style:
                  TextStyle(color: Colors.black), // Set text color to black
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ที่อยู่'),
                  prefixIcon: Icon(Icons.home),
                  iconColor: Colors.black
                ),
              ),

              SizedBox(height: 16.0),
              const TextField(
                style:
                  TextStyle(color: Colors.black), // Set text color to black
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ช่องทางการติดต่อออนไลน์'),
                  prefixIcon: Icon(Icons.chat),
                ),
              ),  

          
            SizedBox(height: 16),
              Row( // ใช้ Row เพื่อวางปุ่มให้อยู่ข้างกัน
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // ปรับตำแหน่งปุ่ม
              children: [
            ElevatedButton(
              onPressed: () {
                // ทำการบันทึกข้อมูลที่ถูกแก้ไข
                // อาจต้องเรียก API หรือทำการบันทึกลงในฐานข้อมูลตามความต้องการ
              },
                  style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 50), // กำหนดขนาดความกว้างและความสูง
                  backgroundColor: Color.fromARGB(255, 46, 204, 113), // เปลี่ยนสีพื้นหลังเป็นสีเขียว
                ),
              child: Text('บันทึก'),
            ),

            ElevatedButton(
              onPressed: () {  // ใส่โค้ดที่ต้องการเมื่อคลิกปุ่มที่สอง
                },
                  style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 50), // กำหนดขนาดความกว้างและความสูง
                  backgroundColor: Color.fromARGB(255, 231, 76, 60), // เปลี่ยนสีพื้นหลังเป็นสีเขียว
                ),
                child: Text('ยกเลิก'),
            ),
              ],
            ),
           ]
          ),
        )
      )
    );
  }
}