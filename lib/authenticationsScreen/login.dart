import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final fromkey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  bool obscurePass = true;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: fromkey,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),

              Image.asset(
                "asset/images/logoji.png",
                width: 500,
              ),

              // const Text (
              //   "PET MATCH",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold
              //   ),
              // )

              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: Text('เข้าสู่ระบบ'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: Text('สมัครสมาชิก'),
              )

            ],
          ),
        ),
      ),
    );
  }
}
