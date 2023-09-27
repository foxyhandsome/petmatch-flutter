import 'package:flutter/material.dart';
import 'package:petmatch/authenticationsScreen/loginyo.dart';
import 'package:petmatch/authenticationsScreen/regisuser.dart';

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
      
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(230, 234, 64, 128)
      ),

      home: loginyo(),
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
//     );
//   }
// }