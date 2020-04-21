import 'package:flutter/material.dart';
import 'package:password_generator/constant.dart';
import 'package:password_generator/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.APP_NAME,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 136, 170),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}