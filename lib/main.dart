
import 'package:cityofcars/Screens/Service%20Main/insidCategory.dart';
import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:flutter/material.dart';

import 'Screens/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get korangecolor => null;

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
      home: const Slot(
        
      ),
    );
  }
}
