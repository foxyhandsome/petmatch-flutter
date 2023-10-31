import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:petmatch/JIB_USER/editprofileuser.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';

import '../constant/domain.dart';
import '../model/user.model.dart';

class Realuser extends StatefulWidget {
  const Realuser({super.key});

  @override
  State<Realuser> createState() => _RealuserState();
}

class _RealuserState extends State<Realuser> {
  final dio = Dio();
  String? idUser;
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();

  @override
  void initState() {
    getData();
    super.initState();
  }

  List<User> list = [];
  Future<void> getData() async {
    try {
      list = [];
      idUser = await storageToken.read(key: 'id_user');
      final response = await dio.get(url_api + '/user/get-user/' + idUser!);
      if (response.statusCode == 200) {
        final responseData = response.data;
        for (var element in responseData) {
          list.add(User(
            username: element["username"],
            information: element["information"],
            nameSubdistrict: element["name_subdistrict"],
            nameDistrict: element["name_district"],
            contact: element["contact"],
          ));
        }
        setState(() {});
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error: $e');
    }
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
          "โปรไฟล์ตัวเอง",
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
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),

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
              SizedBox(height: 15.0),
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.white, // สีพื้นหลังเป็นสีขาว
                  borderRadius: BorderRadius.circular(100.0), // ครึ่งขอบวงกลม
                  border: Border.all(
                    color: Color.fromARGB(255, 239, 83, 80), // สีขอบเป็นสีขาว
                    width: 2.0, // ความหนาขอบเป็น 2 พิกเซล
                  ),
                ),
                child: Image.asset(
                  'asset/images/petmatchlogo.png',
                  height: 500,
                  width: 500, // ปรับขนาดของโลโก้ตามต้องการ
                ),
              ),
              SizedBox(height: 30.0),
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
                        Icon(
                          Icons.person,
                          size: 25.0,
                          color: Color.fromARGB(255, 239, 83, 80),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'ชื่อ:',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          ' ${list.isNotEmpty ? list[0].username : ""}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 5,
                                5), // Replace with your desired text color
                          ),
                        )
                      ],
                    ),
                  ],
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
                        Icon(
                          Icons.phone,
                          size: 25.0,
                          color: Color.fromARGB(255, 239, 83, 80),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'เบอร์โทร:',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          ' ${list.isNotEmpty ? list[0].contact : ""}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 5,
                                5), // Replace with your desired text color
                          ),
                        ),
                      ],
                    ),
                  ],
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
                        Icon(
                          Icons.location_on,
                          size: 25.0,
                          color: Color.fromARGB(255, 239, 83, 80),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'แขวง:',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          ' ${list.isNotEmpty ? list[0].idSubdistrict : ""}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 5,
                                5), // Replace with your desired text color
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'เขต:',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          ' ${list.isNotEmpty ? list[0].idDistrict : ""}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 5,
                                5), // Replace with your desired text color
                          ),
                        ),
                      ],
                    ),
                  ],
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
                        Icon(
                          Icons.chat,
                          size: 25.0,
                          color: Color.fromARGB(255, 239, 83, 80),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'คำแนะนำเพิ่มเติม:',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          ' ${list.isNotEmpty ? list[0].information : ""}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 5,
                                5), // Replace with your desired text color
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Loginjib())));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.exit_to_app), // ไอคอน
                      SizedBox(width: 10), // ระยะห่างระหว่างไอคอนกับข้อความ
                      Text(
                        'ออกจากระบบ',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
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
