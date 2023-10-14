import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/loginjib.dart';

class realuser extends StatefulWidget {
  const realuser({super.key});

  @override
  State<realuser> createState() => _realuserState();
}

class _realuserState extends State<realuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 700.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 239, 83, 80),
              minimumSize: const Size.fromHeight(40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => loginjib())));
            },
            child: Text('ออกจากระบบ'),
          ),
        ),
      ),
    );
  }
}
