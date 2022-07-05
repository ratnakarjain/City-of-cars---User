import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/constants.dart';
import '../Utils/preference.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  var h;
  var w;
  var des;
  @override
  void initState() {
    super.initState();
    des = Prefernece.pref!.getString("us")??"";
  }
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
          "Terms",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: h * 0.01,
              ),
              padding: EdgeInsets.all(h * 0.03),
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
              child: RichText(
                text: TextSpan(
                  // text: 'Who May Use the Services?',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text:
                      des.toString(),
                          // '\n\n\nWhen one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.\n\n',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            RRecctButton(
              h: h * 0.06,
              w: w * 0.9,
              buttonColor: kbluecolor,
              text: "CONTINUE",
              style: GoogleFonts.montserrat(
                  color: kwhitecolor, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
