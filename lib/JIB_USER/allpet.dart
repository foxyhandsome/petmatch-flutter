import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/addpet.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/profileuser2.dart';

class allpet extends StatefulWidget {
  const allpet({super.key});

  @override
  State<allpet> createState() => _allpetState();
}

class _allpetState extends State<allpet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        elevation: 0,
        title: Text(
          "สัตว์เลี้ยงทั้งหมด",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => addpet())));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
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
                        'https://images.wagwalkingweb.com/media/daily_wag/blog_articles/hero/1685787498.877709/fun-facts-about-siberian-huskies-1.png'),
                  ),
                  title: Text(
                    "โบ้",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => profileuser())));
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
                          minimumSize:
                              Size(100, 35), // ปรับขนาดปุ่มตามที่ต้องการ
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

                        SizedBox(
              height: 15,
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
                        'https://www.animalsaroundtheglobe.com/wp-content/uploads/2023/02/corgi-ga0a9055f1_1920-1200x800.jpg'),
                  ),
                  title: Text(
                    "บี้",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => profileuser2())));
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
                          minimumSize:
                              Size(100, 35), // ปรับขนาดปุ่มตามที่ต้องการ
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
