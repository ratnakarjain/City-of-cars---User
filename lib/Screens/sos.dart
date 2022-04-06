import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/Buttons/button.dart';
import '../Utils/constants.dart';

class Sos extends StatefulWidget {
  const Sos({Key? key}) : super(key: key);

  @override
  State<Sos> createState() => _SosState();
}

class _SosState extends State<Sos> {
  var h;
  var w;
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "SOS / Not Sure?",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: h * 0.03,
                bottom: h * 0.02,
                left: w * 0.06,
              ),
              child: Text(
                "Describe your problem?",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 2,
                ),
              ),
            ),
            Container(
              width: w,
              decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        h * 0.05,
                      ),
                      bottomLeft: Radius.circular(h * 0.05)),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5, offset: Offset(0, 3), color: Colors.grey)
                  ]),
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.15, vertical: h * 0.06),
              child: Column(
                children: [
                  Text(
                    "This pack is essential every 3000 kms or 6 months whichever is earlier",
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 2,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Text(
                    "This pack is essential every 3000 kms or 6 months whichever is earlier",
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 2,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Text(
                    "This pack is essential every 3000 kms or 6 months whichever is earlier",
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.06, vertical: h * 0.03),
              child: Material(
                color: kwhitecolor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(h * 0.06)),
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: w * 0.09),
                      hintText: "Mobile No.*",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 2,
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
            Center(
              child: RRecctButton(
                h: h * 0.06,
                w: w * 0.88,
                buttonColor: korangecolor,
                text: "CONFIRM REQUEST",
                style: GoogleFonts.montserrat(
                    color: kwhitecolor, fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Text(
                "We will respond you as soon as possible!",
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 2,
                ),
              ),
            ),
            Center(
              child: Text(
                "or",
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/call.png",height: h*0.03,),
                RichText(
                  text: TextSpan(
                      text: "Call us ",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kbluecolor,
                        height: 2,
                      ),
                      children: [
                        TextSpan(
                          text: "at",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: kTextInputPlaceholderColor,
                            height: 2,
                          ),
                        ),
                        TextSpan(
                          text: " 99999",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kbluecolor,
                            height: 2,
                          ),
                        ),
                        TextSpan(
                          text: "55555",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kGreenColor,
                            height: 2,
                          ),
                        ),
                        TextSpan(
                          text: "?",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kTextInputPlaceholderColor,
                            height: 2,
                          ),
                        ),
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}