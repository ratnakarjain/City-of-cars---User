import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Buttons/button.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        foregroundColor: kblackcolor,
        title: Text(
          "Cart",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(h * 0.015),
                      bottomLeft: Radius.circular(h * 0.015))),
              margin: EdgeInsets.only(
                top: h * 0.018,
                left: w * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.06, vertical: h * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Statnderd",
                              textScaleFactor: 1.9,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Services Pack",
                              textScaleFactor: 0.8,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.6)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "₹ 2700",
                              textScaleFactor: 2,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Incl. Taxes",
                              textScaleFactor: 0.6,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.6)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.08, bottom: h * 0.01),
                    child: Text(
                      "Takes 4 Hrs / Every 3 Months",
                      textScaleFactor: 0.7,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: kTextInputPlaceholderColor.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: kLightOrangeBgColor,
                            padding: EdgeInsets.all(h * 0.005),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: h * 0.005),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/EngineOil.png",
                                        height: h * 0.03,
                                      ),
                                      Text(
                                        "Engine Oil",
                                        textScaleFactor: 0.7,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            color: kTextInputPlaceholderColor
                                                .withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: h * 0.005),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/oifilter.png",
                                        height: h * 0.03,
                                      ),
                                      Text(
                                        "Oil Filter",
                                        textScaleFactor: 0.7,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            color: kTextInputPlaceholderColor
                                                .withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: h * 0.005),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/wind.png",
                                        height: h * 0.03,
                                      ),
                                      Text(
                                        "Air Filter",
                                        textScaleFactor: 0.7,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            color: kTextInputPlaceholderColor
                                                .withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text("+9 more",
                                          textScaleFactor: 0.7,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Icon(Icons.arrow_forward_ios,
                                          size: h * 0.015),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: h * 0.02,
                            backgroundColor: kbluecolor,
                            foregroundColor: kwhitecolor,
                            child: FittedBox(child: Icon(Icons.delete)),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h * 0.02, left: w * 0.1),
              child: InkWell(
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
                child: CircleAvatar(
                  radius: h * 0.025,
                  backgroundColor: kblackcolor,
                  foregroundColor: kwhitecolor,
                  child: Icon(Icons.add),
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(h * 0.015),
                      bottomLeft: Radius.circular(h * 0.015))),
              margin: EdgeInsets.only(
                top: h * 0.018,
                left: w * 0.02,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: h * 0.02, horizontal: w * 0.06),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub-Total",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: ksubHading,
                            fontWeight: FontWeight.w700,
                          )),
                      Text("₹ 2500",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Taxes",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: ksubHading,
                            fontWeight: FontWeight.w700,
                          )),
                      Text("₹ 200",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("₹ 2700",
                              style: GoogleFonts.montserrat(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                              )),
                          Text("Incl. Taxes",
                              style: GoogleFonts.montserrat(
                                color: ksubHading,
                                fontSize: 6,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Center(
              child: RRecctButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Slot()));
                },
                buttonColor: korangecolor,
                text: "Proceed".toUpperCase(),
                h: h * 0.06,
                w: w * 0.9,
                style: GoogleFonts.montserrat(
                  color: kwhitecolor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
