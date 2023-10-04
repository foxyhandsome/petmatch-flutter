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
      home: const ToggleButtonsSample(title: 'ToggleButtons Sample'),
    );
  }
}

class ToggleButtonsSample extends StatefulWidget {
  const ToggleButtonsSample({super.key, required this.title});

  final String title;

  @override
  State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
  final List<bool> _selectedFruits = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255,239,83,80),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('เพศ', style: theme.textTheme.titleSmall),
              const SizedBox(height: 5),
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

            ],
          ),       
      ),
    );
  }
}

