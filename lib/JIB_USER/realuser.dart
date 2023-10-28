import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';

class realuser extends StatefulWidget {
  const realuser({super.key});

  @override
  State<realuser> createState() => _realuserState();
}

class _realuserState extends State<realuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์ของฉัน'),
        backgroundColor:
            Color.fromARGB(255, 239, 83, 80), // เพิ่มสีพื้นหลังของ app bar
      ),
      body: Center(
        child: ProfileInfo(),
      ),
      backgroundColor: Colors.white, // เพิ่มสีพื้นหลังของ body
    );
  }
}

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ชื่อ: ชื่อของคุณ',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          'ที่อยู่: ที่อยู่ของคุณ',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          'เบอร์โทร: เบอร์โทรของคุณ',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          'คำแนะนำเพิ่มเติม: คำแนะนำเพิ่มเติมของคุณ',
          style: TextStyle(fontSize: 20),
        ),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => loginjib())));
          },
          icon: Icon(
            Icons.pets,
            color: Colors.white, // สีไอคอน
          ),
          label: Text(
            'เข้าสู่โปรไฟล์',
            style: TextStyle(color: Colors.white), // สีของข้อความ
          ),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 239, 83, 80), // สีพื้นหลังของปุ่ม
            minimumSize: Size(100, 35), // ปรับขนาดปุ่มตามที่ต้องการ
          ),
        ),
      ],
    );
  }
}
