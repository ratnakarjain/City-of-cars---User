import 'package:cityofcars/constants.dart';
import 'package:cityofcars/selectCity.dart';
import 'package:cityofcars/verification.dart';
import 'package:flutter/material.dart';

import 'myhomepage.dart';

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
      title: 'City of Cars',
      theme: ThemeData(
        primaryColor: korangecolor,
      ),
      home: const MyHomePage(),
    );
  }
}
