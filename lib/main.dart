import 'package:calculator_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        backgroundColor: const Color(0xFFe4e7e8)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
