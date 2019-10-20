import 'package:app_nasa/screens/lista_cidade.dart';
import 'package:app_nasa/screens/screen_instruction_one.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: IntroOnePage(),
    );
  }
}
