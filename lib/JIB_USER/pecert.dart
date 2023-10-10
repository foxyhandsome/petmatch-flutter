import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/editprofileuser.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:petmatch/JIB_USER/pecert.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:petmatch/authenticationsScreen/edituser.dart';
import 'package:petmatch/authenticationsScreen/navigationbar/navigationbar.dart';


class pedcert extends StatefulWidget {
  @override
  _pedcertState createState() => _pedcertState();
}

class _pedcertState extends State<pedcert> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255,239,83,80),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              "ใบตรวจสุขภาพสัตว์เลี้ยง",
              style: TextStyle(color: Colors.black),
            ),
          ),

            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255), // Set your desired color here
              ),
              child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                        SizedBox(height: 15.0),
                        Text (
                        "",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                    SizedBox(height: 10.0),
                    ClipRRect( // กำหนดขอบเขตของรูปภาพ
                      child: Container(
                        width: 500, // กำหนดความกว้างของ Container
                        height: 600, // กำหนดความสูงของ Container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255,239,83,80),
                            width: 5.0,
                          ),
                        ),
                        child: Image.network(
                          'https://www.thaiticketmajor.com/imgUpload/images/pic-coupon-RTB.jpg',
                          fit: BoxFit.cover, // ให้รูปภาพปรับขนาดให้พอดีกับ Container
                        ),
                      ),
                    ),



               ],
            ),
          ),
          ),
        );
  }
}


