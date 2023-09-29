import 'package:flutter/material.dart';

class petbreed extends StatefulWidget {
  const petbreed({super.key});

  @override
  State<petbreed> createState() => _petbreedState();
}

class _petbreedState extends State<petbreed> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "ข้อมูลสัตว์เลี้ยง",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              
              

            ],
          ),
        ),
      ),
    );
  }
}