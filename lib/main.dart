import 'package:flutter/material.dart';
import 'package:job_finder/pages/greeting_page.dart';
import 'package:job_finder/pages/main_page.dart';
import 'package:job_finder/pages/position_selecting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GreetingPage(),
    );
  }
}

