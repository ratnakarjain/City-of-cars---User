import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatefulWidget {
  const JobCard({Key? key}) : super(key: key);

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();
  ScrollController _controller3 = ScrollController();
  ScrollController _controller4 = ScrollController();
  var h;
  var w;
  List heading = [
    "Suspension",
    "Clutch",
    "Horn",
    "Software",
    "Battery",
    "Hood",
    "Power Windows",
  ];
  List subh = [
    "Break",
    "Loose",
    "NW",
    "Reset",
    "Weak",
    "Noise impounded from rear",
    "NW",
  ];
  List images = ["girl.png", "man.png", "view.png"];
  List availabel = [
    "Warranty booklet",
    "Stereo",
    "ORVM",
    "Power Windows",
    "AC Operation",
    "Carpet Mats",
    "Antenna",
    "Interior Illumination",
    "Horn",
    "Seat Belt",
    "Warning Lights",
    "Handbrake",
  ];
  List notAvailabel = [
    "Clutch",
    "Power Steering",
    "Defrost / Heater",
    "Central locking",
    "Spare Wheel",
    "Headlight Bulbs",
    "Tail Light Bulbs",
    "Fog Light",
    "Windscreen Wipers",
  ];
  List missingParts = [
    "Windscreen Water",
    "Wheel Caps",
    "Toolkit / First Aid",
    "Trunk Mat",
    "Cabin Mats",
    "Toolkit / First Aid",
  ];
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
          "Job Card",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: h * 0.02, horizontal: w * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: RRectCard(
                        // h: h * 0.1,
                        // w: w * 0.6,
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.06, vertical: h * 0.02),
                        widget: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: "Name:",
                              style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: ksubHading),
                              children: [
                                TextSpan(
                                  text: " Rodriques\n",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: "Address",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: " - B-155, Model Town - 3,\n",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: "Delhi - 110009\n",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: "GST:",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: "07ABBCS0227P",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ksubHading),
                                )
                              ]),
                        ),
                        borderRadius: h * 0.05,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset("assets/images/Uber1.png"),
                          RichText(
                            text: TextSpan(
                                text: "I20",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 9,
                                  height: 2,
                                  color: kTextInputPlaceholderColor,
                                ),
                                children: [
                                  TextSpan(
                                      text: " Hyundai",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 9,
                                          height: 2,
                                          color: kTextInputPlaceholderColor))
                                ]),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: h * 0.2,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _controller1,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Image.asset("assets/images/${images[index]}");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.09),
                child: Text(
                  "Customer Concerns",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextInputPlaceholderColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(h * 0.015),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(left: w * 0.02),
                              decoration: BoxDecoration(
                                  color: kwhitecolor,
                                  borderRadius:
                                      BorderRadius.circular(h * 0.03)),
                              child: ListView.builder(
                                controller: _controller2,
                                padding: EdgeInsets.all(h * 0.01),
                                shrinkWrap: true,
                                itemCount: heading.length,
                                itemBuilder: ((context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          heading[index],
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: ksubHading,
                                              height: 1.5),
                                        ),
                                      ),
                                      VerticalDivider(
                                        width: w * 0.05,
                                        color: kTextInputPlaceholderColor,
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          subh[index],
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: ksubHading,
                                              height: 1.5),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: w * 0.01,
                    ),
                    Expanded(
                      child: RRectCard(
                        shadowColor: kTransparent,
                        padding: EdgeInsets.symmetric(vertical: h * 0.015),
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset("assets/images/numP.png",
                                    height: h * 0.03),
                                Text(
                                  "DL 8CAR 9327",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 7,
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.48),
                                      height: 1.5),
                                )
                              ],
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/000.png",
                                    height: h * 0.03),
                                Text(
                                  "DL 8CAR 9327",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 7,
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.48),
                                      height: 1.5),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/EngineOil.png",
                                    height: h * 0.03),
                                Text(
                                  "DL 8CAR 9327",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 7,
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.48),
                                      height: 1.5),
                                )
                              ],
                            )
                          ],
                        ),
                        borderRadius: h * 0.02,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.09),
                child: Text(
                  "Available",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextInputPlaceholderColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(h * 0.01),
                child: RRectCard(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.05, vertical: h * 0.02),
                    widget: GridView.count(
                      shrinkWrap: true,
                      controller: _controller3,
                      mainAxisSpacing: h*0.01,
                      crossAxisSpacing: w*0.01,
                      // scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                       childAspectRatio: 1.6,
                      physics: NeverScrollableScrollPhysics(),
                      // padding: EdgeInsets.all(10),
                      children: List.generate(availabel.length, (index) {
                        return RRectCard(
                          color: kLightOrangeBgColor,
                          h: 10,
                          borderRadius: h * 0.03,
                          padding: EdgeInsets.all(h * 0.01),
                          widget: Center(
                            child: Text(
                              availabel[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: kTextInputPlaceholderColor,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    borderRadius: h * 0.02),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.09),
                child: Text(
                  "Not Available",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextInputPlaceholderColor.withOpacity(0.63),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(h * 0.01),
                child: RRectCard(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.05, vertical: h * 0.02),
                    widget: GridView.count(
                      shrinkWrap: true,
                       childAspectRatio: 1.6,
                      controller: _controller3,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                      crossAxisSpacing: w*0.01,
                      mainAxisSpacing: h*0.01,

                      // padding: EdgeInsets.all(10),
                      children: List.generate(notAvailabel.length, (index) {
                        return RRectCard(
                          padding: EdgeInsets.all(h * 0.01),
                          color: kredcolor,
                          h: 10,
                          borderRadius: h * 0.03,
                          shadowColor: kTransparent,
                          widget: Center(
                            child: Text(
                              notAvailabel[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: kwhitecolor,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    borderRadius: h * 0.02),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.09),
                child: Text(
                  "Missing Parts",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextInputPlaceholderColor.withOpacity(0.63),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(h * 0.01),
                child: RRectCard(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.05, vertical: h * 0.02),
                    widget: GridView.count(
                       childAspectRatio: 1.6,
                      crossAxisSpacing: w*0.01,
                      mainAxisSpacing: h*0.01,
                      shrinkWrap: true,
                      controller: _controller3,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 3,
                      // padding: EdgeInsets.all(10),
                      children: List.generate(missingParts.length, (index) {
                        return RRectCard(
                          padding: EdgeInsets.all(h * 0.01),
                          color: kLightOrangeBgColor,
                          h: 10,
                          borderRadius: h * 0.03,
                          widget: Center(
                            child: Text(
                              missingParts[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.63),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    borderRadius: h * 0.02),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.09),
                child: Text(
                  "Tyres",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextInputPlaceholderColor.withOpacity(0.63),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(h * 0.01),
                child: RRectCard(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.05, vertical: h * 0.02),
                    widget: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: RRectCard(
                            padding: EdgeInsets.all(h * 0.01),
                            color: kLightOrangeBgColor,
                            h: h * 0.15,
                            borderRadius: h * 0.06,
                            widget: Center(
                              child: Text(
                                "Continental GT (3) MRGF (1)",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: kTextInputPlaceholderColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GridView.count(
                              shrinkWrap: true,
                              
                       childAspectRatio: 1.6,
                      crossAxisSpacing: w*0.01,
                      mainAxisSpacing: h*0.01,
                              controller: _controller3,
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 2,
                              // padding: EdgeInsets.all(10),
                              children: [
                                RRectCard(
                                  padding: EdgeInsets.all(h * 0.01),
                                  color: korangecolor,
                                  borderRadius: h * 0.025,
                                  widget: Center(
                                    child: Text(
                                      "FRT Left",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: kwhitecolor,
                                      ),
                                    ),
                                  ),
                                ),
                                RRectCard(
                                  padding: EdgeInsets.all(h * 0.01),
                                  color: korangecolor,
                                  borderRadius: h * 0.025,
                                  widget: Center(
                                    child: Text(
                                      "FRT Right",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: kwhitecolor,
                                      ),
                                    ),
                                  ),
                                ),
                                RRectCard(
                                  padding: EdgeInsets.all(h * 0.01),
                                  color: kGreenColor,
                                  borderRadius: h * 0.025,
                                  widget: Center(
                                    child: Text(
                                      "RR Left",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: kwhitecolor,
                                      ),
                                    ),
                                  ),
                                ),
                                RRectCard(
                                  padding: EdgeInsets.all(h * 0.01),
                                  color: kredcolor,
                                  borderRadius: h * 0.025,
                                  widget: Center(
                                    child: Text(
                                      "RR Right",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                        color: kwhitecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    borderRadius: h * 0.02),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.09),
                child: Text(
                  "Battery",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextInputPlaceholderColor.withOpacity(0.63),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01,horizontal: w*0.02),
                child: RRectCard(
                  padding: EdgeInsets.all(h * 0.02),
                  color: korangecolor,
                  borderRadius: h * 0.02,
                  
                  widget: Center(
                    child: Text(
                      "Exide",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: kwhitecolor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.09),
                child: Text(
                  "Remarks",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: kTextInputPlaceholderColor.withOpacity(0.63),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01,horizontal: w*0.02),
                child: RRectCard(
                  padding: EdgeInsets.all(h * 0.02),
                  color: kwhitecolor,
                  borderRadius: h * 0.02,
                  
                  widget: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: "Name:",
                              style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: ksubHading),
                              children: [
                                TextSpan(
                                  text: " Rodriques\n",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: "Address",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: " - B-155, Model Town - 3,\n",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: "Delhi - 110009\n",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: "GST:",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: ksubHading),
                                ),
                                TextSpan(
                                  text: "07ABBCS0227P",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: ksubHading),
                                )
                              ]),
                        ),
                ),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 2,
              //       child: Row(
              //         children: [
              //           Expanded(
              //             flex: 2,
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   color: kwhitecolor,
              //                   borderRadius: BorderRadius.only(
              //                     topLeft: Radius.circular(h * 0.03),
              //                     bottomLeft: Radius.circular(h * 0.03),
              //                   )),
              //               child: ListView.builder(
              //                 padding: EdgeInsets.all(h * 0.01),
              //                 shrinkWrap: true,
              //                 itemCount: heading.length,
              //                 itemBuilder: ((context, index) {
              //                   return Text(
              //                     heading[index],
              //                     style: GoogleFonts.montserrat(
              //                         fontSize: 10,
              //                         fontWeight: FontWeight.w700,
              //                         color: ksubHading,
              //                         height: 1.5),
              //                   );
              //                 }),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             width: w * 0.005,
              //           ),
              //           Expanded(
              //             flex: 3,
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   color: kwhitecolor,
              //                   borderRadius: BorderRadius.only(
              //                     topRight: Radius.circular(h * 0.03),
              //                     bottomRight: Radius.circular(h * 0.03),
              //                   )),
              //               child: ListView.builder(
              //                 padding: EdgeInsets.all(h * 0.01),
              //                 shrinkWrap: true,
              //                 itemCount: subh.length,
              //                 itemBuilder: ((context, index) {
              //                   return Text(
              //                     subh[index],
              //                     style: GoogleFonts.montserrat(
              //                         fontSize: 10,
              //                         fontWeight: FontWeight.w400,
              //                         color: ksubHading,
              //                         height: 1.5),
              //                   );
              //                 }),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Expanded(
              //       child: RRectCard(
              //         h: h * 0.1,
              //         w: w * 0.2,
              //         widget: Row(),
              //         borderRadius: h * 0.02,
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
