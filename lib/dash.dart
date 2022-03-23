import 'package:cityofcars/constants.dart';
import 'package:cityofcars/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  var h;
  var w;
  List carServices = [
    {
      "services": "Periodic Services",
      "image": "Uber1.png",
    },
    {
      "services": "Dent Paint Detailling",
      "image": "Uber2.png",
    },
    {
      "services": "Custom Services",
      "image": "Uber3.png",
    },
    {
      "services": "Tyres Batteries",
      "image": "Uber5.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        foregroundColor: kblackcolor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Greater Kailash",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
            ),
            Text(
              "Delhi",
              textScaleFactor: 0.6,
              style: GoogleFonts.montserrat(),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Expanded(flex: 2, child: Container()),
            Expanded(
                flex: 6,
                child: Container(
                  color: kLightOrangeBgColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: h*0.5,
                        child: GridView.count(
                          padding: EdgeInsets.all(h * 0.01),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: List.generate(carServices.length, (index) {
                            return RRectCard(
                                h: h * 0.18,
                                w: h * 0.18,
                                istext: true,
                                text: carServices[index]["services"],
                                color: kLightOrangeBgColor,
                                textStyle: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                )),
                                image:
                                    "assets/images/${carServices[index]["image"]}");
                          }),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: h*0.02),
                        child: Text(
                          "Recent",
                          textScaleFactor: 1.2,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kGreenColor)),
                        ),
                      ),
                      Container(
                        height: h*0.2,
                        child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(h * 0.01),
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: List.generate(carServices.length, (index) {
                            return RRectCard(
                                h: h * 0.18,
                                w: w * 0.18,
                                istext: true,
                                text: carServices[index]["services"],
                                color: kLightOrangeBgColor,
                                textStyle: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                )),
                                image:
                                    "assets/images/${carServices[index]["image"]}");
                          }),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
