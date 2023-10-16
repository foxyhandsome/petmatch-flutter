import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/history.dart';
import 'package:petmatch/JIB_USER/home.dart';
import 'package:petmatch/JIB_USER/realuser.dart';

class reqmatch extends StatefulWidget {
  const reqmatch({super.key});

  @override
  State<reqmatch> createState() => _reqmatchState();
}

class _reqmatchState extends State<reqmatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        title: Text(
          "ข้อเสนอการจับคู่",
          style: TextStyle(color: Color.fromARGB(255, 248, 248, 248)),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromARGB(255, 239, 83, 80),
                          width: 5.0,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            'https://images.wagwalkingweb.com/media/daily_wag/blog_articles/hero/1685787498.877709/fun-facts-about-siberian-huskies-1.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "ข้อมูลสัตว์เลี้ยง",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "น้องโกโก้",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            "เพศผู้, ไซบีเรียน ฮัสกี้ ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const Text(
                            " สุนักขนสองสี , กรุ้ปเลือด DEA 1.1 ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const Text(
                            " ชื่อผู้ใช้งาน   kaou",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                           const Text(
                            " เบอร์โทร   0950018558",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                           const Text(
                            " แนะนำเพิ่มเติม   Line: kaouk9",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // ทำอะไรสักอย่างเมื่อคลิกที่ปุ่มดูข้อมูล
                            },
                            icon: Icon(Icons.check_outlined, color: Color.fromARGB(255, 255, 255, 255)),
                            label: Text('ยอมรับ'),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 67, 212, 62),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // ทำอะไรสักอย่างเมื่อคลิกที่ปุ่มดูรีวิว
                            },
                            icon: Icon(Icons.cancel_outlined , color: Color.fromARGB(255, 255, 255, 255)),
                            label: Text('ปฐิเสธ'),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 0, 0),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
