import 'package:cityofcars/Screens/glance.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Service Main/serviceMain.dart';
import 'bottomnavBar.dart';

class SelectFuel extends StatefulWidget {
  const SelectFuel({Key? key}) : super(key: key);

  @override
  State<SelectFuel> createState() => _SelectFuelState();
}

class _SelectFuelState extends State<SelectFuel> {
  ScrollController _controller = ScrollController();
  var h;
  var w;
  List fueltype = [
    {"image": "Diesel.png", "type": "Diesel"},
    {"image": "Petrol.png", "type": "Petrol"},
    {"image": "EV.png", "type": "EV"}
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        centerTitle: false,
        foregroundColor: kTextInputPlaceholderColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Fuel",
              textScaleFactor: 1.1,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => BottomNavBar(
                      index: 0,
                    ),
                  ),
                  (route) =>
                      false, //if you want to disable back feature set to false
                );
              },
              child: Text(
                "Skip & Explore".toUpperCase(),
                textScaleFactor: 0.6,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, color: kbluecolor),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(h*0.05),
          child: Container(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: h * 0.0,
          ),
          RRectCard(
            h: h * 0.12,
            w: h * 0.12,
            borderRadius: 30,
            color: kbluecolor,
            widget: RRectCard(
              h: h * 0.12,
              w: h * 0.12,
              borderRadius: 25,
              color: kLightOrangeBgColor,
              widget: Image.asset("assets/images/Kia_logo.png"),
            ),
          ),
          
          Container(
            width: w,
            decoration: BoxDecoration(
                color: kwhitecolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(h * 0.05),
                  topRight: Radius.circular(h * 0.05),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -5),
                      blurRadius: 5,
                      spreadRadius: 3,
                      color: kblackcolor.withOpacity(0.1))
                ]),
            child: Column(
              children: [
                Text(
                  "Selected Cars",
                  textScaleFactor: 1.1,
                  style: GoogleFonts.montserrat(
                      height: 2, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                RRectCard(
                  borderRadius: 30,
                  h: h * 0.12,
                  w: h * 0.12,
                  color: korangecolor,
                  widget: RRectCard(
                    borderRadius: 25,
                    h: h * 0.12,
                    w: h * 0.12,
                    widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(h*0.04),
                              child: Image.asset("assets/images/Uber1.png")),
                          )),
                          const SizedBox(
                            height: 5,
                          ),
                          FittedBox(
                            child: Text(
                              "Polo",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Container(
                  width: w,
                  height: h * 0.28,
                  decoration: BoxDecoration(
                      color: kwhitecolor,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 5,
                            color: kblackcolor.withOpacity(0.1))
                      ]),
                      margin: EdgeInsets.only(bottom: h*0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Fuel",
                        textScaleFactor: 1.1,
                        style: GoogleFonts.montserrat(
                            height: 2, fontWeight: FontWeight.w600),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        controller: _controller,
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 3,
                        children: List.generate(fueltype.length, (index) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Glance(),
                                    ));
                              },
                              child: RRectCard(
                                h: h * 0.12,
                                w: h * 0.12,
                                borderRadius: 30,
                                widget: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/${fueltype[index]["image"]}"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          "${fueltype[index]["type"]}",
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
