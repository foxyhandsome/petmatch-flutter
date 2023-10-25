import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/editprofileuser.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/profileother.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/reviewother.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "ประวัติสัตว์เลี้ยงที่ถูกใจ",
          style: TextStyle(color: Colors.black),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 350, // ปรับความกว้างตามที่ต้องการ
                child: ListTile(
                  contentPadding: EdgeInsets.all(
                      10), // ปรับระยะห่างของเนื้อหาภายใน ListTile
                  tileColor: Colors.white, // สีพื้นหลังของ ListTile
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 239, 83, 80),
                        width: 1), // กำหนดสีและความกว้างของเส้นกรอบ
                    borderRadius:
                        BorderRadius.circular(10), // กำหนดรูปร่างของกรอบ
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://img.kapook.com/u/2022/Jarosphan/Pet/Dog/159/p01.jpg'),
                  ),
                  title: Text(
                    "เขี้ยว",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ), 
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.location_on,
                          color: Colors.grey), // ไอคอนของที่อยู่
                      SizedBox(width: 4), // ระยะห่างระหว่างไอคอนกับข้อความ
                      Text("สีลม, บางรัก"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.star),
                        color: Colors.yellow, // ไอคอนของโปรไฟล์
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => reviewother())));
                        },
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.pets),
                        color:
                            Color.fromARGB(255, 239, 83, 80), // ไอคอนของรีวิว
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => profileother())));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
