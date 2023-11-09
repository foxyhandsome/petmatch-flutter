import 'package:flutter/material.dart';

class ItemsMenu {
  String title;
  String subtitle;
  String event;
  String img;

  ItemsMenu(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ItemsMenu> itemList = [
    ItemsMenu(
      title: "Calendar",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "assets/calendar.png",
    ),
    ItemsMenu(
      title: "Notebook",
      subtitle: "Plain, A5 size",
      event: "1 Event",
      img: "assets/notebook.png",
    ),
    ItemsMenu(
      title: "Laptop",
      subtitle: "Brand XYZ",
      event: "No Events",
      img: "assets/laptop.png",
    ),
    ItemsMenu(
      title: "Coffee Mug",
      subtitle: "Blue, Ceramic",
      event: "2 Events",
      img: "assets/mug.png",
    ),
    ItemsMenu(
      title: "Headphones",
      subtitle: "Wireless, Noise-Canceling",
      event: "4 Events",
      img: "assets/headphones.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var color = 0xff453658;
    return SafeArea(
      child: Center(
        child: Flexible(
          child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: itemList.map((data) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 14,
                      ),
                      Text(data.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}
