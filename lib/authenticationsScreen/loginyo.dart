import 'package:flutter/material.dart';
import 'package:petmatch/authenticationsScreen/regisuser.dart';

class loginyo extends StatefulWidget {
  const loginyo({super.key});

  @override
  State<loginyo> createState() => _loginyoState();
}

class _loginyoState extends State<loginyo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "asset/images/logoji.png",
                width: 500,
              ),

              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ชื่อผู้ใช้งาน'),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),

              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('รหัสผ่าน'),
                   prefixIcon: Icon(Icons.lock),
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

              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => regisuser())));
                },
                child: Text('สมัครสมาชิก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
