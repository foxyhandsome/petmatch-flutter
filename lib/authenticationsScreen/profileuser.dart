import 'package:flutter/material.dart';
import 'package:petmatch/authenticationsScreen/edituser.dart';

class profileuser extends StatefulWidget {
  @override
  _profileuserState createState() => _profileuserState();
}

class _profileuserState extends State<profileuser> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var linearGradient = LinearGradient(
            colors: [Color.fromARGB(255, 234, 64, 128), Color.fromARGB(255, 238, 128, 95)], // เลือกสีที่คุณต้องการ
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          );
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์เจ้าของสัตว์เลี้ยง'),
      ),

      body: Container(
            decoration: BoxDecoration(
            gradient: linearGradient,
        ),
        child: Center(
          child: Column(
            children:  [
              const SizedBox(
                height: 30,
              ),

            CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage('URL_TO_PROFILE_IMAGE'),
            ),
          
           SizedBox(height: 16.0),
            FloatingActionButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: ((context) => edituser()))); // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
              },
              backgroundColor: Color.fromARGB(255, 255, 255, 255), // สีพื้นหลังของปุ่ม
              child: Icon(Icons.edit),
              foregroundColor: Color.fromARGB(255, 167, 175, 187), // เปลี่ยนสีไอคอนเป็นสีแดง
            )
          ],
          ),
        ),
      ),
    );
  }
}
void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xffffdad9)),
      home: const BadgesDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BadgesDemo extends StatefulWidget {
  const BadgesDemo({super.key});

  @override
  State<BadgesDemo> createState() => _BadgesDemoState();
}

class _BadgesDemoState extends State<BadgesDemo> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Badges Demo"),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Badge(child: Icon(Icons.image)),
            icon: Badge(child: Icon(Icons.image_outlined)),
            label: 'Images',
          ),
          NavigationDestination(
            selectedIcon:
                Badge(child: Icon(Icons.access_time_filled), label: Text("10")),
            icon: Badge(child: Icon(Icons.access_time), label: Text("10")),
            label: 'Recent',
          ),
          NavigationDestination(
            selectedIcon:
                Badge(child: Icon(Icons.people_alt), label: Text("3")),
            icon:
                Badge(child: Icon(Icons.people_alt_outlined), label: Text("3")),
            label: 'Sharing',
          ),
          NavigationDestination(
            selectedIcon:
                Badge(label: Text("245+"), child: Icon(Icons.file_copy)),
            icon: Badge(
                child: Icon(Icons.file_copy_outlined), label: Text("245+")),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
