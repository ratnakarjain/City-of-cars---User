import 'dart:async';

import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/Shapes/widgets.dart';
import '../Utils/constants.dart';

class Glance extends StatefulWidget {
  const Glance({Key? key}) : super(key: key);

  @override
  State<Glance> createState() => _GlanceState();
}

class _GlanceState extends State<Glance> {
  var h;

  var w;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => BottomNavBar(
            index: 0,
          ),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/right_mark.png")),
           SizedBox(
            height:h* 0.01,
          ),
          Text(
            "Congratulations",
            textScaleFactor: 1.2,
            style: GoogleFonts.montserrat(
              height: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
           SizedBox(
            height:h* 0.01,
          ),
          Text(
            "You have added a new car to your proflie",
            textScaleFactor: 1.2,
            style: GoogleFonts.montserrat(
              height: 1.5,
            ),
          ),
          SizedBox(
            height: h * 0.025,
          ),
          Container(
            height: h*0.15,
            width: w*0.9,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/bg2.png"
                ),
                fit: BoxFit.fitWidth
              )
            ),
            child: Center(
              child: RRectCard(
                h: h * 0.13,
                w: h * 0.13,
                borderRadius: 30,
                color: korangecolor,
                widget: RRectCard(
                  h: h * 0.12,
                  w: h * 0.12,
                  borderRadius: 25,
                  widget: Stack(
                    children: [
                      Center(child: Image.asset("assets/images/Uber1.png")),
                      Positioned(
                        right: w * 0.03,
                        top: h * 0.01,
                        child: Image.asset(
                          "assets/images/EV.png",
                          height: h * 0.03,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Polo ',
              style: GoogleFonts.montserrat(
                color: kTextInputPlaceholderColor,
                fontWeight: FontWeight.w700,
                height: 1.7,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Volkswagon',
                    style: GoogleFonts.montserrat(
                      color: kTextInputPlaceholderColor,
                      fontWeight: FontWeight.w400,
                      height: 1.7,
                    )),
                TextSpan(
                  text: ' EV',
                  style: GoogleFonts.montserrat(
                    color: kTextInputPlaceholderColor,
                    fontWeight: FontWeight.w700,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
