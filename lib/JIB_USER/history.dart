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
        child: ListTile(
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
              ElevatedButton(
                onPressed: () {
                  // ไปยังหน้าโปรไฟล์
                },
                child: Text('ดูโปรไฟล์'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  // ไปยังหน้ารีวิว
                },
                child: Text('ดูรีวิว'),
              ),
            ],
          ),
        ),

        



      ),
    );
  }
}
