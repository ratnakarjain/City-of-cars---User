import 'package:cityofcars/Screens/feedback.dart';
import 'package:cityofcars/Screens/jobCard.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';

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
      body: Container(
          height: h,
          width: w,
          padding: EdgeInsets.all(h * 0.02),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RRecctButton(
                    text: "Service Completed",
                    style: GoogleFonts.montserrat(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: kwhitecolor),
                    buttonColor: kGreenColor,
                    w: w * 0.3,
                    h: h * 0.03,
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
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: kwhitecolor),
                    buttonColor: korangecolor,
                    w: w * 0.3,
                    h: h * 0.03,
                  ),
                ],
              ),

              Swiper(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JobCard(),
                          ));
                    },
                    child: Container(
                      
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.03, vertical: h * 0.03),
                      decoration: BoxDecoration(
                          color: kwhitecolor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                offset: Offset(0, 2),
                                color: kshadowColor.withOpacity(0.2))
                          ],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(h * 0.05),
                            bottomLeft: Radius.circular(h * 0.05),
                          )),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "DELIVERY DATE: ",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: kTextInputPlaceholderColor),
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
                                        text: "271292",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                kTextInputPlaceholderColor))
                                  ])),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("₹2700",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w700,
                                          color: kTextInputPlaceholderColor)),
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
                                          color: kTextInputPlaceholderColor)),
                                ],
                              )
                            ],
                          ),
                          Image.asset(
                            "assets/images/Uber.png",
                            height: h * 0.15,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "I20  ",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: kTextInputPlaceholderColor),
                                  children: [
                                TextSpan(
                                    text: "Hyundai",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: kTextInputPlaceholderColor)),
                              ])),
                          Image.asset(
                            "assets/images/map.png",
                            height: h * 0.15,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "Premium\n",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      color: kTextInputPlaceholderColor),
                                  children: [
                                    TextSpan(
                                        text: "Service Pack\n",
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
                                            color: kTextInputPlaceholderColor
                                                .withOpacity(0.49))),
                                  ])),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 4,
                layout: SwiperLayout.TINDER,
                itemWidth: w,
                itemHeight: h * 0.6,
                onIndexChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                // pagination: const SwiperPagination(
                //     alignment: Alignment.bottomCenter,
                //     builder: SwiperPagination.dots),
              ),
              SizedBox(
                height: h*0.01,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  index  == currentPage 
                            ? kdarkpurple
                            : ksubHading
                      ),
                    );
                   })),
                   SizedBox(
                height: h*0.01,
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
                text: "BOOK AGAIN",
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: kwhitecolor),
                buttonColor: kbluecolor,
                w: w,
                h: h * 0.06,
              ),
           
            ],
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
