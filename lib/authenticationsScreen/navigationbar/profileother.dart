import 'package:flutter/material.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/reviewother.dart';
import '../../JIB_USER/editprofileuser.dart';
import '../../JIB_USER/pecert.dart';

class profileother extends StatefulWidget {
  const profileother({super.key});

  @override
  State<profileother> createState() => _profileotherState();
}


class _profileotherState extends State<profileother> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        elevation: 0,
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
        actions: [
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color.fromARGB(255, 239, 83, 80), // Set the border color
                width: 5.0, // Set the border width
              ),
            ),
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(
                  'https://img.kapook.com/u/2022/Jarosphan/Pet/Dog/159/p01.jpg'),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "เขี้ยว, 4(ปี)",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            "เพศผู้, พิทบูล , สุนัขขนสีเดียวล้วน , DEA 1.1",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.location_on, color: Colors.grey),
              SizedBox(width: 5.0),
              Text(
                "สีลม, บางรัก",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          pedcert()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 80, 239, 181),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.local_hospital,
                  size: 32.0,
                  color: Colors.white,
                ),
                SizedBox(width: 10.0),
                Text(
                  'ใบพันธุ์ประวัติสุนัข',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(5.0), // กำหนดการเว้นระยะ
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 239, 83, 80), // กำหนดสีขอบ
                    width: 1.0, // กำหนดความหนาขอบ
                  ),
                  borderRadius: BorderRadius.circular(8.0), // กำหนดมุมขอบ
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color.fromARGB(
                              255, 239, 83, 80), // กำหนดสีของไอคอน
                        ),
                      ],
                    ),

                    SizedBox(width: 8.0),
                    Text(
                      'ชื่อผู้ใช้งาน', // ข้อความชื่อผู้ใช้งาน
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    SizedBox(height: 8.0), // กำหนดระยะห่างระหว่างบรรทัด
                    Row(
                      children: [
                        Text(
                          'foxyhandsomme', // ข้อความ "jib.cnc 101"
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.underline, // เส้นใต้
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(5.0), // กำหนดการเว้นระยะ
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 239, 83, 80), // กำหนดสีขอบ
                    width: 1.0, // กำหนดความหนาขอบ
                  ),
                  borderRadius: BorderRadius.circular(8.0), // กำหนดมุมขอบ
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color.fromARGB(
                              255, 239, 83, 80), // กำหนดสีของไอคอน
                        ),
                      ],
                    ),

                    SizedBox(width: 8.0),
                    Text(
                      'เบอร์โทรศัพท์', // ข้อความชื่อผู้ใช้งาน
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    SizedBox(height: 8.0), // กำหนดระยะห่างระหว่างบรรทัด
                    Row(
                      children: [
                        Text(
                          '0123456789', // ข้อความ "jib.cnc 101"
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.underline, // เส้นใต้
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(5.0), // กำหนดการเว้นระยะ
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 239, 83, 80), // กำหนดสีขอบ
                    width: 1.0, // กำหนดความหนาขอบ
                  ),
                  borderRadius: BorderRadius.circular(8.0), // กำหนดมุมขอบ
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.chat,
                          color: Color.fromARGB(
                              255, 239, 83, 80), // กำหนดสีของไอคอน
                        ),
                      ],
                    ),

                    SizedBox(width: 8.0),
                    Text(
                      'แนะนำเพิ่มเติม', // ข้อความชื่อผู้ใช้งาน
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),

                    SizedBox(height: 8.0), // กำหนดระยะห่างระหว่างบรรทัด
                    Row(
                      children: [
                        Text(
                          'FB:Ton Nitirath', // ข้อความ "jib.cnc 101"
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.underline, // เส้นใต้
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

