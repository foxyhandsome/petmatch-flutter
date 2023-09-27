import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matcher/matcher.dart';

class regisuser extends StatefulWidget {
  const regisuser({super.key});

  @override
  State<regisuser> createState() => _regisuserState();
}

class _regisuserState extends State<regisuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "สมัครสมาชิกเจ้าของสัตว์เลี้ยง",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              SizedBox(
                height: 30,
              ),
              TextField(
                style: TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ชื่อผู้ใช้งาน'),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),

              TextField(
                style: TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('รหัสผ่าน'),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              TextField(
                style: TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('เบอร์โทรศัพท์'),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),

              TextField(
                style: TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ที่อยู่'),
                  prefixIcon: Icon(Icons.home),
                ),
              ),

              TextField(
                style: TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ช่องทางการติดต่อออนไลน์'),
                  prefixIcon: Icon(Icons.chat),
                ),
              ), 
                 TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: Text('เข้าสู่ระบบ')
              ),             
            ],
          ),
        ),
      ),
    );
  }
}
