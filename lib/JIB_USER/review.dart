import 'package:flutter/material.dart';

class review extends StatefulWidget {
  const review({super.key});

  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "รีวิว",
          style: TextStyle(color: Color.fromARGB(255, 248, 248, 248)),
        ),
      ),
body: Align(
  alignment: Alignment.topCenter,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(height: 20.0),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Color.fromARGB(255, 239, 83, 80),
            width: 5.0,
          ),
        ),
        child: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              'https://images.wagwalkingweb.com/media/daily_wag/blog_articles/hero/1685787498.877709/fun-facts-about-siberian-huskies-1.png'),
        ),
      ),
          SizedBox(height: 16.0),
          Text( 'ชื่อสัตว์เลี้ยง: โบ้',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    SizedBox(width: 8.0),
        Icon(Icons.star, color: Colors.yellow),
        SizedBox(width: 8.0),
        Text(
          '4.5',
          style: TextStyle(fontSize: 18.0),
        ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ชื่อผู้ใช้งาน: Kaoukungza',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'น่ารักมากครับ',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
    
            ),
          ),
    ],
  ),
),
    );

      


  }
}
