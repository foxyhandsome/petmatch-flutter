import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:petmatch/JIB_USER/Filter.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  get assets => null;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        title: Text(
          "             PET MATCH",
          style: TextStyle(color: Color.fromARGB(255, 248, 248, 248)),
        ),
        leading: IconButton(
          icon: Icon(Icons.search_rounded, color: Color.fromARGB(255, 245, 243, 243)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => Filter())));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(     
          child : Image.asset(
              'asset/images/dukdik.jpg',
              height: 600,
              width: 1000, // ปรับขนาดของโลโก้ตามต้องการ
            ),
      


            
        ),
      ),
    );
  }
}
