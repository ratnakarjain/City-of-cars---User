import 'dart:async';

import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';

import 'bottomnavBar.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String id ="";
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    id = Prefernece.pref!.getString("userId").toString();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => BottomNavBar(
            index: 0,
          ),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
      //  id == "" || id == "null"
        //     ? const MyHomePage()
        //     : BottomNavBar(index: 0),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/Splash.png"),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
