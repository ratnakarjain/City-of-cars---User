import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'orderSuccessfull.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        elevation: 0,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "Payment",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            RRectCard(
              h: h * 0.1,
              color: kwhitecolor,
              shadowColor: kTextInputPlaceholderColor.withOpacity(0.1),
              w: w,
              widget: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Standard",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kTextInputPlaceholderColor),
                        ),
                        Text(
                          "Takes 4 Hrs / Every 3 months",
                          style: GoogleFonts.montserrat(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹2700",
                          style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: kTextInputPlaceholderColor),
                        ),
                        Text(
                          "Incl. Taxes",
                          style: GoogleFonts.montserrat(
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              borderRadius: h * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.01),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: RRectCard(
                      h: h * 0.12,
                      w: w,
                      widget: Padding(
                        padding: EdgeInsets.only(left: w * 0.05),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: "Name",
                                style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    height: 2,
                                    fontWeight: FontWeight.w700,
                                    color: ksubHading),
                                children: [
                                  TextSpan(
                                      text: "- Rodriques",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          height: 2,
                                          color: ksubHading)),
                                ],
                              )),
                              RichText(
                                  text: TextSpan(
                                text: "Contact",
                                style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    height: 2,
                                    fontWeight: FontWeight.w700,
                                    color: ksubHading),
                                children: [
                                  TextSpan(
                                      text: " - 9987823427",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 11,
                                          height: 2,
                                          fontWeight: FontWeight.w500,
                                          color: ksubHading)),
                                ],
                              )),
                              RichText(
                                  text: TextSpan(
                                text: "Car",
                                style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    height: 2,
                                    fontWeight: FontWeight.w700,
                                    color: ksubHading),
                                children: [
                                  TextSpan(
                                      text: " - Hyundai i20",
                                      style: GoogleFonts.montserrat(
                                          height: 2,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: ksubHading)),
                                ],
                              )),
                            ]),
                      ),
                      borderRadius: h * 0.02,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: RRectCard(
                      h: h * 0.12,
                      w: w,
                      widget: Padding(
                        padding: EdgeInsets.only(left: w * 0.05),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: "Delivery Date",
                                style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: ksubHading),
                                children: [
                                  TextSpan(
                                      text: " - 27th Oct",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: ksubHading)),
                                ],
                              )),
                              RichText(
                                  text: TextSpan(
                                text: "Address",
                                style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    height: 2,
                                    fontWeight: FontWeight.w700,
                                    color: ksubHading),
                                children: [
                                  TextSpan(
                                      text: " - 2007",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 11,
                                          height: 2,
                                          fontWeight: FontWeight.w500,
                                          color: ksubHading)),
                                ],
                              )),
                              RichText(
                                  text: TextSpan(
                                text: "Email",
                                style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    height: 2,
                                    fontWeight: FontWeight.w700,
                                    color: ksubHading),
                                children: [
                                  TextSpan(
                                      text: " - cityofcars.in",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 11,
                                          height: 2,
                                          fontWeight: FontWeight.w500,
                                          color: ksubHading)),
                                ],
                              )),
                            ]),
                      ),
                      borderRadius: h * 0.02,
                    ),
                  )
                ],
              ),
            ),
            RRectCard(
              h: h * 0.1,
              w: w,
              widget: Padding(
                padding: EdgeInsets.only(left: w * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Address",
                      style: GoogleFonts.montserrat(
                          fontSize: 11,
                          height: 2,
                          fontWeight: FontWeight.w700,
                          color: ksubHading),
                      children: [
                        TextSpan(
                            text:
                                " - B-155, Model Town - 3, \nDelhi - 111009 \nNear R. N. Jewellers",
                            style: GoogleFonts.montserrat(
                                fontSize: 11,
                                height: 2,
                                fontWeight: FontWeight.w500,
                                color: ksubHading)),
                      ],
                    )),
                  ],
                ),
              ),
              borderRadius: h * 0.02,
            ),
            RRectCard(
              h: h * 0.1,
              w: w,
              widget: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05, vertical: h * 0.01),
                child: RichText(
                    text: TextSpan(
                  text: "Special Remark / Additional Jobs",
                  style: GoogleFonts.montserrat(
                      fontSize: 11,
                      height: 2,
                      fontWeight: FontWeight.w700,
                      color: ksubHading),
                  children: [
                    TextSpan(
                        text: "",
                        style: GoogleFonts.montserrat(
                            fontSize: 11,
                            height: 2,
                            fontWeight: FontWeight.w500,
                            color: ksubHading)),
                  ],
                )),
              ),
              borderRadius: h * 0.02,
            ),
            SizedBox(
              height: h * 0.1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: RRecctButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderSuccessful(),
                      ));
                },
                text: "Pay now".toUpperCase(),
                h: h * 0.07,
                buttonColor: kbluecolor,
                style: GoogleFonts.montserrat(
                    color: kwhitecolor, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: RRecctButton(
                onTap: (){
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>  BottomNavBar(index: 0,),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                },
                text: "PAY ON DROP-OFF".toUpperCase(),
                h: h * 0.07,
                buttonColor: korangecolor,
                style: GoogleFonts.montserrat(
                    color: kwhitecolor, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
