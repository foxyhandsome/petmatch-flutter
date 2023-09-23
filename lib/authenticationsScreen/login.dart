import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
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
              )
              
      

            ],
          ),
        ),
      ),
    );
  }
}