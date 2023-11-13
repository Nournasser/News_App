import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';

import 'bmi_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: bmi_screen(),
    );
  }

}