import 'package:flutter/material.dart';
import 'package:petmatch/JIB_USER/allpet.dart';
import 'package:petmatch/JIB_USER/history.dart';
import 'package:petmatch/JIB_USER/home.dart';
import 'package:petmatch/JIB_USER/realuser.dart';
import 'package:petmatch/JIB_USER/reqmatch.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  List<Widget> _screens = [
    allpet(),
    home(),
    reqmatch(),
    history(),
    realuser(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'สัตว์เลี้ยงของฉัน',
            backgroundColor: Color.fromARGB(255, 239, 83, 80),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'จับคู่',
            backgroundColor: Color.fromARGB(255, 239, 83, 80),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_outlined),
            label: 'ข้อเสนอการจับคู่',
            backgroundColor: Color.fromARGB(255, 239, 83, 80),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'ประวัติการจับคู่',
            backgroundColor: Color.fromARGB(255, 239, 83, 80),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'ผู้ใช้',
            backgroundColor: Color.fromARGB(255, 239, 83, 80),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        onTap: _onItemTapped,
      ),
    );
  }
}