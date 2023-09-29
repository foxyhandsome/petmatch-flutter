import 'package:flutter/material.dart';

class regpet extends StatefulWidget {
  const regpet({super.key});

  @override
  State<regpet> createState() => _regpetState();
}

class _regpetState extends State<regpet> {
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
            children: [
              const SizedBox(
                height: 30,
              ),
              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ชื่อสัตว์เลี้ยง'),
                  prefixIcon: Icon(Icons.pets),
                ),
              ),
              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('สายพันธุ์'),
                  prefixIcon: Icon(Icons.pest_control_rodent_sharp),
                ),
              ),
              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('เพศ'),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('อายุสัตว์เลี้ยง'),
                  prefixIcon: Icon(Icons.home),
                ),
              ),
              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('สีขน'),
                  prefixIcon: Icon(Icons.pets_rounded),
                ),
              ),

               TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {},
                child: Text('สมัคสมาชิก'),
              ),   

            ],
          ),
        ),
      ),
    );
  }
}