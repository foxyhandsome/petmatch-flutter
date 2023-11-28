import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petmatch/JIB_USER/editprofiledog.dart';
import 'package:petmatch/JIB_USER/pecert.dart';
import 'package:petmatch/JIB_USER/review.dart';
import 'package:petmatch/JIB_USER/review_pet_me.dart';

import '../constant/domain.dart';
import '../model/pet.model.dart';
import 'editprofileuser.dart';

class Profiledog extends StatefulWidget {
  Profiledog({Key? key, required this.pet}) : super(key: key);
  final Pet pet;
  final dio = Dio();

  void getHttp() async {
    final response = await dio.get('https://dart.dev');
    print(response);
  }

  @override
  State<Profiledog> createState() => _ProfiledogState();
}

class _ProfiledogState extends State<Profiledog> {
  final dio = Dio();
  deletePet(int id) async {
    try {
      Response response = await dio.delete(url_api + '/pet/delete-Pet/$id');
      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pop(context);
        print('Pet with ID $id deleted successfully');
        Fluttertoast.showToast(
            msg: "ลบสัตว์เลี้ยงเรียบร้อยแล้ว",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        // Handle errors here
        print('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error: $e');
    }
  }

  void notifacontionCustom(BuildContext context, String text) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: Text(
              'ลบสัตว์เลี้ยง?',
              style: TextStyle(
                  color: Color.fromARGB(255, 65, 57, 52),
                  fontFamily: 'prompt',
                  fontWeight: FontWeight.w900,
                  fontSize: 21),
            ),
            content: Text(
              text,
              style: TextStyle(
                  color: Color.fromARGB(255, 55, 48, 43),
                  fontFamily: 'prompt',
                  fontSize: 15),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                    fontFamily: 'prompt',
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 223, 40, 8),
                  ),
                ),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
              CupertinoDialogAction(
                onPressed: () {
                  deletePet(widget.pet.idPet!);
                },
                child: Text(
                  'ตกลง',
                  style: TextStyle(
                    fontFamily: 'prompt',
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 1, 75, 107),
                  ),
                ),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
              // The "No" button
            ],
          );
        });
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
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ReviewPetMe(
                            pet: widget.pet,
                          ))));
            },
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Color.fromARGB(255, 245, 244, 244)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          Editprofiledog(pet: widget.pet.idPet!))));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.black),
            onPressed: () {
              notifacontionCustom(context, "ต้องการลบสัตว์เลี้ยงใช่หรือไม่");

              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => editprofileuser())));
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color:
              Color.fromARGB(255, 255, 255, 255), // Set your desired color here
        ),
        child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color.fromARGB(
                          255, 239, 83, 80), // Set the border color
                      width: 5.0, // Set the border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: "${widget.pet.picturePet}" != null
                        ? MemoryImage(base64Decode("${widget.pet.picturePet}"))
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(
                        " ${widget.pet.namePet} , ${widget.pet.agePet} ปี",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),

                    SizedBox(height: 15.0),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 239, 83, 80),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              //Icon(
                              //Icons.person,
                              // size: 25.0,
                              //color: Color.fromARGB(255, 239, 83, 80),
                              //),
                              SizedBox(width: 10.0),
                              Text(
                                'เพศ: ${widget.pet.sexPet}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 5, 5),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 239, 83, 80),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              Text(
                                'พันธุ์: ${widget.pet.nameBreed}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 5, 5),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 239, 83, 80),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              Text(
                                'สีขน: ${widget.pet.typeSkin}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 5, 5),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 239, 83, 80),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 10.0),
                              Text(
                                ' กรุ๊ปเลือด: ${widget.pet.typeBlood}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 5, 5, 5),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    //SizedBox(height: 10.0),
                    //Container(
                    //padding: EdgeInsets.symmetric(horizontal: 16.0),
                    //child: Text(
                    //"เพศ${widget.pet.sexPet} , ${widget.pet.nameBreed} , ${widget.pet.typeSkin} , ${widget.pet.typeBlood}",
                    // style: TextStyle(fontSize: 16, color: Colors.grey),
                    //),
                    // ),
                  ],
                ),
                SizedBox(height: 30.0),
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
                Container(
                  width: 300, // กำหนดความกว้างของปุ่ม
                  height: 50, // กำหนดความสูงของปุ่ม
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Petcert(pet: widget.pet)),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 80, 239, 181),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // ปรับความโค้งมน
                      ),
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
                          'ดูใบพันธุ์ประวัติสุนัข',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
