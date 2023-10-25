import 'package:flutter/material.dart';

class reviewother extends StatefulWidget {
  const reviewother({super.key});

  @override
  State<reviewother> createState() => _reviewotherState();
}

class _reviewotherState extends State<reviewother> {
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "รีวิว",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(255, 239, 83, 80),
                    width: 5.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://img.kapook.com/u/2022/Jarosphan/Pet/Dog/159/p01.jpg'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "รีวิวของ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "เขี้ยว",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(width: 20.0), // เพิ่มระยะห่าง
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0, 0, 20.0, 0), // เพิ่มค่าขอบด้านขวา
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 239, 83, 80), width: 1.0),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Foxyhandsome:",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "น่ารัก ขี้เล่นมากครับ",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                SizedBox(width: 20.0), // เพิ่มระยะห่าง
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0, 0, 20.0, 0), // เพิ่มค่าขอบด้านขวา
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 239, 83, 80), width: 1.0),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "KaouKungZa:",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "น่ารักมากเลยครับ",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'แสดงความคิดเห็นของคุณ',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _reviewController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'พิมพ์รีวิวของคุณที่นี่...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // ปรับความโค้งขอบที่นี่
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 239, 83, 80)),
                        borderRadius: BorderRadius.circular(
                            10.0), // ปรับความโค้งขอบที่นี่
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: () {
                      // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 239, 83, 80),
                    ),
                    child: Text('ส่งรีวิว'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
