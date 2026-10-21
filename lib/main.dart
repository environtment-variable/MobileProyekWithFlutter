import 'package:flutter/material.dart';
import 'kalkulatorBMI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Kedua Flutter',
      home: KalkulatorBMI(),
    );
  }
}
