import 'package:flutter/material.dart';
import 'kartunama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Pertama Flutter',
      home: KartuNama(),
    );
  }
}
