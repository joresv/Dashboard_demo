import 'package:dashboard_dark/config.dart';
import 'package:dashboard_dark/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        fontFamily: 'medium',
        // textTheme: ThemeData()
      ),
      home: Home(),
    );
  }
}
