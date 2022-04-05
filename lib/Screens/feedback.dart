import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/Buttons/button.dart';
import '../Utils/constants.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  var h;
  var w;
  List topServices = [
    {
      "type": "Service Quality",
      "subtype": "pick-up and drop off",
    },
    {
      "type": "Expert Behaviour",
      "subtype": "The way we made you feel",
    },
    {
      "type": "On-Time",
      "subtype": "pick-up and drop off",
    },
    {
      "type": "Quality Spares",
      "subtype": "pick-up and drop off",
    },
  ];
  List isSelected = [];
  var _controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   generate();
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
          "Feedback",
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
            Container(
              color: kwhitecolor,
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.02, vertical: h * 0.01),
              margin: EdgeInsets.only(top: h * 0.02),
              child: Column(
                children: [
                  RichText(
                      text: TextSpan(
                          text: "DELIVERY DATE:",
                          style: GoogleFonts.montserrat(
                              fontSize: 8, color: kSelectedColor),
                          children: [
                        TextSpan(
                          text: " 27th Oct\n",
                          style: GoogleFonts.montserrat(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: kSelectedColor),
                        ),
                        TextSpan(
                          text: "BOOKING ID: ",
                          style: GoogleFonts.montserrat(
                              fontSize: 8, color: kSelectedColor),
                        ),
                        TextSpan(
                          text: "271292",
                          style: GoogleFonts.montserrat(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: kSelectedColor),
                        )
                      ])),
                  Image.asset(
                    "assets/images/Uber1.png",
                    height: h * 0.06,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "I20 ",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: kSelectedColor,
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                        TextSpan(
                          text: "Hyundai",
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kSelectedColor),
                        ),
                      ])),
                  Text(
                    "Rate your overall experience",
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w400, height: 3),
                  ),
                  Container(
                    height: h * 0.05,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          color: ksubHading,
                          size: h * 0.04,
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Text(
                        "What did you like the most about us?",
                        style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            height: 3),
                      )
                    ],
                  ),
                  GridView.count(
                    padding: EdgeInsets.symmetric(vertical: h * 0.03),
                    shrinkWrap: true,
                    controller: _controller,
                    crossAxisSpacing: w * 0.02,
                    mainAxisSpacing: h * 0.01,
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    children: List.generate(
                        topServices.length,
                        (index) => InkWell(
                              onTap: () {
                                generate();
                                isSelected[index] = !isSelected[index];
                                setState(() {});
                              },
                              child: RRectCard(
                                h: h * 0.06,
                                w: w * 0.45,
                                color: isSelected[index]
                                    ? kGreenColor
                                    : kLightOrangeBgColor,
                                widget: Center(
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: "${topServices[index]["type"]}\n",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: isSelected[index]
                                                ? kwhitecolor
                                                : kTextInputPlaceholderColor
                                                    .withOpacity(0.9),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "${topServices[index]["subtype"]}",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                  color: isSelected[index]
                                                      ? kwhitecolor
                                                      : kTextInputPlaceholderColor
                                                          .withOpacity(0.32)),
                                            ),
                                          ])),
                                ),
                                borderRadius: h * 0.05,
                              ),
                            )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.07),
              child: Text(
                "How can we improve?",
                style: GoogleFonts.montserrat(
                    fontSize: 13, fontWeight: FontWeight.w700, height: 3),
              ),
            ),
            Container(
              height: h * 0.13,
              width: w,
              margin: EdgeInsets.only(
                  top: h * 0.015, left: w * 0.03, right: w * 0.03),
              decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.circular(h * 0.025),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                        color: kTextInputPlaceholderColor.withOpacity(0.1))
                  ]),
              child: TextFormField(
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Optional",
                    hintStyle: GoogleFonts.montserrat(fontSize: 13),
                    contentPadding: EdgeInsets.all(h * 0.01)),
              ),
            ),
            Spacer(),
            Center(
              child: RRecctButton(
                h: h * 0.06,
                w: w * 0.9,
                buttonColor: kbluecolor,
                text: "SEND FEEDBACK",
                style: GoogleFonts.montserrat(
                    color: kwhitecolor, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            )
          ],
        ),
      ),
    );
  }
  generate(){
     isSelected = List.generate(topServices.length, (index) => false);
  }
}
