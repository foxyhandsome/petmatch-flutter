import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matcher/matcher.dart';
import 'package:petmatch/authenticationsScreen/regpet.dart';

class regisuser extends StatefulWidget {
  const regisuser({super.key});

  @override
  State<regisuser> createState() => _regisuserState();
}

class _regisuserState extends State<regisuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "สมัครสมาชิกเจ้าของสัตว์เลี้ยง",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children:  [
              const SizedBox(
                height: 30,
              ),

              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ชื่อผู้ใช้งาน'),
                  prefixIcon: Icon(Icons.person_2),
                ),
              ),

              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('รหัสผ่าน'),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('เบอร์โทรศัพท์'),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const Text (
                "ที่อยู่",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),

              DropdownButton(
                iconSize: 50.0,
                isExpanded: true,
                items: const [

                  DropdownMenuItem(child: Text("1"),value: "1",),
                  DropdownMenuItem(child: Text("2"),value: "2",),
                  DropdownMenuItem(child: Text("3"),value: "3",),
                  DropdownMenuItem(child: Text("4"),value: "4",),
                ], 
                  onChanged: (String? value) {  },
              ),
              
              // const TextField(
              //   style:
              //       TextStyle(color: Colors.black), // Set text color to black
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: ('ที่อยู่'),
              //     prefixIcon: Icon(Icons.home),
              //   ),
              // ),

              const TextField(
                style:
                    TextStyle(color: Colors.black), // Set text color to black
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ('ช่องทางการติดต่อออนไลน์'),
                  prefixIcon: Icon(Icons.chat),
                ),
              ),  

              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => regpet())));
                },
                child: Text('หน้าต่อไป'),
              ),   
            ],
          ),
        ),
      ),
    );
  }
}
