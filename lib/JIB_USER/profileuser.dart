import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/editprofileuser.dart';
import 'package:petmatch/JIB_USER/pecert.dart';
import 'package:petmatch/JIB_USER/review.dart';
import 'package:petmatch/model/pet.model.dart';

class Profileuser extends StatelessWidget {
  Profileuser({Key? key, required this.pet}) : super(key: key);
  final Pet pet;
  final dio = Dio();

  void getHttp() async {
    final response = await dio.get('https://dart.dev');
    print(response);
  }

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
          "โปรไฟล์",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.star, color: Colors.yellow),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => Review())));
            },
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Color.fromARGB(255, 245, 244, 244)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => editprofileuser())));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.black),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => editprofileuser())));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color.fromARGB(255, 239, 83, 80), // Set the border color
                width: 5.0, // Set the border width
              ),
            ),
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(
                  'https://images.wagwalkingweb.com/media/daily_wag/blog_articles/hero/1685787498.877709/fun-facts-about-siberian-huskies-1.png'),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            " ${pet.namePet} , ${pet.agePet} ปี",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            "เพศ${pet.sexPet} , ${pet.idBreed} , ${pet.idSkin} , ${pet.idBlood}",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icon(Icons.location_on, color: Colors.grey),
              // SizedBox(width: 5.0),
              // Text(
              //   "รองเมือง, ปทุมวัน",
              //   style: TextStyle(fontSize: 16, color: Colors.grey),
              // ),
            ],
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          Petcert()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 80, 239, 181),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.local_hospital,
                  size: 32.0,
                  color: Colors.white,
                ),
                SizedBox(width: 10.0),
                Text(
                  'ใบพันธุ์ประวัติสุนัข',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
