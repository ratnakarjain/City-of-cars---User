import 'package:cityofcars/Screens/feedback.dart';
import 'package:cityofcars/Screens/jobCard.dart';
import 'package:cityofcars/Screens/tracking.dart';
import 'package:cityofcars/Services/models/orderhistoryModel.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';

import '../Services/servies.dart';
import 'bottomnavBar.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  var h;
  var w;
  int currentPage = 0;
  List cardDart = [
    "Primium",
    "Primium",
    "Primium",
    "Primium",
  ];
  List<OrderHistoryModel> datalist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderhistory().then((value) {
      datalist.addAll(value);
      print(datalist);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg2,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        title: Text(
          "Order History",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body:datalist.isEmpty? loder: Container(
          height: h,
          width: w,
          padding: EdgeInsets.symmetric(horizontal: h * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RRecctButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Tracking(
                                      orderid: datalist[currentPage].orderid,
                                    ))));
                      },
                      text: datalist[currentPage].status!=""&&datalist[currentPage].status!="null"?datalist[currentPage].status:
                      "Service Completed",
                      style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: kwhitecolor),
                      buttonColor: kGreenColor,
                      w: w * 0.4,
                      h: h * 0.04,
                    ),
                    RRecctButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FeedBack(),
                            ));
                      },
                      text: "Send Feedback",
                      style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: kwhitecolor),
                      buttonColor: korangecolor,
                      w: w * 0.4,
                      h: h * 0.04,
                    ),
                  ],
                ),

                Swiper(
                  itemCount: datalist.length,
                  layout: SwiperLayout.TINDER,
                  scrollDirection: Axis.horizontal,
                  axisDirection: AxisDirection.left,
                  itemWidth: w,
                  loop: false,
                  itemHeight: h * 0.61,
                  onIndexChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    OrderHistoryModel model = OrderHistoryModel();
                    model = datalist[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const JobCard(),
                            ));
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: h * 0.01),
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.03, vertical: h * 0.03),
                            decoration: BoxDecoration(
                                color: kwhitecolor,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 3),
                                      color: kshadowColor.withOpacity(0.3))
                                ],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(h * 0.06),
                                  bottomLeft: Radius.circular(h * 0.06),
                                )),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              text: "DELIVERY DATE: ",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      kTextInputPlaceholderColor),
                                              children: [
                                            TextSpan(
                                                text: "27th Oct\n",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        kTextInputPlaceholderColor)),
                                            TextSpan(
                                                text: "BOOKING ID: ",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        kTextInputPlaceholderColor)),
                                            TextSpan(
                                                text: model.orderid,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        kTextInputPlaceholderColor))
                                          ])),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("₹"+model.price,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      kTextInputPlaceholderColor)),
                                          RRecctButton(
                                            text: "Paid",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w700,
                                                color: kwhitecolor),
                                            buttonColor: kGreenColor,
                                            w: w * 0.17,
                                            h: h * 0.03,
                                          ),
                                          Text("view invoice     ",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      kTextInputPlaceholderColor)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                // Image.asset(
                                //   "assets/images/Uber.png",
                                //   height: h * 0.15,
                                // ),
                                Container(
                                  height: h*0.15,
                                  width: w*0.3,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        model.carimage
                                      ),
                                      fit: BoxFit.fill
                                    )
                                  ),

                                ),
                                RichText(
                                    text: TextSpan(
                                        text: model.carname+"  ",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                            color: kTextInputPlaceholderColor),
                                        children: [
                                      TextSpan(
                                          text: "Hyundai",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  kTextInputPlaceholderColor)),
                                    ])),
                                Image.asset(
                                  "assets/images/map.png",
                                  height: h * 0.15,
                                ),
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: model.packname+"\n",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700,
                                            color: kTextInputPlaceholderColor),
                                        children: [
                                          TextSpan(
                                              text: model.servicename+"\n",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      kTextInputPlaceholderColor)),
                                          TextSpan(
                                              text:
                                                  "The package includes the use of 3M products and services",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12,
                                                  height: 2,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      kTextInputPlaceholderColor
                                                          .withOpacity(0.49))),
                                        ])),
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(
                          //     bottom: h*0.01
                          //   ),
                          //   decoration: BoxDecoration(
                          //       color:index==currentPage? kTransparent : kblackcolor.withOpacity(0.1+(index/10)),
                          //       // boxShadow: [
                          //       //   BoxShadow(
                          //       //       blurRadius: 2,
                          //       //       spreadRadius: 1,
                          //       //       offset: const Offset(0, 3),
                          //       //       color: kshadowColor.withOpacity(0.3))
                          //       // ],
                          //       borderRadius: BorderRadius.only(
                          //         topRight: Radius.circular(h * 0.06),
                          //         bottomLeft: Radius.circular(h * 0.06),
                          //       )),
                          // )
                        ],
                      ),
                    );
                  },

                  // pagination: const SwiperPagination(
                  //     alignment: Alignment.bottomCenter,
                  //     builder: SwiperPagination.dots),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(datalist.length, (index) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == currentPage
                                ? kdarkpurple
                                : ksubHading),
                      );
                    })),
                SizedBox(
                  height: h * 0.01,
                ),

                // Expanded(
                //   child: Swiper.children(
                //     layout: SwiperLayout.STACK,
                //     itemWidth: w,
                //     children: [
                //       Container(
                //         padding: EdgeInsets.symmetric(
                //             horizontal: w * 0.03, vertical: h * 0.03),
                //         decoration: BoxDecoration(
                //             color: kwhitecolor,
                //             borderRadius: BorderRadius.only(
                //               topRight: Radius.circular(h * 0.05),
                //               bottomLeft: Radius.circular(h * 0.05),
                //             )),
                //         child: Column(
                //           children: [
                //             Row(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 RichText(
                //                     text: TextSpan(
                //                         text: "DELIVERY DATE: ",
                //                         style: GoogleFonts.montserrat(
                //                             fontSize: 8,
                //                             fontWeight: FontWeight.w400,
                //                             color: kTextInputPlaceholderColor),
                //                         children: [
                //                       TextSpan(
                //                           text: "27th Oct\n",
                //                           style: GoogleFonts.montserrat(
                //                               fontSize: 8,
                //                               fontWeight: FontWeight.w700,
                //                               color: kTextInputPlaceholderColor)),
                //                       TextSpan(
                //                           text: "BOOKING ID: ",
                //                           style: GoogleFonts.montserrat(
                //                               fontSize: 8,
                //                               fontWeight: FontWeight.w400,
                //                               color: kTextInputPlaceholderColor)),
                //                       TextSpan(
                //                           text: "271292",
                //                           style: GoogleFonts.montserrat(
                //                               fontSize: 8,
                //                               fontWeight: FontWeight.w700,
                //                               color: kTextInputPlaceholderColor))
                //                     ])),
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.end,
                //                   children: [
                //                     Text("₹2700",
                //                         style: GoogleFonts.montserrat(
                //                             fontSize: 19,
                //                             fontWeight: FontWeight.w700,
                //                             color: kTextInputPlaceholderColor)),
                //                     RRecctButton(
                //                       text: "Paid",
                //                       style: GoogleFonts.montserrat(
                //                           fontSize: 9,
                //                           fontWeight: FontWeight.w700,
                //                           color: kwhitecolor),
                //                       buttonColor: kGreenColor,
                //                       w: w * 0.17,
                //                       h: h * 0.03,
                //                     ),
                //                     Text("view invoice     ",
                //                         textAlign: TextAlign.center,
                //                         style: GoogleFonts.montserrat(
                //                             fontSize: 9,
                //                             fontWeight: FontWeight.w400,
                //                             color: kTextInputPlaceholderColor)),
                //                   ],
                //                 )
                //               ],
                //             ),
                //             Image.asset(
                //               "assets/images/Uber.png",
                //               height: h * 0.15,
                //             ),
                //             RichText(
                //                 text: TextSpan(
                //                     text: "I20  ",
                //                     style: GoogleFonts.montserrat(
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.w700,
                //                         color: kTextInputPlaceholderColor),
                //                     children: [
                //                   TextSpan(
                //                       text: "Hyundai",
                //                       style: GoogleFonts.montserrat(
                //                           fontSize: 12,
                //                           fontWeight: FontWeight.w400,
                //                           color: kTextInputPlaceholderColor)),
                //                 ])),
                //             Image.asset(
                //               "assets/images/map.png",
                //               height: h * 0.15,
                //             ),
                //             RichText(
                //                 textAlign: TextAlign.center,
                //                 text: TextSpan(
                //                     text: "Premium\n",
                //                     style: GoogleFonts.montserrat(
                //                         fontSize: 32,
                //                         fontWeight: FontWeight.w700,
                //                         color: kTextInputPlaceholderColor),
                //                     children: [
                //                       TextSpan(
                //                           text: "Service Pack\n",
                //                           style: GoogleFonts.montserrat(
                //                               fontSize: 11,
                //                               fontWeight: FontWeight.w400,
                //                               color: kTextInputPlaceholderColor)),
                //                       TextSpan(
                //                           text:
                //                               "The package includes the use of 3M products and services",
                //                           style: GoogleFonts.montserrat(
                //                               fontSize: 12,
                //                               height: 2,
                //                               fontWeight: FontWeight.w400,
                //                               color: kTextInputPlaceholderColor
                //                                   .withOpacity(0.49))),
                //                     ])),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                RRecctButton(
                  onTap: () {
                    // Navigator.pushAndRemoveUntil<dynamic>(
                    //   context,
                    //   MaterialPageRoute<dynamic>(
                    //     builder: (BuildContext context) => BottomNavBar(
                    //       index: 0,
                    //     ),
                    //   ),
                    //   (route) =>
                    //       false, //if you want to disable back feature set to false
                    // );
                  },
                  text: "BOOK AGAIN",
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kwhitecolor),
                  buttonColor: kbluecolor,
                  w: w,
                  h: h * 0.06,
                ),
                SizedBox(
                  height: h * 0.1,
                )
              ],
            ),
          )

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     RRecctButton(
          //       text: "Service Completed",
          //       style: GoogleFonts.montserrat(
          //           fontSize: 9, fontWeight: FontWeight.w700, color: kwhitecolor),
          //       buttonColor: kGreenColor,
          //       w: w * 0.3,
          //       h: h * 0.03,
          //     ),

          //     Container(
          //       height: h*0.6,
          //       child: Swiper(

          //         itemBuilder: (context, index) {
          //           return Container(

          //             padding: EdgeInsets.symmetric(
          //                 horizontal: w * 0.03, vertical: h * 0.03),
          //             decoration: BoxDecoration(
          //                 color: kwhitecolor,
          //                 boxShadow: [
          //                   BoxShadow(
          //                       blurRadius: 2,
          //                       offset: Offset(0, 2),
          //                       color: kshadowColor.withOpacity(0.2))
          //                 ],
          //                 borderRadius: BorderRadius.only(
          //                   topRight: Radius.circular(h * 0.05),
          //                   bottomLeft: Radius.circular(h * 0.05),
          //                 )),
          //             child: Column(
          //               children: [
          //                 Row(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     RichText(
          //                         text: TextSpan(
          //                             text: "DELIVERY DATE: ",
          //                             style: GoogleFonts.montserrat(
          //                                 fontSize: 8,
          //                                 fontWeight: FontWeight.w400,
          //                                 color: kTextInputPlaceholderColor),
          //                             children: [
          //                           TextSpan(
          //                               text: "27th Oct\n",
          //                               style: GoogleFonts.montserrat(
          //                                   fontSize: 8,
          //                                   fontWeight: FontWeight.w700,
          //                                   color: kTextInputPlaceholderColor)),
          //                           TextSpan(
          //                               text: "BOOKING ID: ",
          //                               style: GoogleFonts.montserrat(
          //                                   fontSize: 8,
          //                                   fontWeight: FontWeight.w400,
          //                                   color: kTextInputPlaceholderColor)),
          //                           TextSpan(
          //                               text: "271292",
          //                               style: GoogleFonts.montserrat(
          //                                   fontSize: 8,
          //                                   fontWeight: FontWeight.w700,
          //                                   color: kTextInputPlaceholderColor))
          //                         ])),
          //                     Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       children: [
          //                         Text("₹2700",
          //                             style: GoogleFonts.montserrat(
          //                                 fontSize: 19,
          //                                 fontWeight: FontWeight.w700,
          //                                 color: kTextInputPlaceholderColor)),
          //                         RRecctButton(
          //                           text: "Paid",
          //                           style: GoogleFonts.montserrat(
          //                               fontSize: 9,
          //                               fontWeight: FontWeight.w700,
          //                               color: kwhitecolor),
          //                           buttonColor: kGreenColor,
          //                           w: w * 0.17,
          //                           h: h * 0.03,
          //                         ),
          //                         Text("view invoice     ",
          //                             textAlign: TextAlign.center,
          //                             style: GoogleFonts.montserrat(
          //                                 fontSize: 9,
          //                                 fontWeight: FontWeight.w400,
          //                                 color: kTextInputPlaceholderColor)),
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //                 Image.asset(
          //                   "assets/images/Uber.png",
          //                   height: h * 0.15,
          //                 ),
          //                 RichText(
          //                     text: TextSpan(
          //                         text: "I20  ",
          //                         style: GoogleFonts.montserrat(
          //                             fontSize: 12,
          //                             fontWeight: FontWeight.w700,
          //                             color: kTextInputPlaceholderColor),
          //                         children: [
          //                       TextSpan(
          //                           text: "Hyundai",
          //                           style: GoogleFonts.montserrat(
          //                               fontSize: 12,
          //                               fontWeight: FontWeight.w400,
          //                               color: kTextInputPlaceholderColor)),
          //                     ])),
          //                 Image.asset(
          //                   "assets/images/map.png",
          //                   height: h * 0.15,
          //                 ),
          //                 RichText(
          //                     textAlign: TextAlign.center,
          //                     text: TextSpan(
          //                         text: "Premium\n",
          //                         style: GoogleFonts.montserrat(
          //                             fontSize: 32,
          //                             fontWeight: FontWeight.w700,
          //                             color: kTextInputPlaceholderColor),
          //                         children: [
          //                           TextSpan(
          //                               text: "Service Pack\n",
          //                               style: GoogleFonts.montserrat(
          //                                   fontSize: 11,
          //                                   fontWeight: FontWeight.w400,
          //                                   color: kTextInputPlaceholderColor)),
          //                           TextSpan(
          //                               text:
          //                                   "The package includes the use of 3M products and services",
          //                               style: GoogleFonts.montserrat(
          //                                   fontSize: 12,
          //                                   height: 2,
          //                                   fontWeight: FontWeight.w400,
          //                                   color: kTextInputPlaceholderColor
          //                                       .withOpacity(0.49))),
          //                         ])),
          //               ],
          //             ),
          //           );
          //         },
          //         itemCount: 4,
          //         layout: SwiperLayout.TINDER,
          //         itemWidth: w,
          //         itemHeight: h * 0.6,

          //         pagination: const SwiperPagination(
          //           alignment: Alignment.bottomCenter,
          //           builder: SwiperPagination.dots
          //         ),
          //       ),
          //     ),
          //     // Expanded(
          //     //   child: Swiper.children(
          //     //     layout: SwiperLayout.STACK,
          //     //     itemWidth: w,
          //     //     children: [
          //     //       Container(
          //     //         padding: EdgeInsets.symmetric(
          //     //             horizontal: w * 0.03, vertical: h * 0.03),
          //     //         decoration: BoxDecoration(
          //     //             color: kwhitecolor,
          //     //             borderRadius: BorderRadius.only(
          //     //               topRight: Radius.circular(h * 0.05),
          //     //               bottomLeft: Radius.circular(h * 0.05),
          //     //             )),
          //     //         child: Column(
          //     //           children: [
          //     //             Row(
          //     //               crossAxisAlignment: CrossAxisAlignment.start,
          //     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //               children: [
          //     //                 RichText(
          //     //                     text: TextSpan(
          //     //                         text: "DELIVERY DATE: ",
          //     //                         style: GoogleFonts.montserrat(
          //     //                             fontSize: 8,
          //     //                             fontWeight: FontWeight.w400,
          //     //                             color: kTextInputPlaceholderColor),
          //     //                         children: [
          //     //                       TextSpan(
          //     //                           text: "27th Oct\n",
          //     //                           style: GoogleFonts.montserrat(
          //     //                               fontSize: 8,
          //     //                               fontWeight: FontWeight.w700,
          //     //                               color: kTextInputPlaceholderColor)),
          //     //                       TextSpan(
          //     //                           text: "BOOKING ID: ",
          //     //                           style: GoogleFonts.montserrat(
          //     //                               fontSize: 8,
          //     //                               fontWeight: FontWeight.w400,
          //     //                               color: kTextInputPlaceholderColor)),
          //     //                       TextSpan(
          //     //                           text: "271292",
          //     //                           style: GoogleFonts.montserrat(
          //     //                               fontSize: 8,
          //     //                               fontWeight: FontWeight.w700,
          //     //                               color: kTextInputPlaceholderColor))
          //     //                     ])),
          //     //                 Column(
          //     //                   crossAxisAlignment: CrossAxisAlignment.end,
          //     //                   children: [
          //     //                     Text("₹2700",
          //     //                         style: GoogleFonts.montserrat(
          //     //                             fontSize: 19,
          //     //                             fontWeight: FontWeight.w700,
          //     //                             color: kTextInputPlaceholderColor)),
          //     //                     RRecctButton(
          //     //                       text: "Paid",
          //     //                       style: GoogleFonts.montserrat(
          //     //                           fontSize: 9,
          //     //                           fontWeight: FontWeight.w700,
          //     //                           color: kwhitecolor),
          //     //                       buttonColor: kGreenColor,
          //     //                       w: w * 0.17,
          //     //                       h: h * 0.03,
          //     //                     ),
          //     //                     Text("view invoice     ",
          //     //                         textAlign: TextAlign.center,
          //     //                         style: GoogleFonts.montserrat(
          //     //                             fontSize: 9,
          //     //                             fontWeight: FontWeight.w400,
          //     //                             color: kTextInputPlaceholderColor)),
          //     //                   ],
          //     //                 )
          //     //               ],
          //     //             ),
          //     //             Image.asset(
          //     //               "assets/images/Uber.png",
          //     //               height: h * 0.15,
          //     //             ),
          //     //             RichText(
          //     //                 text: TextSpan(
          //     //                     text: "I20  ",
          //     //                     style: GoogleFonts.montserrat(
          //     //                         fontSize: 12,
          //     //                         fontWeight: FontWeight.w700,
          //     //                         color: kTextInputPlaceholderColor),
          //     //                     children: [
          //     //                   TextSpan(
          //     //                       text: "Hyundai",
          //     //                       style: GoogleFonts.montserrat(
          //     //                           fontSize: 12,
          //     //                           fontWeight: FontWeight.w400,
          //     //                           color: kTextInputPlaceholderColor)),
          //     //                 ])),
          //     //             Image.asset(
          //     //               "assets/images/map.png",
          //     //               height: h * 0.15,
          //     //             ),
          //     //             RichText(
          //     //                 textAlign: TextAlign.center,
          //     //                 text: TextSpan(
          //     //                     text: "Premium\n",
          //     //                     style: GoogleFonts.montserrat(
          //     //                         fontSize: 32,
          //     //                         fontWeight: FontWeight.w700,
          //     //                         color: kTextInputPlaceholderColor),
          //     //                     children: [
          //     //                       TextSpan(
          //     //                           text: "Service Pack\n",
          //     //                           style: GoogleFonts.montserrat(
          //     //                               fontSize: 11,
          //     //                               fontWeight: FontWeight.w400,
          //     //                               color: kTextInputPlaceholderColor)),
          //     //                       TextSpan(
          //     //                           text:
          //     //                               "The package includes the use of 3M products and services",
          //     //                           style: GoogleFonts.montserrat(
          //     //                               fontSize: 12,
          //     //                               height: 2,
          //     //                               fontWeight: FontWeight.w400,
          //     //                               color: kTextInputPlaceholderColor
          //     //                                   .withOpacity(0.49))),
          //     //                     ])),
          //     //           ],
          //     //         ),
          //     //       ),
          //     //     ],
          //     //   ),
          //     // ),
          //     SizedBox(
          //       height: h * 0.02,
          //     ),
          //     RRecctButton(
          //       text: "BOOK AGAIN",
          //       style: GoogleFonts.montserrat(
          //           fontSize: 14,
          //           fontWeight: FontWeight.w700,
          //           color: kwhitecolor),
          //       buttonColor: kbluecolor,
          //       w: w,
          //       h: h * 0.06,
          //     ),

          //   ],
          // ),
          ),
    );
  }
}
