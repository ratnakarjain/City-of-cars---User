import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSuccessful extends StatefulWidget {
  const OrderSuccessful({Key? key}) : super(key: key);

  @override
  State<OrderSuccessful> createState() => _OrderSuccessfulState();
}

class _OrderSuccessfulState extends State<OrderSuccessful> {
  var h;
  var w;
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kwhitecolor,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        title: Text(
          "Order Successful",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Container(
              height: h * 0.4,
              width: w,
              decoration: BoxDecoration(
                color: kwhitecolor,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bg1.png",
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "BOOKING ID:",
                        style: GoogleFonts.montserrat(
                            color: kTextInputPlaceholderColor, fontSize: 8),
                        children: [
                          TextSpan(
                            text: " 271292\n",
                            style: GoogleFonts.montserrat(
                                color: kTextInputPlaceholderColor,
                                fontSize: 8,
                                fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: "Congratulations!\n",
                            style: GoogleFonts.montserrat(
                                height: 2,
                                color: kTextInputPlaceholderColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: "Your order has been successfully placed!",
                            style: GoogleFonts.montserrat(
                                color: kTextInputPlaceholderColor,
                                height: 2,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Rate your experience",
                  //       style: GoogleFonts.montserrat(
                  //               color: kTextInputPlaceholderColor,

                  //               fontSize: 13,
                  //               fontWeight: FontWeight.w400),
                  //     ),
                  //     Row(
                  //       children: List.generate(5, (index) => const Icon(Icons.star,color: kDateCircleColor,size: 14)),
                  //     )

                  //   ],
                  // )
                ],
              ),
            ),
            Container(
              color: kLightOrangeBgColor,
              padding: EdgeInsets.all(h * 0.02),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: "Confirmation will be sent on your mail\n",
                    style: GoogleFonts.montserrat(
                        color: kTextInputPlaceholderColor, fontSize: 13),
                    children: [
                      TextSpan(
                        text: "Pick-up from Ujjwal Verma",
                        style: GoogleFonts.montserrat(
                            color: kbluecolor,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: ", C7/3A, Model Town - 3, Delhi - 110009\n",
                        style: GoogleFonts.montserrat(
                            height: 2,
                            color: kTextInputPlaceholderColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: "Tomorrow, 1PM - 5PM\n",
                        style: GoogleFonts.montserrat(
                            color: kGreenColor,
                            height: 2,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: "pick-up date",
                        style: GoogleFonts.montserrat(
                            color: kTextInputPlaceholderColor,
                            height: 1.5,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: h * 0.02),
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.03, vertical: h * 0.01),
              decoration: BoxDecoration(color: kwhitecolor, boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(0, 2),
                    color: kTextInputPlaceholderColor.withOpacity(0.1)),
              ]),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        RRectCard(
                            h: h * 0.07,
                            w: w * 0.2,
                            color: kbluecolor,
                            borderRadius: h * 0.03,
                            widget: RRectCard(
                                h: h * 0.1,
                                w: w * 0.3,
                                borderRadius: h * 0.025,
                                widget: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(h * 0.05),
                                    child: Padding(
                                      padding: EdgeInsets.all(h * 0.01),
                                      child: Image.asset(
                                        "assets/images/Uber1.png",
                                      ),
                                    )))),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Polo",
                              style: GoogleFonts.montserrat(
                                  color: kTextInputPlaceholderColor,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  fontSize: 8),
                              children: [
                                TextSpan(
                                  text: " Volkswagon\n",
                                  style: GoogleFonts.montserrat(
                                      color: kTextInputPlaceholderColor,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                      fontSize: 8),
                                ),
                                TextSpan(
                                  text: " dl9car".toUpperCase(),
                                  style: GoogleFonts.montserrat(
                                      color: kTextInputPlaceholderColor,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                      fontSize: 6),
                                ),
                                TextSpan(
                                  text: " 9733",
                                  style: GoogleFonts.montserrat(
                                      color: kTextInputPlaceholderColor,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                      fontSize: 6),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "Delivery Date",
                                  style: GoogleFonts.montserrat(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                      fontSize: 9),
                                  children: [
                                    TextSpan(
                                      text: "  - 27th Oct",
                                      style: GoogleFonts.montserrat(
                                          color: kTextInputPlaceholderColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          fontSize: 9),
                                    ),
                                  ]),
                            ),
                            RRecctButton(
                              text: "In-Progress",
                              h: h * 0.03,
                              w: w * 0.3,
                              style: GoogleFonts.montserrat(
                                  color: kwhitecolor,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  fontSize: 9),
                              buttonColor: korangecolor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: h*0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "Standard\n",
                                  style: GoogleFonts.montserrat(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                      fontSize: 7),
                                  children: [
                                    TextSpan(
                                      text: "Service Pack",
                                      style: GoogleFonts.montserrat(
                                          color: kTextInputPlaceholderColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          fontSize: 5),
                                    ),
                                  ]),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "Clutch Overhaul\n",
                                  style: GoogleFonts.montserrat(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                      fontSize: 7),
                                  children: [
                                    TextSpan(
                                      text: "Service Pack",
                                      style: GoogleFonts.montserrat(
                                          color: kTextInputPlaceholderColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          fontSize: 5),
                                    ),
                                  ]),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "Custom Service\n",
                                  style: GoogleFonts.montserrat(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                      fontSize: 7),
                                  children: [
                                    TextSpan(
                                      text: "Bumper Repair",
                                      style: GoogleFonts.montserrat(
                                          color: kTextInputPlaceholderColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          fontSize: 5),
                                    ),
                                  ]),
                            ),
                            SizedBox(),
                            SizedBox(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h*0.03,
            ),
            RRecctButton(
              text: "CONTINUE SHOPPING",
              h: h * 0.06,
              w: w * 0.8,
              style: GoogleFonts.montserrat(
                  color: kwhitecolor,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                  fontSize: 12),
              buttonColor: kbluecolor,
            ),
            RRecctButton(
              text: "Track your order here",
              h: h * 0.06,
              w: w * 0.8,
              style: GoogleFonts.montserrat(
                  color: kTextInputPlaceholderColor,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  fontSize: 12),
              buttonColor: kTransparent,
            )
          ],
        ),
      ),
    );
  }
}
