import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/history.dart';
import 'package:petmatch/JIB_USER/home.dart';
import 'package:petmatch/JIB_USER/realuser.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/profileother.dart';

class Reqmatch extends StatefulWidget {
  const Reqmatch({super.key});

  @override
  State<Reqmatch> createState() => _ReqmatchState();
}

class _ReqmatchState extends State<Reqmatch> {
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
          "ข้อเสนอการจับคู่",
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
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profileother()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://img.kapook.com/u/2022/Jarosphan/Pet/Dog/159/p01.jpg'),
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        "เขี้ยว",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
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
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 128, 0),
                            width: 2.0,
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.check), // ไอคอนของยอมรับ
                          color: Color.fromARGB(255, 0, 128, 0),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 15.0), // ระยะห่างระหว่างกรอบวงกลม
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.close), // ไอคอนของปฏิเสธ
                          color: Color.fromARGB(255, 255, 0, 0),
                          onPressed: () {},
                        ),
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
