import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class editdog extends StatefulWidget {
  @override
  _editdogState createState() => _editdogState();
}

class _editdogState extends State<editdog> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String selectedGender = 'เพศผู้'; // ตัวแปรที่ใช้เก็บค่าเพศ
  

  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(
            colors: [Color.fromARGB(255, 234, 64, 128), Color.fromARGB(255, 238, 128, 95)], // เลือกสีที่คุณต้องการ
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          );
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขโปรไฟล์สัตว์เลี้ยง'),
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
                  labelText: ('ชื่อสัตว์เลี้ยง'),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),

            SizedBox(height: 16.0),
              const TextField(
                style:
                  TextStyle(color: Colors.black), // Set text color to black
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('อายุ(ปี)'),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              
            SizedBox(height: 20),
            // Dropdown เพศ
            Text(
              'เพศของสัตว์เลี้ยง',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: selectedGender,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue!;
                });
              },
              items: <String>['เพศผู้', 'เพศเมีย']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
