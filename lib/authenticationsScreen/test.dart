import 'package:flutter/material.dart';


class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              DropdownButton(
                iconSize: 50.0,
                items: const [

                  DropdownMenuItem(child: Text("11"),value: "1",),
                  DropdownMenuItem(child: Text("2"),value: "2",),
                  DropdownMenuItem(child: Text("3"),value: "3",),
                  DropdownMenuItem(child: Text("4"),value: "4",),
                ], 
                  onChanged: (String? value) {  },
              )
            ],
          ),
        ),
      ),
    );
  }
}