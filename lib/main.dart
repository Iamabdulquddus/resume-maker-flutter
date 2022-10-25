import 'package:flutter/material.dart';
import 'package:resumemaker/view/home/home.dart';
import 'package:resumemaker/view/welcome/welcome.dart';

import 'constants/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume Maker',
      theme: ThemeData(
        primarySwatch: Palette.myColors,
      ),
      home:  Home(),
    );
  }
}

