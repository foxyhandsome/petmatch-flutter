import 'package:flutter/material.dart';

import '../widget/background_curve_widget.dart';
import '../widget/cards_stack_widget.dart';

class MainMacth extends StatefulWidget {
  const MainMacth({super.key});

  @override
  State<MainMacth> createState() => _MainMacthState();
}

class _MainMacthState extends State<MainMacth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: const [
            BackgroudCurveWidget(),
            CardsStackWidget(),
          ],
        ),
      ),
    );
  }
}
