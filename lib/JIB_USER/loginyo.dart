import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/authenticationsScreen/editdogtest.dart';
import 'package:petmatch/authenticationsScreen/regisuser.dart';

import '../constant/domain.dart';

class loginyo extends StatefulWidget {
  const loginyo({super.key});

  @override
  State<loginyo> createState() => _loginyoState();
}

class _loginyoState extends State<loginyo> {
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
          return editdogtest();
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
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "asset/images/logoji.png",
                width: 500,
              ),

               TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ชื่อผู้ใช้งาน'),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),
              

              SizedBox(height: 20.0), 
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('รหัสผ่าน'),
                   prefixIcon: Icon(Icons.lock),
                ),
              ),
              

              SizedBox(height: 20.0), 
               ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Login();
                },
                child: Text('เข้าสู่ระบบ')
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => regisuser())));
                },
                child: Text('สมัครสมาชิก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
