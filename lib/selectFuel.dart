import 'package:cityofcars/constants.dart';
import 'package:cityofcars/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectFuel extends StatefulWidget {
  const SelectFuel({Key? key}) : super(key: key);

  @override
  State<SelectFuel> createState() => _SelectFuelState();
}

class _SelectFuelState extends State<SelectFuel> {
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
      appBar: AppBar(
        title: Text(
          "Select Fuel",
          textScaleFactor: 1.1,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(h * 0.08),
          child: Container(),
        ),
        foregroundColor: kblackcolor,
        backgroundColor: kTransparent,
        elevation: 0,
      ),
      body: Container(
        height: h,
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
              "Select Cars",
              textScaleFactor: 1.1,
              style: GoogleFonts.montserrat(
                  height: 2, fontWeight: FontWeight.w600),
            ),
            Text(
              "269 shots",
              textScaleFactor: 0.8,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                height: 1.5,
                color: kblackcolor.withOpacity(0.6),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            RRectCard(
              h: h * 0.12,
              w: h * 0.12,
              istext: true,
              image: "assets/images/Uber1.png",
              text: "Polo",
              textStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: h * 0.04,
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
              child: Column(
                children: [
                  Text(
                    "Fuel",
                    textScaleFactor: 1.1,
                    style: GoogleFonts.montserrat(
                        height: 2, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                      children: List.generate(fueltype.length, (index) {
                        return Center(
                          child: RRectCard(
                            h: h * 0.12,
                            w: h * 0.12,
                            istext: true,
                            image: "assets/images/${fueltype[index]['image']}",
                            text: fueltype[index]["type"],
                            textStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
