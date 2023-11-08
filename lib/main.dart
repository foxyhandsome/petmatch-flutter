import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';

import 'JIB_USER/pet_match.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Petmatch',
      home: Loginjib(),
    );
  }
}

enum Swipe { left, right, none }
