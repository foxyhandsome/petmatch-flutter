import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/addpet.dart';
import 'package:petmatch/JIB_USER/profileuser.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/profileuser2.dart';

class allpet extends StatefulWidget {
  const allpet({super.key});

  @override
  State<allpet> createState() => _allpetState();
}

class _allpetState extends State<allpet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        elevation: 0,
        title: Text(
          "โปรไฟล์",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => addpet())));
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color:
              Color.fromARGB(255, 255, 255, 255), // Set your desired color here
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(
                        255, 239, 83, 80), // Set the border color
                    width: 5.0, // Set the border width
                  ),
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://images.wagwalkingweb.com/media/daily_wag/blog_articles/hero/1685787498.877709/fun-facts-about-siberian-huskies-1.png'),
                ),
              ),
              SizedBox(height: 10.0),
              Text("โบ้",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )),
              SizedBox(height: 0.0),
              Container(
                width: 120, // ปรับความยาวตามที่ต้องการ
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 83, 80),
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => profileuser())));
                  },
                  child: Text('เข้าสู่โปรไฟล์'),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(
                        255, 239, 83, 80), // Set the border color
                    width: 5.0, // Set the border width
                  ),
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://www.animalsaroundtheglobe.com/wp-content/uploads/2023/02/corgi-ga0a9055f1_1920-1200x800.jpg'),
                ),
              ),
              SizedBox(height: 10.0),
              Text("บี้",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )),
              SizedBox(height: 0.0),
              Container(
                width: 120, // ปรับความยาวตามที่ต้องการ
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 83, 80),
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => profileuser2())));
                  },
                  child: Text('เข้าสู่โปรไฟล์'),
                ),
              )
            ],
          ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => addpet())));
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color:
              Color.fromARGB(255, 255, 255, 255), // Set your desired color here
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(
                        255, 239, 83, 80), // Set the border color
                    width: 5.0, // Set the border width
                  ),
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://images.wagwalkingweb.com/media/daily_wag/blog_articles/hero/1685787498.877709/fun-facts-about-siberian-huskies-1.png'),
                ),
              ),
              SizedBox(height: 10.0),
              Text("โบ้",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )),
              SizedBox(height: 0.0),

              Container(
                width: 120, // ปรับความยาวตามที่ต้องการ
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 83, 80),
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => profileuser())));
                  },
                  child: Text('เข้าสู่โปรไฟล์'),
                ),
              ),
              SizedBox(height: 20.0),

              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(
                        255, 239, 83, 80), // Set the border color
                    width: 5.0, // Set the border width
                  ),
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://www.animalsaroundtheglobe.com/wp-content/uploads/2023/02/corgi-ga0a9055f1_1920-1200x800.jpg'),
                ),
              ),
              SizedBox(height: 10.0),
              Text("บี้",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )),
              SizedBox(height: 0.0),

              Container(
                width: 120, // ปรับความยาวตามที่ต้องการ
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 239, 83, 80),
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => profileuser2())));
                  },
                  child: Text('เข้าสู่โปรไฟล์'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
