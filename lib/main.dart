import 'package:cityofcars/constants.dart';
import 'package:cityofcars/dash.dart';
import 'package:cityofcars/selectBrand.dart';
import 'package:cityofcars/selectFuel.dart';
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
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: korangecolor,
            ),),
      home: const Dash(
        
      ),
    );
  }
}
