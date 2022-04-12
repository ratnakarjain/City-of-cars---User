import 'dart:math';

import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarHealth extends StatefulWidget {
  const CarHealth({Key? key}) : super(key: key);

  @override
  State<CarHealth> createState() => _CarHealthState();
}

class _CarHealthState extends State<CarHealth> {
  var h;
  var w;
  List numbers = [
    {
      "Name": "Total Services",
      "Value": "17",
    },
    {
      "Name": "Money Saved",
      "Value": "157k",
    },
    {
      "Name": "Total Services",
      "Value": "17",
    },
    {
      "Name": "Money Saved",
      "Value": "157k",
    },
  ];
  List details = [
    {
      
    }
  ];
  List color = [
    carhealthColor1,
    carhealthColor2,
    carhealthColor3,
    carhealthColor4,
  ];
  bool extend = false;
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    int item =33;
    var currentColor ;
    int currentN;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        title: Text(
          "Car Health",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: h*0.89 + (extend? ( h*0.08*(item-3)):0),
          width: w,
          child: Stack(
            children: [
              Container(
                width: w,
                margin: EdgeInsets.only(top: h * 0.02, bottom: h * 0.05),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(h * 0.07)),
                    color: kTextInputPlaceholderColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.18),
                      child: Text(
                        "Numbers",
                        style: GoogleFonts.montserrat(
                            fontSize: 21,
                            color: kwhitecolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      height: h * 0.15,
                      child: ListView.builder(
                          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          //     childAspectRatio: 2 / 2.4,
                          //     maxCrossAxisExtent: w * 0.4),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          controller: _controller1,
                          itemCount: numbers.length,
                          padding: EdgeInsets.only(left: w * 0.15),
                          itemBuilder: (context, index) {
                            return RRectCard(
                              shadowColor: kTransparent,
                              color: kwhitecolor.withOpacity(0.1),
                              widget: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      numbers[index]["Value"],
                                      style: GoogleFonts.montserrat(
                                          fontSize: 44,
                                          color: kwhitecolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      numbers[index]["Name"],
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          color: kwhitecolor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              borderRadius: h * 0.03,
                            );
                          }),
                    ),
                    SizedBox(
                      height: h * 0.1,
                    )
                  ],
                ),
              ),
              Container(
                width: w,
                margin: EdgeInsets.only(top: h * 0.02, bottom: h * 0.36),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(h * 0.07)),
                  color: kredcolor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: h * 0.28,
                      width: w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/clip.png",
                              ),
                              fit: BoxFit.fill)),
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.13, vertical: h * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "I20 ",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            color: kwhitecolor),
                                        children: [
                                          TextSpan(
                                              text: "Hyundai",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w400,
                                                  color: kwhitecolor)),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: h * 0.05,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "Average\n",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            color: kwhitecolor),
                                        children: [
                                          TextSpan(
                                              text: "Health",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: kwhitecolor)),
                                        ]),
                                  ),
                                ],
                              ),
                              RichText(
                                textAlign: TextAlign.end,
                                text: TextSpan(
                                    text: "Expected Run\n",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: kwhitecolor),
                                    children: [
                                      TextSpan(
                                          text: "5,000 kms\n",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: kwhitecolor)),
                                      TextSpan(
                                          text: "without service",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: kwhitecolor)),
                                    ]),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: w,
                // height: h*0.32,
                margin: EdgeInsets.only(top: h * 0.02, bottom: h * 0.55),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(h * 0.07)),
                  color: kwhitecolor,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        controller: _controller2,
                        itemCount: item,
                        padding: EdgeInsets.only(top: h*0.01),
                        itemBuilder: (context, index) {
                          currentN = Random().nextInt(4);
                          currentColor = color[currentN];
                          
                          return Container(
                            height: h*0.08,
                            padding: EdgeInsets.symmetric(horizontal: w * 0.07,vertical: h*0.018),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CircleAvatar(
                                    radius: h * 0.01,
                                    backgroundColor: currentColor, // color[Random().nextInt(3)],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                        text: "Engine\n",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: kTextInputPlaceholderColor),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "No warnings on instrument cluster",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  height: 2,
                                                  color:
                                                      kTextInputPlaceholderColor)),
                                        ]),
                                  ),
                                ),
                                Row(
                                  children: List.generate(5, (index) => Container(
                                    height: h*0.015,
                                    width: h*0.015,
                                    color: index<=currentN? currentColor : currentColor.withOpacity(0.5),
                                    margin: EdgeInsets.only(right: w*0.01),
                                  ))
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        extend = !extend;
                        setState(() {
                          
                        });
                      },
                      child:extend?  const Icon(Icons.keyboard_arrow_up):const Icon(Icons.keyboard_arrow_down),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
