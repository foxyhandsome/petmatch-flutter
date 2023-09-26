import 'dart:html';

import 'package:flutter/material.dart';

class loginyo extends StatefulWidget {
  const loginyo({super.key});

  @override
  State<loginyo> createState() => _loginyoState();
}

class _loginyoState extends State<loginyo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "asset/images/profile.png",
                width: 500,
              ),
            ],
          ),
        ),
      ),
    );
      
  }
}