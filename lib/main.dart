


import 'package:flutter/material.dart';
import 'package:calculador/desktop.dart';
import 'package:calculador/phone.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: CambioPantallas(),
    );
  }
}

class CambioPantallas extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 750 ? const Phone() : const Desktop();
  }
}

