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
          scrollbarTheme: ScrollbarThemeData(
              isAlwaysShown: true,
              thickness: MaterialStateProperty.all(7),
              thumbColor: MaterialStateProperty.all(
                Colors.white.withOpacity(.6),
              ),
              radius: const Radius.circular(10),
              minThumbLength: 100)
          // textTheme: ThemeData()
          ),
      home: Home(),
    );
  }
}
