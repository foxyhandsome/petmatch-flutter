import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
          },
        ),
      title: Text(
        "โปรไฟล์สัตว์เลี้ยง",
        style: TextStyle(color: Colors.black),
      ),
    ),


    body: SingleChildScrollView(
      child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color.fromARGB(255, 234, 64, 128), Color.fromARGB(255, 238, 128, 95)], // เลือกสีที่คุณต้องการ
        ),
      ),
      child: Center(
        child: Column(
          children:  [
            SizedBox(
            height: 5,
            
            ),
          ],
        ),
            ),
      ),
      ),
    );
  }
}
  
