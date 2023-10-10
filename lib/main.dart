import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/editprofileuser.dart';
import 'package:petmatch/JIB_USER/home.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:petmatch/JIB_USER/registeruserjib.dart';
import 'package:petmatch/authenticationsScreen/edituser.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';
import 'package:petmatch/JIB_USER/pecert.dart';
import 'package:petmatch/authenticationsScreen/petbreed.dart';
import 'package:petmatch/authenticationsScreen/regisuser_kaou.dart';
import 'package:petmatch/authenticationsScreen/regpet.dart';
import 'package:petmatch/authenticationsScreen/test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petmatch',


      home: loginjib(),
    );
  }
}


// class Login extends StatelessWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [Color.fromARGB(255, 238, 128, 95), Color.fromARGB(255, 240, 68, 125)])),


//      theme: ThemeData.dark()
//          .copyWith(scaffoldBackgroundColor: Color.fromARGB(255, 175, 122, 197)
//          ),
//     );
//   }
// }