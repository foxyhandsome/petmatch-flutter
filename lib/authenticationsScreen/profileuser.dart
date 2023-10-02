import 'package:flutter/material.dart';

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
