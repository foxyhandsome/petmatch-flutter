import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/editprofileuser.dart';

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
          "ประวัติ",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => editprofileuser())));
            },
          ),
        ],
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
                        color: Colors.red,
                        width: 1), // กำหนดสีและความกว้างของเส้นกรอบ
                    borderRadius:
                        BorderRadius.circular(10), // กำหนดรูปร่างของกรอบ
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.animalsaroundtheglobe.com/wp-content/uploads/2023/02/corgi-ga0a9055f1_1920-1200x800.jpg'),
                  ),
                  title: Text("บี้, 3(ปี)"),
                  subtitle: Text("ปทุมวัน"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.star), // ไอคอนของโปรไฟล์
                        onPressed: () {
                          // ไปยังหน้าโปรไฟล์
                        },
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Icons.info), // ไอคอนของรีวิว
                        onPressed: () {
                          // ไปยังหน้ารีวิว
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
