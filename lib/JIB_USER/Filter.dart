import 'package:flutter/material.dart';

/// Flutter code sample for [ToggleButtons].

const List<Widget> fruits = <Widget>[
  Text('เพศผู้'),
  Text('เพศเมีย'),
];

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const selectedGender(title: 'ToggleButtons Sample'),
    );
  }
}

class selectedGender extends StatefulWidget {
  const selectedGender({super.key, required this.title});

  final String title;

  @override
  State<selectedGender> createState() => _selectedGenderState();
}

class _selectedGenderState extends State<selectedGender> {
  final List<bool> _selectedFruits = <bool>[true, false];
  // String selectedBreed = '';

  // List<String> breeds = [
  //   'ปอมเมอเรเนียน (Pomeranian)',
  //   'ไซบีเรียน ฮัสกี (Siberian Husky)',
  //   'ปั๊ก (Pug)',
  //   'ชิวาวา (Chihuahua)',
  //   'ไทยบางแก้ว (Thai Bangkaew)',
  //   'เฟรนช์ บูลด็อก (French Bulldog)',
  //   'โกลเด้น รีทรีฟเวอร์ (Golden Retriever)',
  //   'ไทยหลังอาน (Thai Ridgeback)',
  //   'อเมริกัน บูลลี่ (American Bully)',
  //   'พิทบูล (Pitbull)',
  //   'ชิสุ (Shih Tzu)',
  //   'บีเกิล (Beagle)',
  //   'หมาไทย',
  //   'ลาบราดอร์รีทรีฟเวอร์ (Labrador Retriever)',
  //   'คอร์กี้ (Corgi)',
  //   'พุดเดิ้ล (Poodle)',
  //   'อิงลิช บูลล์ด็อก (English Bulldogs)',
  //   'แจ็ครัสเซลล์เทอร์เรีย (Jack Russell Terrier)',
  //   'ยอร์คเชียร์เทอร์เรีย (Yorkshire Terrier)',
  //   'ซามอยด์ (Samoyed)',
  // ];
 
  bool isSolidColor = false;
  bool isTwoTone = false;
  bool isThreeColor = false;
  bool isTuxedoPattern = false;
  bool isMerlePattern = false;
  bool isBlackAndTan = false;
  bool isSpotsPattern = false;
  bool isTigerPattern = false;
  bool isSableColor = false;
  bool isBrindleColor = false;


  var selectedRange = RangeValues(1, 10);

  get selectedGender => null;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
          "Filter",
          style: TextStyle(color: Color.fromARGB(255, 248, 248, 248)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                child: Text(
                  "เพศ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectedFruits.length; i++) {
                      _selectedFruits[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.red[700],
                selectedColor: Colors.white,
                fillColor: Colors.red[400],
                color: Colors.red[400],
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedFruits,
                children: fruits,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "อายุสัตว์เลี้ยง",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor:
                      Colors.red[400], // เปลี่ยนสีให้เป็นสีดำที่นี่
                ),
                child: RangeSlider(
                  values: selectedRange,
                  onChanged: (RangeValues age) {
                    setState(() => selectedRange = age);
                  },
                  min: 0,
                  max: 10,
                  divisions: 10,
                  labels: RangeLabels(
                    '${selectedRange.start}',
                    '${selectedRange.end}',
                  ),
                ),
              ),
              // Text(
              //   'เลือกพันธุ์สุนัข:',
              //   style: TextStyle(fontSize: 18),
              // ),
              // SizedBox(height: 20),
              // Column(
              //   children: [
              //     DropdownButton<String>(
              //       value: selectedBreed,
              //       onChanged: (String? newValue) {
              //         setState(() {
              //           selectedBreed = newValue!;
              //         });
              //       },
              //       items: breeds.map((String breed) {
              //         return DropdownMenuItem<String>(
              //           value: breed,
              //           child: Text(breed),
              //         );
              //       }).toList(),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20),
              // Text(
              //   'พันธุ์สุนัขที่คุณเลือก: $selectedBreed',
              //   style: TextStyle(fontSize: 18),
              // ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "สีขนสัตว์เลี้ยง",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

               CheckboxListTile(
              title: Text('สุนัขขนสีเดียวล้วน'),
              value: isSolidColor,
              onChanged: (newValue) {
                setState(() {
                  isSolidColor = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสองสี'),
              value: isTwoTone,
              onChanged: (newValue) {
                setState(() {
                  isTwoTone = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสามสี'),
              value: isThreeColor,
              onChanged: (newValue) {
                setState(() {
                  isThreeColor = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสีลายทักซิโด้'),
              value: isTuxedoPattern,
              onChanged: (newValue) {
                setState(() {
                  isTuxedoPattern = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสีลายหินอ่อน'),
              value: isMerlePattern,
              onChanged: (newValue) {
                setState(() {
                  isMerlePattern = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสีดำด่าง'),
              value: isBlackAndTan,
              onChanged: (newValue) {
                setState(() {
                  isBlackAndTan = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสีลายจุด'),
              value: isSpotsPattern,
              onChanged: (newValue) {
                setState(() {
                  isSpotsPattern = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสีลายเสือ'),
              value: isTigerPattern,
              onChanged: (newValue) {
                setState(() {
                  isTigerPattern = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสีซาเบิล'),
              value: isSableColor,
              onChanged: (newValue) {
                setState(() {
                  isSableColor = newValue!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('สุนัขขนสีอานม้า'),
              value: isBrindleColor,
              onChanged: (newValue) {
                setState(() {
                  isBrindleColor = newValue!;
                });
              },
            ),

            ],
          ),
        ),
      ),
    );
  }
}
