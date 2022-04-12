import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Shapes/widgets.dart';
import '../../../Utils/constants.dart';
import '../productDetail.dart';

var h;
var w;

class CommonServices extends StatefulWidget {
  const CommonServices({Key? key}) : super(key: key);

  @override
  State<CommonServices> createState() => _CommonServicesState();
}

class _CommonServicesState extends State<CommonServices> {
  List reccomendedPackes = [
    {"services": "Clutch", "image": "2114.png", "type": "Custom services"},
    {"services": "Suspension", "image": "2117.png", "type": "Custom services"},
    {"services": "Brakes", "image": "2118.png", "type": "Custom services"},
    {"services": "Clutch", "image": "2114.png", "type": "Custom services"},
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
              text: "Premium",
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
              height: h * 0.005,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.03),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: DropDown(
                    
                    ),
                  ),
                  Expanded(
                    child: RRecctButton2(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetails(),
                            ));
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
                                  fontWeight: FontWeight.w500,
                                  color: kwhitecolor)),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          Image.asset("assets/images/doublArrow.png"),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: h * 0.02,
          )
        ],
      ),
    );
  }
}

class DropDown extends StatefulWidget {
 
 const DropDown({Key? key,}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownvalue = '';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightOrangeBgColor,
      height: h*0.06,
      width: w*0.6,
      margin: EdgeInsets.only(right: w * 0.03),
      padding: EdgeInsets.all(h * 0.005),
      child: DropdownButtonHideUnderline(
        child: (DropdownButton(
          hint: SizedBox(
            width: w*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/EngineOil.png",
                      height: h * 0.03,
                    ),
                    Text(
                      "Engine Oil ",
                      // textScaleFactor: 0.7,
                      style: GoogleFonts.montserrat(
                        fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: kTextInputPlaceholderColor.withOpacity(0.6)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/oifilter.png",
                      height: h * 0.03,
                    ),
                    Text(
                      "Oil Filter",
                      // textScaleFactor: 0.7,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 8,
                          color: kTextInputPlaceholderColor.withOpacity(0.6)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/wind.png",
                      height: h * 0.03,
                    ),
                    Text(
                      "Air Filter",
                      // textScaleFactor: 0.7,
                      style: GoogleFonts.montserrat(
                        fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: kTextInputPlaceholderColor.withOpacity(0.6)),
                    ),
                  ],
                ),
                Text("+9 more",
                    textScaleFactor: 0.7,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          isDense: true,
          // Initial Value
          // value: dropdownvalue,

          // Down Arrow Icon
          icon: const Icon(Icons.arrow_forward_ios, size: 10),

          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                  children: [
                    Image.asset(
                      "assets/images/EngineOil.png",
                      height: h * 0.03,
                    ),
                    Text(
                      "Engine Oil ",
                      // textScaleFactor: 0.7,
                      style: GoogleFonts.montserrat(
                        fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: kTextInputPlaceholderColor.withOpacity(0.6)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/oifilter.png",
                      height: h * 0.03,
                    ),
                    Text(
                      "Oil Filter",
                      // textScaleFactor: 0.7,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 8,
                          color: kTextInputPlaceholderColor.withOpacity(0.6)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/wind.png",
                      height: h * 0.03,
                    ),
                    Text(
                      "Air Filter",
                      // textScaleFactor: 0.7,
                      style: GoogleFonts.montserrat(
                        fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: kTextInputPlaceholderColor.withOpacity(0.6)),
                    ),
                  ],
                ),
                ],
              ),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        )),
      ),
    );
  }
}

// Row(
//                         children: [
//                           // Padding(
//                           //   padding:
//                           //       EdgeInsets.symmetric(horizontal: h * 0.005),
//                           //   child: Column(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //     children: [
//                           //       Image.asset(
//                           //         "assets/images/EngineOil.png",
//                           //         height: h * 0.03,
//                           //       ),
//                           //       Text(
//                           //         "Engine Oil",
//                           //         textScaleFactor: 0.7,
//                           //         style: GoogleFonts.montserrat(
//                           //             fontWeight: FontWeight.w500,
//                           //             color: kTextInputPlaceholderColor
//                           //                 .withOpacity(0.6)),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // Padding(
//                           //   padding:
//                           //       EdgeInsets.symmetric(horizontal: h * 0.005),
//                           //   child: Column(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //     children: [
//                           //       Image.asset(
//                           //         "assets/images/oifilter.png",
//                           //         height: h * 0.03,
//                           //       ),
//                           //       Text(
//                           //         "Oil Filter",
//                           //         textScaleFactor: 0.7,
//                           //         style: GoogleFonts.montserrat(
//                           //             fontWeight: FontWeight.w500,
//                           //             color: kTextInputPlaceholderColor
//                           //                 .withOpacity(0.6)),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // Padding(
//                           //   padding:
//                           //       EdgeInsets.symmetric(horizontal: h * 0.005),
//                           //   child: Column(
//                           //     children: [
//                           //       Image.asset(
//                           //         "assets/images/wind.png",
//                           //         height: h * 0.03,
//                           //       ),
//                           //       Text(
//                           //         "Air Filter",
//                           //         textScaleFactor: 0.7,
//                           //         style: GoogleFonts.montserrat(
//                           //             fontWeight: FontWeight.w500,
//                           //             color: kTextInputPlaceholderColor
//                           //                 .withOpacity(0.6)),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           DropDown(
//                             h: h,
//                             w: w,
//                           )
//                         ],
//                       ),