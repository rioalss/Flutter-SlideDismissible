import 'package:flutter/material.dart';
import 'package:swipe_dismiss/pages/home_page.dart';
// 
// ! Created By 
// ! Rio Alss
// 
// ? GitHub
// ? rioalss
// 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe Dismiss Feature',
      home: HomePage(),
    );
  }
}

