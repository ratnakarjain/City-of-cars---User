import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Shapes/widgets.dart';
import '../../../Utils/constants.dart';
import '../productDetail.dart';

class CommonServices extends StatefulWidget {
  const CommonServices({Key? key}) : super(key: key);

  @override
  State<CommonServices> createState() => _CommonServicesState();
}

class _CommonServicesState extends State<CommonServices> {
  var h;
  var w;
  List reccomendedPackes = [
    {"services": "clutch", "image": "2114.png", "type": "custom services"},
    {"services": "suspension", "image": "2117.png", "type": "custom services"},
    {"services": "brakes", "image": "2118.png", "type": "custom services"},
    {"services": "clutch", "image": "2114.png", "type": "custom services"},
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(top: h * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              color: kbluecolor,
              text: "common services",
              textStyle: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: kwhitecolor),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            Plans(
              h: h,
              w: w,
              text: "Basic",
              islabel: true,
              labeltext: "Frequently Booked",
            ),
            Plans(
              h: h,
              w: w,
              text: "Standerd",
              islabel: false,
            ),
            Plans(
              h: h,
              w: w,
              text: "Primium",
              islabel: true,
              labeltext: "Reccomended",
            ),
            SizedBox(
              height: h * 0.018,
            ),
            Label(
              color: kbluecolor,
              text: "brakes",
              textStyle: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: kwhitecolor),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            Plans(
              h: h,
              w: w,
              text: "Basic",
              islabel: true,
              labeltext: "Frequently Booked",
            ),
            Plans(
              h: h,
              w: w,
              text: "Standerd",
              islabel: false,
            ),
            Plans(
              h: h,
              w: w,
              text: "Primium",
              islabel: true,
              labeltext: "Reccomended",
            ),
            SizedBox(
              height: h * 0.018,
            ),
            Label(
              color: korangecolor,
              text: "recomend packes",
              textStyle: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: kwhitecolor),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            SizedBox(
              height: h*0.005,
            ),
            Container(
              height: h * 0.18,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(h * 0.01),
                itemCount: reccomendedPackes.length,
                itemBuilder: (context, index) {
                  return RRectCard(
                    h: h * 0.1,
                    w: w * 0.25,
                    borderRadius: 15,
                    widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              "assets/images/${reccomendedPackes[index]["image"]}"),
                          const SizedBox(
                            height: 5,
                          ),
                          FittedBox(
                            child: Text(
                              reccomendedPackes[index]["services"],
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                height: 2,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: h * 0.01),
                            child: FittedBox(
                              child: Text(
                                reccomendedPackes[index]["type"],
                                textScaleFactor: 0.6,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.6),
                                  height: 2,
                                ),
                              ),
                            ),
                          )
                        ]),
                  );
                },
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class Plans extends StatelessWidget {
  bool islabel;
  String? labeltext;
  double h;
  double w;
  String text;
  Plans(
      {Key? key,
      required this.h,
      required this.w,
      required this.text,
      required this.islabel,
      this.labeltext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhitecolor,
      margin: EdgeInsets.only(top: h * 0.018, left: w * 0.01, right: w * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          islabel
              ? Label(
                  color: korangecolor,
                  text: labeltext!,
                  textStyle: GoogleFonts.montserrat(
                    fontSize: 8,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: kwhitecolor),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                )
              : SizedBox(
                  height: h * 0.015,
                ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.06, vertical: h * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        textScaleFactor: 2,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Services Pack",
                        textScaleFactor: 0.7,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: kTextInputPlaceholderColor.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(h * 0.01),
                  decoration: BoxDecoration(
                      color: kLightOrangeBgColor,
                      borderRadius: BorderRadius.circular(h * 0.01)),
                  child: Column(
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
                        textScaleFactor: 0.7,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: kTextInputPlaceholderColor.withOpacity(0.6)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: w * 0.06, bottom: h * 0.01),
            child: Text(
              "Takes 4 Hrs / Every 3 Months",
              textScaleFactor: 0.7,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: kTextInputPlaceholderColor.withOpacity(0.6)),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              color: kLightOrangeBgColor,
              padding: EdgeInsets.all(h * 0.005),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.005),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/EngineOil.png",height: h*0.03,),
                        Text(
                          "Engine Oil",
                          textScaleFactor: 0.7,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.005),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/oifilter.png",height: h*0.03,),
                        Text(
                          "Oil Filter",
                          textScaleFactor: 0.7,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.005),
                    child: Column(
                      children: [
                        Image.asset("assets/images/wind.png",height: h*0.03,),
                        Text(
                          "Air Filter",
                          textScaleFactor: 0.7,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.6)),
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
                        Icon(Icons.arrow_forward_ios, size: h * 0.015),
                      ],
                    ),
                  )
                ],
              ),
            ),
            RRecctButton2(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(),));
              },
              h: h * 0.05,
              w: w * 0.3,
              radius: h * 0.025,
              buttonColor: kGreenColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Book now ".toUpperCase(),
                      textScaleFactor: 0.8,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, color: kwhitecolor)),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Image.asset("assets/images/doublArrow.png"),
                ],
              ),
            ),
          ]),
          SizedBox(
            height: h * 0.02,
          )
        ],
      ),
    );
  }
}