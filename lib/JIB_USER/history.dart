import 'package:flutter/material.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        elevation: 0,
        title: Text(
          "ประวัติการจับคู่",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8.0), // กำหนดระยะห่างขอบ
              padding: EdgeInsets.all(8.0), // กำหนดระยะห่างขอบ
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // กำหนดระยะมุมขอบ
                border: Border.all(
                  color: Color.fromARGB(255, 239, 83, 80),
                ), // กำหนดสีขอบ
              ),
              child: ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://3.bp.blogspot.com/-yOwC9p4BXAg/UK9YAbSdh1I/AAAAAAAAASo/9kNBuEEJ5Zg/s1600/%25E0%25B8%259A%25E0%25B8%25B5%25E0%25B8%25B5%25E0%25B9%2580%25E0%25B8%2581%25E0%25B8%25B4%25E0%25B9%2589%25E0%25B8%25A5.jpg'),
                    radius: 30,
                  ),
                ),
                title: Text(
                  "บีเกิล, 1(ปี)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    Icon(Icons.location_on,
                        color: Colors.grey), // เพิ่มไอคอน location ไว้ที่นี้
                    SizedBox(width: 1), // ระยะห่างระหว่างไอคอนและข้อความ
                    Text('บางรัก, สีลม'),
                  ],
                ),
                trailing: Icon(Icons.favorite,
                    color: Colors.red), // เพิ่มไอคอนหัวใจทางขวาสุด
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // ทำอะไรสักอย่างเมื่อคลิกที่ปุ่มดูข้อมูล
                  },
                  icon: Icon(Icons.pets),
                  label: Text('ดูข้อมูล'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 239, 83, 80),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // ทำอะไรสักอย่างเมื่อคลิกที่ปุ่มดูรีวิว
                  },
                  icon: Icon(Icons.star, color: Colors.yellow),
                  label: Text('ดูรีวิว'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 239, 83, 80),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
