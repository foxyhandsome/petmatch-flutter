import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:petmatch/JIB_USER/Filter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get assets => null;

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 239, 83, 80),
        title: Text(
          "PET MATCH",
          style: TextStyle(color: Color.fromARGB(255, 248, 248, 248)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.search_rounded,
              color: Color.fromARGB(255, 245, 243, 243)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => Filter()),
              ),
            );
          },
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Image.asset(
                'asset/images/dukdik.jpg',
                height: 600,
                width: 1000,
              ),
              Positioned(
                top: 375, // Adjust the top position as needed
                left: 20, // Adjust the left position as needed
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'น้องดุกดิก',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253), // Text color
                      fontSize: 35, // Text size
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450, // Adjust the top position as needed
                left: 20, // Adjust the left position as needed
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 83, 80)
                        .withOpacity(0.5), // Background color and opacity
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'อายุ 2 ปี',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253), // Text color
                      fontSize: 20, // Text size
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450, // Adjust the top position as needed
                left: 120, // Adjust the left position as needed
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 83, 80)
                        .withOpacity(0.5), // Background color and opacity
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'ชิสุ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253), // Text color
                      fontSize: 20, // Text size
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450, // Adjust the top position as needed
                left: 175, // Adjust the left position as needed
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 83, 80)
                        .withOpacity(0.5), // Background color and opacity
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'สุขัขขนสองสี',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253), // Text color
                      fontSize: 20, // Text size
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450, // Adjust the top position as needed
                left: 315, // Adjust the left position as needed
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 83, 80)
                        .withOpacity(0.5), // Background color and opacity
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'DEA 1.1',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253), // Text color
                      fontSize: 20, // Text size
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 500, // Adjust the top position as needed
                left: 20, // Adjust the left position as needed
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 239, 83, 80)
                        .withOpacity(0.5), // Background color and opacity
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on, // Add your desired icon
                        color: Colors.white, // Icon color
                        size: 24, // Icon size
                      ),
                      SizedBox(
                          width: 8), // Add spacing between the icon and text
                      Text(
                        'รองเมือง, ปทุมวัน',
                        style: TextStyle(
                          color:
                              Color.fromARGB(255, 253, 253, 253), // Text color
                          fontSize: 20, // Text size
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 610, 100, 0),
                child: Container(
                  width: 70, // Adjust the width to make it a circle
                  height: 70, // Make the width and height the same for a circular shape
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        Color.fromARGB(255, 241, 250, 250), // Background color of the circular button
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      // Action when the button is clicked
                    },
                    child: Icon(
                      Icons.arrow_back, // Replace this with the icon you want
                      color: Color.fromARGB(255, 239, 83, 80),
                      size: 30, // Adjust the icon size
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(130, 610, 110, 0),
                child: Container(
                  width: 70, // Adjust the width to make it a circle
                  height: 70, // Make the width and height the same for a circular shape
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        Color.fromARGB(255, 255, 0, 0), // Background color of the circular button
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      // Action when the button is clicked
                    },
                    child: Icon(
                      Icons.cancel_outlined, // Replace this with the icon you want
                      color: Color.fromARGB(255, 253, 253, 253),
                      size: 50, // Adjust the icon size
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(220, 610, 110, 0),
                child: Container(
                  width: 70, // Adjust the width to make it a circle
                  height: 70, // Make the width and height the same for a circular shape
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        Color.fromARGB(255, 30, 255, 0), // Background color of the circular button
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      // Action when the button is clicked
                    },
                    child: Icon(
                      Icons.check, // Replace this with the icon you want
                      color: Color.fromARGB(255, 253, 253, 253),
                      size: 50, // Adjust the icon size
                    ),
                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.fromLTRB(350, 610, 0, 0),
                child: Container(
                  width: 70, // Adjust the width to make it a circle
                  height: 70, // Make the width and height the same for a circular shape
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        Color.fromARGB(255, 255, 255, 255), // Background color of the circular button
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      // Action when the button is clicked
                    },
                    child: Icon(
                      Icons.arrow_forward, // Replace this with the icon you want
                      color: Color.fromARGB(255, 239, 83, 80),
                      size: 30, // Adjust the icon size
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
