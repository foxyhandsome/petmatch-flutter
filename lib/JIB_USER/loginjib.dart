import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/registeruserjib.dart';
import '../constant/domain.dart';

class loginjib extends StatefulWidget {
  const loginjib({super.key});

  @override
  State<loginjib> createState() => _loginjibState();
}

class _loginjibState extends State<loginjib> {
    final dio = Dio();
    Login() async {
      print("123");
      try {
        if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
          Response response = await dio.post(
            url_api + '/auth/login-all',
            data: {
              'username': usernameController.text,
              'password': passwordController.text,
              'type_name': 'ผู้ใช้ทั่วไป',
            },
          );
          print(response);
          GotoHome();
          // Handle the response here as needed
        } else {
          // Handle case where either username or password is empty
          print('Username or password is empty.');
        }
      } catch (e) {
        // Handle exceptions that may occur during the request
        print('An error occurred during login: $e');

        // You can add specific error handling for different types of exceptions
        if (e is DioError) {
          if (e.response != null) {
            // Handle DioError with response (e.g., server returned an error)
            print('DioError with response: ${e.response}');
          } else {
            // Handle DioError without response (e.g., network issue)
            print('DioError without response');
          }
        } else {
          // Handle other types of exceptions
          print('Other exception occurred: $e');
        }
      }
    }
    GotoHome() {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return registeruserjib();
        },
      ),
      (_) => false,
    );
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
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
            Image.asset(
              'asset/images/petmatchlogo.png',
              height: 400,
              width: 500, // ปรับขนาดของโลโก้ตามต้องการ
            ),
            
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: 'ชื่อผู้ใช้งาน',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.white, // สีเส้นขอบ
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0), // สีเส้นขอบเมื่อไม่ได้รับการกด
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่ชื่อผู้ใช้งาน',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20.0), 
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.white, // สีเส้นขอบ
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0), // สีเส้นขอบเมื่อไม่ได้รับการกด
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255,239,83,80), // สีเส้นขอบเมื่อได้รับการกด
                    ),
                  ),
                  // Gradient ขอบของ TextField
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'ใส่รหัสผ่าน',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              

              TextButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: ((context) => registeruserjib()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
                },
                child: Text(
                  'เพิ่งเคยเข้ามาใน Pet Match ใช่หรือไม่? กดเพื่อสมัครสมาชิก',
                  style: TextStyle(
                    fontSize: 12,
                    color:Color.fromARGB(255,239,83,80),
                  ),
                ),
              ),

              SizedBox(height: 5.0), 
               ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255,239,83,80),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                onPressed: () {
                  Login();
                },
                child: Text('เข้าสู่ระบบ')
              ),
            ],
          ),
        ),
    ),
  );
  }
}
