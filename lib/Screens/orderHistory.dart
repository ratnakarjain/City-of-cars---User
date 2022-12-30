import 'package:cityofcars/Screens/carHealth.dart';
import 'package:cityofcars/Screens/feedback.dart';
import 'package:cityofcars/Screens/jobCard.dart';
import 'package:cityofcars/Screens/tracking.dart';
import 'package:cityofcars/Services/models/orderhistoryModel.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Services/servies.dart';
import '../Utils/Shapes/widgets.dart';
import '../Utils/functions.dart';
import 'Service Main/cart.dart';
import 'bottomnavBar.dart';
import 'orderHistoryDetails.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  var h;
  var w;
  int currentPage = 0;
  bool isloading = true;
  var pref = Prefernece.pref;
  List cardDart = [
    "Primium",
    "Primium",
    "Primium",
    "Primium",
  ];
  List<OrderHistoryModel> datalist = [];
  @override
  void initState() {
    super.initState();
    getOrderhistory().then((value) {
      datalist.addAll(value);

      isloading = false;
      pref!.setInt("totalServices", datalist.length);
      print(datalist);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          datalist = datalist.reversed.toList();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // getOrderhistory().then((value) {
    //   datalist.addAll(value);
    //   isloading= false;
    //   print(datalist);
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     setState(() {

    //     });
    //   });

    // });
    return Scaffold(
      backgroundColor: kbg3,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        title: Text(
          "Order History",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: w * 0.03, bottom: h * 0.01, top: h * 0.01),
            // height: h*0.02,
            // width: w*0.2,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kwhitecolor)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(
                        getcart: true,
                      ),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                child: const Icon(
                  Icons.shopping_cart,
                  color: kTextInputPlaceholderColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: isloading
          ? loder
          : datalist.isEmpty
              ? const Center(
                  child: Text("No Orders yet"),
                )
              : Container(
                  height: h,
                  width: w,
                  padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: h * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // RRecctButton(
                            //   onTap: () {
                            //     // Navigator.push(
                            //     //     context,
                            //     //     MaterialPageRoute(
                            //     //         builder: ((context) => JobCard(
                            //     //               orderid: datalist[currentPage].id,
                            //     //             ))));
                            //   },
                            //   text: datalist[currentPage].status != "" &&
                            //           datalist[currentPage].status != "null"
                            //       ? datalist[currentPage].status
                            //       : "Service Completed",
                            //   style: GoogleFonts.montserrat(
                            //       fontSize: 11,
                            //       fontWeight: FontWeight.w700,
                            //       color: kwhitecolor),
                            //   buttonColor:
                            //       datalist[currentPage].status.toLowerCase() ==
                            //                   "in progress" ||
                            //               datalist[currentPage]
                            //                       .status
                            //                       .toLowerCase() ==
                            //                   "inprogress"
                            //           ? korangecolor
                            //           : datalist[currentPage]
                            //                       .status
                            //                       .toLowerCase() ==
                            //                   "completed"
                            //               ? kGreenColor
                            //               : kredcolor,
                            //   w: w * 0.4,
                            //   h: h * 0.04,
                            // ),
                            Visibility(
                              visible:
                                  datalist[currentPage].status.toLowerCase() ==
                                      "completed",
                              child: RRecctButton2(
                                onTap: datalist[currentPage]
                                            .status
                                            .toLowerCase() !=
                                        "completed"
                                    ? () {}
                                    : () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => FeedBack(
                                                order: datalist[currentPage],
                                              ),
                                            ));
                                      },
                                widget: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.favorite_outline_sharp,
                                      color: kwhitecolor,
                                    ),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    Text(
                                      "Send Feedback",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: kwhitecolor),
                                    )
                                  ],
                                ),
                                radius: h * 0.02,
                                buttonColor: kGreenColor,
                                w: w * 0.4,
                                h: h * 0.04,
                              ),
                            ),
                          ],
                        ),
                        datalist.length == 1
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Tracking(
                                            ordertime:
                                                datalist.first.ordertime!,
                                            orderid: datalist.first.id,
                                            date: datalist[currentPage]
                                                .deliverydate,
                                            time: datalist[currentPage]
                                                .deliverytime),
                                      ));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: h * 0.6,
                                      margin: EdgeInsets.only(
                                          bottom: h * 0.01,
                                          top: h * 0.04,
                                          left: w * 0.09,
                                          right: w * 0.09),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.03,
                                        vertical: h * 0.03,
                                      ),
                                      decoration: BoxDecoration(
                                          color: kwhitecolor,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                spreadRadius: 1,
                                                offset: const Offset(0, 3),
                                                color: kshadowColor
                                                    .withOpacity(0.3))
                                          ],
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(h * 0.06),
                                            bottomLeft:
                                                Radius.circular(h * 0.06),
                                          )),
                                    ),
                                    Container(
                                      height: h * 0.6,
                                      margin: EdgeInsets.only(
                                          bottom: h * 0.01,
                                          top: h * 0.035,
                                          left: w * 0.07,
                                          right: w * 0.07),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.03,
                                        vertical: h * 0.03,
                                      ),
                                      decoration: BoxDecoration(
                                          color: kwhitecolor,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                spreadRadius: 1,
                                                offset: const Offset(0, 3),
                                                color: kshadowColor
                                                    .withOpacity(0.3))
                                          ],
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(h * 0.06),
                                            bottomLeft:
                                                Radius.circular(h * 0.06),
                                          )),
                                    ),
                                    Container(
                                      height: h * 0.6,
                                      margin: EdgeInsets.only(
                                          bottom: h * 0.01,
                                          top: h * 0.03,
                                          left: w * 0.05,
                                          right: w * 0.05),
                                      // padding: EdgeInsets.symmetric(
                                      //   horizontal: w * 0.03,
                                      //   vertical: h * 0.03,
                                      // ),
                                      decoration: BoxDecoration(
                                          color: datalist[currentPage]
                                                          .status
                                                          .toLowerCase() ==
                                                      "in progress" ||
                                                  datalist[currentPage]
                                                          .status
                                                          .toLowerCase() ==
                                                      "inprogress"
                                              ? korangecolor
                                              : datalist[currentPage]
                                                          .status
                                                          .toLowerCase() ==
                                                      "completed"
                                                  ? kGreenColor
                                                  : kredcolor,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                spreadRadius: 1,
                                                offset: const Offset(0, 3),
                                                color: kshadowColor
                                                    .withOpacity(0.3))
                                          ],
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(h * 0.06),
                                            bottomLeft:
                                                Radius.circular(h * 0.06),
                                          )),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        h * 0.1))),
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.01),
                                            child: Text(
                                              datalist[currentPage].status !=
                                                          "" &&
                                                      datalist[currentPage]
                                                              .status !=
                                                          "null"
                                                  ? datalist[currentPage].status
                                                  : "Service Completed",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                  color: kwhitecolor),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: w,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: w * 0.0001),
                                              decoration: BoxDecoration(
                                                  color: kwhitecolor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        h * 0.02),
                                                    bottomLeft: Radius.circular(
                                                        h * 0.06),
                                                  )),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                w * 0.02),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: h * 0.01,
                                                            ),
                                                            RichText(
                                                                text: TextSpan(
                                                                    text:
                                                                        "DELIVERY DATE: ",
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color:
                                                                            kTextInputPlaceholderColor),
                                                                    children: [
                                                                  TextSpan(
                                                                      text: datalist.first.deliverydate.toString() == "null"
                                                                          ? "\n"
                                                                          : DateFormat.MMMMd().format(DateTime.parse(datalist.first.deliverydate.toString())) +
                                                                              "\n",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              kTextInputPlaceholderColor)),
                                                                  TextSpan(
                                                                      text:
                                                                          "BOOKING ID: ",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              kTextInputPlaceholderColor)),
                                                                  TextSpan(
                                                                      text: datalist
                                                                          .first
                                                                          .orderid,
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              kTextInputPlaceholderColor)),
                                                                  TextSpan(
                                                                      text:
                                                                          "\nOTP: ",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              kTextInputPlaceholderColor)),
                                                                  TextSpan(
                                                                      text: datalist[
                                                                              0]
                                                                          .otp,
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              kTextInputPlaceholderColor))
                                                                ])),
                                                            SizedBox(
                                                              height: h * 0.005,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            OrderDetails(
                                                                              ordersPlans: datalist.first.ordersPlans,
                                                                            )));
                                                              },
                                                              style: TextButton.styleFrom(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 0)),
                                                              child: Text(
                                                                "Order Details",
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        kTextInputPlaceholderColor),
                                                              ),
                                                            ),
                                                            // GestureDetector(
                                                            //   onTap: () {
                                                            //     Navigator.push(
                                                            //         context,
                                                            //         MaterialPageRoute(
                                                            //           builder: (context) => CarHealth(
                                                            //               id: datalist
                                                            //                   .first
                                                            //                   .id),
                                                            //         ));
                                                            //   },
                                                            //   child: RRectCard(
                                                            //     h: h * 0.04,
                                                            //     w: w * 0.24,
                                                            //     color: kGreenColor,
                                                            //     padding: EdgeInsets
                                                            //         .symmetric(
                                                            //             horizontal:
                                                            //                 w * 0.01),
                                                            //     widget: Center(
                                                            //       child: Text(
                                                            //         "Car Health ", //Analysis",
                                                            //         style: GoogleFonts.montserrat(
                                                            //             fontSize:
                                                            //                 11,
                                                            //             fontWeight:
                                                            //                 FontWeight
                                                            //                     .w700,
                                                            //             color:
                                                            //                 kwhitecolor),
                                                            //       ),
                                                            //     ),
                                                            //     borderRadius:
                                                            //         h * 0.04,
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                                "₹" +
                                                                    datalist
                                                                        .first
                                                                        .price,
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize:
                                                                        23,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color:
                                                                        kTextInputPlaceholderColor)),
                                                            RRecctButton(
                                                              text: datalist
                                                                          .first
                                                                          .paystatus ==
                                                                      "Deposited"
                                                                  ? "Paid"
                                                                  : datalist.first
                                                                              .paystatus ==
                                                                          "Failed"
                                                                      ? "Failed"
                                                                      : datalist
                                                                          .first
                                                                          .paystatus
                                                                          .toUpperCase(), //  "Pay Later",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: datalist
                                                                            .first
                                                                            .paystatus ==
                                                                        "Failed"
                                                                    ? kGreenColor
                                                                    : datalist.first.paystatus ==
                                                                            "Deposited"
                                                                        ? kredcolor
                                                                        : korangecolor,
                                                              ),
                                                              // buttonColor: datalist
                                                              //             .first
                                                              //             .paystatus ==
                                                              //         "Failed"
                                                              //     ? kGreenColor
                                                              //     : datalist.first
                                                              //                 .paystatus ==
                                                              //             "Deposited"
                                                              //         ? kredcolor
                                                              //         : korangecolor,
                                                              // w: w * 0.17,
                                                              h: h * 0.02,
                                                            ),
                                                            Visibility(
                                                              visible: datalist
                                                                  .first
                                                                  .invoice
                                                                  .isNotEmpty,
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  await launchURL(
                                                                      datalist
                                                                          .first
                                                                          .invoice);
                                                                },
                                                                child: Text(
                                                                    "View invoice",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        height:
                                                                            2,
                                                                        color:
                                                                            kTextInputPlaceholderColor)),
                                                              ),
                                                            ),
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
                                                    height: h * 0.13,
                                                    width: w * 0.3,
                                                    margin: EdgeInsets.only(
                                                        bottom: h * 0.01,
                                                        top: h * 0.01),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                datalist.first
                                                                    .carimage),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  RichText(
                                                      textAlign: TextAlign
                                                          .center,
                                                      text: TextSpan(
                                                          text: datalist.first
                                                                  .carname +
                                                              "  ",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 2,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                          children: [
                                                            TextSpan(
                                                                text: datalist
                                                                        .first
                                                                        .carbrand +
                                                                    " \n(" +
                                                                    datalist
                                                                        .first
                                                                        .fuelname +
                                                                    ") " +
                                                                    datalist
                                                                        .first
                                                                        .cityname,
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize:
                                                                        12,
                                                                    height: 1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        kTextInputPlaceholderColor)),
                                                          ])),
                                                  FittedBox(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          datalist[0]
                                                                  .ordersPlans[
                                                                      0]
                                                                  .planName
                                                                  .toString() +
                                                              "\n",
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 28,
                                                                  height: 1.5,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                        ),
                                                        Text(
                                                            datalist[0]
                                                                    .ordersPlans[
                                                                        0]
                                                                    .plansubName
                                                                    .toString() +
                                                                "\n",
                                                            textAlign: TextAlign
                                                                .center,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            // maxLines: 2,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        kTextInputPlaceholderColor)),
                                                        // Text(
                                                        //     "The package includes the use of 3M products and services",
                                                        //     textAlign:
                                                        //         TextAlign.center,
                                                        //     overflow: TextOverflow
                                                        //         .ellipsis,
                                                        //     // maxLines: 2,
                                                        //     style: GoogleFonts
                                                        //         .montserrat(
                                                        //             fontSize: 12,
                                                        //             // height: 2,
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .w400,
                                                        //             color: kTextInputPlaceholderColor
                                                        //                 .withOpacity(
                                                        //                     0.49))),
                                                      ],
                                                    ),
                                                  ),
                                                  RRectCard(
                                                    color: kbluecolor,
                                                    w: w * 0.6,
                                                    h: h * 0.05,
                                                    widget: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: h * 0.02,
                                                          backgroundColor:
                                                              const Color(
                                                                  0xFFFD440D),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                              h * 0.004,
                                                            ),
                                                            child: SvgPicture.asset(
                                                                "assets/svg/City.svg"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: w * 0.05,
                                                        ),
                                                        Text(
                                                          "Track Order"
                                                              .toUpperCase(),
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      kwhitecolor),
                                                        ),
                                                      ],
                                                    ),
                                                    borderRadius: h * 0.05,
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.01,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          w * 0.05),
                                                              child: TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      kbluecolor,
                                                                  shadowColor:
                                                                      kblackcolor
                                                                          .withOpacity(
                                                                              0.07),
                                                                  padding: EdgeInsets
                                                                      .all(h *
                                                                          0.012),
                                                                  elevation: 3,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(h *
                                                                            0.1),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => JobCard(
                                                                                orderid: datalist.first.id,
                                                                              )));
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star_border,
                                                                      size: h *
                                                                          0.025,
                                                                      color:
                                                                          kwhitecolor,
                                                                    ),
                                                                    Text(
                                                                      "Job Card",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              kwhitecolor),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "shows pre-inspection report",
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          w * 0.05),
                                                              child: TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      kGreenColor,
                                                                  shadowColor:
                                                                      kblackcolor
                                                                          .withOpacity(
                                                                              0.07),
                                                                  padding: EdgeInsets
                                                                      .all(h *
                                                                          0.012),
                                                                  elevation: 3,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(h *
                                                                            0.1),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => CarHealth(
                                                                                id: datalist.first.id,
                                                                              )));
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star_border,
                                                                      size: h *
                                                                          0.025,
                                                                      color:
                                                                          kwhitecolor,
                                                                    ),
                                                                    Text(
                                                                      "Health Card",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              kwhitecolor),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "shows overall health of car",
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Swiper(
                                itemCount: datalist.length,
                                layout: SwiperLayout.TINDER,
                                scrollDirection: Axis.horizontal,
                                axisDirection: AxisDirection.left,
                                allowImplicitScrolling: false,
                                itemWidth: w,
                                physics: const NeverScrollableScrollPhysics(),
                                loop: false,

                                itemHeight: h * 0.61,
                                onIndexChanged: (value) {
                                  setState(() {
                                    currentPage = value;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  OrderHistoryModel model = OrderHistoryModel();
                                  // int index = datalist.length-indexx-1;
                                  model = datalist[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Tracking(
                                                ordertime:
                                                    datalist[index].ordertime!,
                                                orderid: datalist[index].id,
                                                date: datalist[currentPage]
                                                    .deliverydate,
                                                time: datalist[currentPage]
                                                    .deliverytime),
                                          ));
                                    },
                                    child: Container(
                                      height: h * 0.6,
                                      margin: EdgeInsets.only(bottom: h * 0.01),
                                      // padding: EdgeInsets.symmetric(
                                      //   horizontal: w * 0.03,
                                      //   vertical: h * 0.03,
                                      // ),
                                      decoration: BoxDecoration(
                                          color: datalist[currentPage]
                                                          .status
                                                          .toLowerCase() ==
                                                      "in progress" ||
                                                  datalist[currentPage]
                                                          .status
                                                          .toLowerCase() ==
                                                      "inprogress"
                                              ? korangecolor
                                              : datalist[currentPage]
                                                          .status
                                                          .toLowerCase() ==
                                                      "completed"
                                                  ? kGreenColor
                                                  : kredcolor,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                spreadRadius: 1,
                                                offset: const Offset(0, 3),
                                                color: kshadowColor
                                                    .withOpacity(0.3))
                                          ],
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(h * 0.06),
                                            bottomLeft:
                                                Radius.circular(h * 0.06),
                                          )),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        h * 0.1))),
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.01),
                                            child: Text(
                                              datalist[currentPage].status !=
                                                          "" &&
                                                      datalist[currentPage]
                                                              .status !=
                                                          "null"
                                                  ? datalist[currentPage].status
                                                  : "Service Completed",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                  color: kwhitecolor),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: w,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: w * 0.0001),
                                              decoration: BoxDecoration(
                                                  color: kwhitecolor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        h * 0.02),
                                                    bottomLeft: Radius.circular(
                                                        h * 0.06),
                                                  )),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                w * 0.02),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: h * 0.01,
                                                            ),
                                                            RichText(
                                                                text: TextSpan(
                                                                    text:
                                                                        "DELIVERY DATE: ",
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color:
                                                                            kTextInputPlaceholderColor),
                                                                    children: [
                                                                  TextSpan(
                                                                      text: datalist[index].deliverydate.toString() == "null"
                                                                          ? "\n"
                                                                          : DateFormat.MMMMd().format(DateTime.parse(datalist[index].deliverydate.toString())) +
                                                                              "\n",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              kTextInputPlaceholderColor)),
                                                                  TextSpan(
                                                                      text:
                                                                          "BOOKING ID: ",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              kTextInputPlaceholderColor)),
                                                                  TextSpan(
                                                                      text: datalist[
                                                                              index]
                                                                          .orderid,
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              kTextInputPlaceholderColor)),
                                                                  TextSpan(
                                                                      text:
                                                                          "\nOTP: ",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              kTextInputPlaceholderColor)),
                                                                  TextSpan(
                                                                      text: datalist[
                                                                              index]
                                                                          .otp,
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          color:
                                                                              kTextInputPlaceholderColor))
                                                                ])),
                                                            SizedBox(
                                                              height: h * 0.005,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            OrderDetails(
                                                                              ordersPlans: datalist[index].ordersPlans,
                                                                            )));
                                                              },
                                                              style: TextButton.styleFrom(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 0)),
                                                              child: Text(
                                                                "Order Details",
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        kTextInputPlaceholderColor),
                                                              ),
                                                            ),
                                                            // GestureDetector(
                                                            //   onTap: () {
                                                            //     Navigator.push(
                                                            //         context,
                                                            //         MaterialPageRoute(
                                                            //           builder: (context) => CarHealth(
                                                            //               id: datalist
                                                            //                   [index]
                                                            //                   .id),
                                                            //         ));
                                                            //   },
                                                            //   child: RRectCard(
                                                            //     h: h * 0.04,
                                                            //     w: w * 0.24,
                                                            //     color: kGreenColor,
                                                            //     padding: EdgeInsets
                                                            //         .symmetric(
                                                            //             horizontal:
                                                            //                 w * 0.01),
                                                            //     widget: Center(
                                                            //       child: Text(
                                                            //         "Car Health ", //Analysis",
                                                            //         style: GoogleFonts.montserrat(
                                                            //             fontSize:
                                                            //                 11,
                                                            //             fontWeight:
                                                            //                 FontWeight
                                                            //                     .w700,
                                                            //             color:
                                                            //                 kwhitecolor),
                                                            //       ),
                                                            //     ),
                                                            //     borderRadius:
                                                            //         h * 0.04,
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                                "₹" +
                                                                    datalist[
                                                                            index]
                                                                        .price,
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize:
                                                                        23,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color:
                                                                        kTextInputPlaceholderColor)),
                                                            RRecctButton(
                                                              text: datalist[index]
                                                                          .paystatus ==
                                                                      "Deposited"
                                                                  ? "Paid"
                                                                  : datalist[index]
                                                                              .paystatus ==
                                                                          "Failed"
                                                                      ? "Failed"
                                                                      : datalist[
                                                                              index]
                                                                          .paystatus
                                                                          .toUpperCase(), //  "Pay Later",
                                                              style: GoogleFonts
                                                                  .montserrat(
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: datalist[index]
                                                                            .paystatus ==
                                                                        "Failed"
                                                                    ? kGreenColor
                                                                    : datalist[index].paystatus ==
                                                                            "Deposited"
                                                                        ? kredcolor
                                                                        : korangecolor,
                                                              ),
                                                              // buttonColor: datalist
                                                              //             [index]
                                                              //             .paystatus ==
                                                              //         "Failed"
                                                              //     ? kGreenColor
                                                              //     : datalist[index]
                                                              //                 .paystatus ==
                                                              //             "Deposited"
                                                              //         ? kredcolor
                                                              //         : korangecolor,
                                                              // w: w * 0.17,
                                                              h: h * 0.02,
                                                            ),
                                                            Visibility(
                                                              visible: datalist[
                                                                      index]
                                                                  .invoice
                                                                  .isNotEmpty,
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  await launchURL(
                                                                      datalist[
                                                                              index]
                                                                          .invoice);
                                                                },
                                                                child: Text(
                                                                    "View invoice",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        height:
                                                                            2,
                                                                        color:
                                                                            kTextInputPlaceholderColor)),
                                                              ),
                                                            ),
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
                                                    height: h * 0.13,
                                                    width: w * 0.3,
                                                    margin: EdgeInsets.only(
                                                        bottom: h * 0.01,
                                                        top: h * 0.01),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                datalist[index]
                                                                    .carimage),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                          text: datalist[index]
                                                                  .carname +
                                                              "  ",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 2,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                          children: [
                                                            TextSpan(
                                                                text: datalist[
                                                                            index]
                                                                        .carbrand +
                                                                    " \n(" +
                                                                    datalist[index]
                                                                        .fuelname +
                                                                    ") " +
                                                                    datalist[index]
                                                                        .cityname,
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize:
                                                                        12,
                                                                    height: 1,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        kTextInputPlaceholderColor)),
                                                          ])),
                                                  FittedBox(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          datalist[index]
                                                                  .ordersPlans[
                                                                      0]
                                                                  .planName
                                                                  .toString() +
                                                              "\n",
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 28,
                                                                  height: 1.5,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                        ),
                                                        Text(
                                                            datalist[index]
                                                                    .ordersPlans[
                                                                        0]
                                                                    .plansubName
                                                                    .toString() +
                                                                "\n",
                                                            textAlign: TextAlign
                                                                .center,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            // maxLines: 2,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        kTextInputPlaceholderColor)),
                                                        // Text(
                                                        //     "The package includes the use of 3M products and services",
                                                        //     textAlign:
                                                        //         TextAlign.center,
                                                        //     overflow: TextOverflow
                                                        //         .ellipsis,
                                                        //     // maxLines: 2,
                                                        //     style: GoogleFonts
                                                        //         .montserrat(
                                                        //             fontSize: 12,
                                                        //             // height: 2,
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .w400,
                                                        //             color: kTextInputPlaceholderColor
                                                        //                 .withOpacity(
                                                        //                     0.49))),
                                                      ],
                                                    ),
                                                  ),
                                                  RRectCard(
                                                    color: kbluecolor,
                                                    w: w * 0.6,
                                                    h: h * 0.05,
                                                    widget: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: h * 0.02,
                                                          backgroundColor:
                                                              const Color(
                                                                  0xFFFD440D),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                              h * 0.004,
                                                            ),
                                                            child: SvgPicture.asset(
                                                                "assets/svg/City.svg"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: w * 0.05,
                                                        ),
                                                        Text(
                                                          "Track Order"
                                                              .toUpperCase(),
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      kwhitecolor),
                                                        ),
                                                      ],
                                                    ),
                                                    borderRadius: h * 0.05,
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.01,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          w * 0.05),
                                                              child: TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      kbluecolor,
                                                                  shadowColor:
                                                                      kblackcolor
                                                                          .withOpacity(
                                                                              0.07),
                                                                  padding: EdgeInsets
                                                                      .all(h *
                                                                          0.012),
                                                                  elevation: 3,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(h *
                                                                            0.1),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => JobCard(
                                                                                orderid: datalist[index].id,
                                                                              )));
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star_border,
                                                                      size: h *
                                                                          0.025,
                                                                      color:
                                                                          kwhitecolor,
                                                                    ),
                                                                    Text(
                                                                      "Job Card",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              kwhitecolor),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "shows pre-inspection report",
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          w * 0.05),
                                                              child: TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      kGreenColor,
                                                                  shadowColor:
                                                                      kblackcolor
                                                                          .withOpacity(
                                                                              0.07),
                                                                  padding: EdgeInsets
                                                                      .all(h *
                                                                          0.012),
                                                                  elevation: 3,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(h *
                                                                            0.1),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => CarHealth(
                                                                                id: datalist[index].id,
                                                                              )));
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star_border,
                                                                      size: h *
                                                                          0.025,
                                                                      color:
                                                                          kwhitecolor,
                                                                    ),
                                                                    Text(
                                                                      "Health Card",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              kwhitecolor),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "shows overall health of car",
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Container(
                                    //   margin: EdgeInsets.only(bottom: h * 0.01),
                                    //   padding: EdgeInsets.symmetric(
                                    //       horizontal: w * 0.03,
                                    //       vertical: h * 0.03),
                                    //   decoration: BoxDecoration(
                                    //       color: kwhitecolor,
                                    //       boxShadow: [
                                    //         BoxShadow(
                                    //             blurRadius: 2,
                                    //             spreadRadius: 1,
                                    //             offset: const Offset(0, 3),
                                    //             color: kshadowColor
                                    //                 .withOpacity(0.3))
                                    //       ],
                                    //       borderRadius: BorderRadius.only(
                                    //         topRight: Radius.circular(h * 0.06),
                                    //         bottomLeft:
                                    //             Radius.circular(h * 0.06),
                                    //       )),
                                    //   child: Stack(
                                    //     children: [
                                    //       Column(
                                    //         children: [
                                    //           Padding(
                                    //             padding: EdgeInsets.symmetric(
                                    //                 horizontal: w * 0.02),
                                    //             child: Row(
                                    //               crossAxisAlignment:
                                    //                   CrossAxisAlignment.start,
                                    //               mainAxisAlignment:
                                    //                   MainAxisAlignment
                                    //                       .spaceBetween,
                                    //               children: [
                                    //                 Column(
                                    //                   crossAxisAlignment:
                                    //                       CrossAxisAlignment
                                    //                           .start,
                                    //                   children: [
                                    //                     RichText(
                                    //                         text: TextSpan(
                                    //                             text:
                                    //                                 "DELIVERY DATE: ",
                                    //                             style: GoogleFonts.montserrat(
                                    //                                 fontSize: 8,
                                    //                                 fontWeight:
                                    //                                     FontWeight
                                    //                                         .w400,
                                    //                                 color:
                                    //                                     kTextInputPlaceholderColor),
                                    //                             children: [
                                    //                           TextSpan(
                                    //                               text: model.deliverydate.toString() ==
                                    //                                       "null"
                                    //                                   ? "\n"
                                    //                                   : DateFormat.MMMMd().format(DateTime.parse(model
                                    //                                           .deliverydate
                                    //                                           .toString())) +
                                    //                                       "\n",
                                    //                               style: GoogleFonts.montserrat(
                                    //                                   fontSize:
                                    //                                       8,
                                    //                                   fontWeight:
                                    //                                       FontWeight
                                    //                                           .w700,
                                    //                                   color:
                                    //                                       kTextInputPlaceholderColor)),
                                    //                           TextSpan(
                                    //                               text:
                                    //                                   "BOOKING ID: ",
                                    //                               style: GoogleFonts.montserrat(
                                    //                                   fontSize:
                                    //                                       8,
                                    //                                   fontWeight:
                                    //                                       FontWeight
                                    //                                           .w400,
                                    //                                   color:
                                    //                                       kTextInputPlaceholderColor)),
                                    //                           TextSpan(
                                    //                               text: model
                                    //                                   .orderid,
                                    //                               style: GoogleFonts.montserrat(
                                    //                                   fontSize:
                                    //                                       8,
                                    //                                   fontWeight:
                                    //                                       FontWeight
                                    //                                           .w700,
                                    //                                   color:
                                    //                                       kTextInputPlaceholderColor))
                                    //                         ])),
                                    //                     SizedBox(
                                    //                       height: h * 0.005,
                                    //                     ),
                                    //                     TextButton(
                                    //                       onPressed: () {
                                    //                         Navigator.push(
                                    //                             context,
                                    //                             MaterialPageRoute(
                                    //                                 builder:
                                    //                                     (context) =>
                                    //                                         OrderDetails(
                                    //                                           ordersPlans: datalist[index].ordersPlans,
                                    //                                         )));
                                    //                       },
                                    //                       style: TextButton.styleFrom(
                                    //                           padding:
                                    //                               const EdgeInsets
                                    //                                       .only(
                                    //                                   left: 0)),
                                    //                       child: Text(
                                    //                         "Order Details",
                                    //                         style: GoogleFonts
                                    //                             .montserrat(
                                    //                                 fontSize:
                                    //                                     18,
                                    //                                 fontWeight:
                                    //                                     FontWeight
                                    //                                         .w500,
                                    //                                 color:
                                    //                                     kTextInputPlaceholderColor),
                                    //                       ),
                                    //                     ),
                                    //                     // GestureDetector(
                                    //                     //   onTap: () {
                                    //                     //     Navigator.push(
                                    //                     //         context,
                                    //                     //         MaterialPageRoute(
                                    //                     //           builder: (context) =>
                                    //                     //               CarHealth(
                                    //                     //                   id: datalist[index].id),
                                    //                     //         ));
                                    //                     //   },
                                    //                     //   child: RRectCard(
                                    //                     //     h: h * 0.04,
                                    //                     //     w: w * 0.24,
                                    //                     //     color:
                                    //                     //         kGreenColor,
                                    //                     //     padding: EdgeInsets
                                    //                     //         .symmetric(
                                    //                     //             horizontal:
                                    //                     //                 w * 0.01),
                                    //                     //     widget: Center(
                                    //                     //       child: Text(
                                    //                     //         "Car Health ", //Analysis",
                                    //                     //         style: GoogleFonts.montserrat(
                                    //                     //             fontSize:
                                    //                     //                 11,
                                    //                     //             fontWeight:
                                    //                     //                 FontWeight
                                    //                     //                     .w700,
                                    //                     //             color:
                                    //                     //                 kwhitecolor),
                                    //                     //       ),
                                    //                     //     ),
                                    //                     //     borderRadius:
                                    //                     //         h * 0.04,
                                    //                     //   ),
                                    //                     // ),
                                    //                   ],
                                    //                 ),
                                    //                 Column(
                                    //                   crossAxisAlignment:
                                    //                       CrossAxisAlignment
                                    //                           .end,
                                    //                   children: [
                                    //                     Text("₹" + model.price,
                                    //                         style: GoogleFonts
                                    //                             .montserrat(
                                    //                                 fontSize:
                                    //                                     19,
                                    //                                 fontWeight:
                                    //                                     FontWeight
                                    //                                         .w700,
                                    //                                 color:
                                    //                                     kTextInputPlaceholderColor)),
                                    //                     RRecctButton(
                                    //                       text: datalist[index]
                                    //                                   .paystatus ==
                                    //                               "Deposited"
                                    //                           ? "Paid"
                                    //                           : datalist[index]
                                    //                                       .paystatus ==
                                    //                                   "Failed"
                                    //                               ? "Failed"
                                    //                               : datalist[
                                    //                                       index]
                                    //                                   .paystatus
                                    //                                   .toUpperCase(), //  "Pay Later",
                                    //                       style: GoogleFonts
                                    //                           .montserrat(
                                    //                               fontSize: 9,
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w700,
                                    //                               color:
                                    //                                   kwhitecolor),
                                    //                       buttonColor: datalist[
                                    //                                       index]
                                    //                                   .paystatus ==
                                    //                               "Failed"
                                    //                           ? kGreenColor
                                    //                           : datalist[index]
                                    //                                       .paystatus ==
                                    //                                   "Deposited"
                                    //                               ? kredcolor
                                    //                               : korangecolor,
                                    //                       w: w * 0.17,
                                    //                       h: h * 0.03,
                                    //                     ),
                                    //                     Visibility(
                                    //                       visible: model.invoice
                                    //                           .isNotEmpty,
                                    //                       child:
                                    //                           GestureDetector(
                                    //                         onTap: () async {
                                    //                           await launchURL(
                                    //                               model
                                    //                                   .invoice);
                                    //                           // await launch(
                                    //                           //   model.invoice,
                                    //                           //   forceWebView: true,
                                    //                           //   enableJavaScript: true,
                                    //                           //   enableDomStorage: true
                                    //                           // );
                                    //                         },
                                    //                         child: Text(
                                    //                             "View invoice",
                                    //                             textAlign:
                                    //                                 TextAlign
                                    //                                     .center,
                                    //                             style: GoogleFonts.montserrat(
                                    //                                 fontSize:
                                    //                                     14,
                                    //                                 fontWeight:
                                    //                                     FontWeight
                                    //                                         .w500,
                                    //                                 height: 2,
                                    //                                 color:
                                    //                                     kTextInputPlaceholderColor)),
                                    //                       ),
                                    //                     ),
                                    //                   ],
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           ),
                                    //           // Image.asset(
                                    //           //   "assets/images/Uber.png",
                                    //           //   height: h * 0.15,
                                    //           // ),
                                    //           Container(
                                    //             height: h * 0.13,
                                    //             width: w * 0.3,
                                    //             margin: EdgeInsets.only(
                                    //               bottom: h * 0.01,
                                    //             ),
                                    //             decoration: BoxDecoration(
                                    //                 shape: BoxShape.circle,
                                    //                 image: DecorationImage(
                                    //                     image: NetworkImage(
                                    //                         model.carimage),
                                    //                     fit: BoxFit.fill)),
                                    //           ),
                                    //           RichText(
                                    //               textAlign: TextAlign.center,
                                    //               text: TextSpan(
                                    //                   text:
                                    //                       model.carname + "  ",
                                    //                   style: GoogleFonts.montserrat(
                                    //                       fontSize: 12,
                                    //                       fontWeight:
                                    //                           FontWeight.w700,
                                    //                       height: 2,
                                    //                       color:
                                    //                           kTextInputPlaceholderColor),
                                    //                   children: [
                                    //                     TextSpan(
                                    //                         text: datalist[
                                    //                                     index]
                                    //                                 .carbrand +
                                    //                             " (" +
                                    //                             datalist[index]
                                    //                                 .fuelname +
                                    //                             ") \n" +
                                    //                             // "Venkatanarasimharajuvaripeta"
                                    //                             datalist[index]
                                    //                                 .cityname,
                                    //                         // "Hyundai",
                                    //                         style: GoogleFonts
                                    //                             .montserrat(
                                    //                                 fontSize:
                                    //                                     12,
                                    //                                 fontWeight:
                                    //                                     FontWeight
                                    //                                         .w400,
                                    //                                 color:
                                    //                                     kTextInputPlaceholderColor)),
                                    //                   ])),
                                    //           Image.asset(
                                    //             "assets/images/Order.png",
                                    //             height: h * 0.15,
                                    //           ),
                                    //           FittedBox(
                                    //             child: Column(
                                    //               children: [
                                    //                 Text(
                                    //                   datalist[index]
                                    //                           .ordersPlans[0]
                                    //                           .planName
                                    //                           .toString() +
                                    //                       "\n",
                                    //                   textAlign:
                                    //                       TextAlign.center,
                                    //                   overflow:
                                    //                       TextOverflow.ellipsis,
                                    //                   maxLines: 1,
                                    //                   style: GoogleFonts.montserrat(
                                    //                       fontSize: 28,
                                    //                       fontWeight:
                                    //                           FontWeight.w700,
                                    //                       color:
                                    //                           kTextInputPlaceholderColor),
                                    //                 ),
                                    //                 Text(
                                    //                     datalist[index]
                                    //                             .ordersPlans[0]
                                    //                             .plansubName
                                    //                             .toString() +
                                    //                         "\n",
                                    //                     textAlign:
                                    //                         TextAlign.center,
                                    //                     overflow: TextOverflow
                                    //                         .ellipsis,
                                    //                     // maxLines: 2,
                                    //                     style: GoogleFonts
                                    //                         .montserrat(
                                    //                             fontSize: 11,
                                    //                             fontWeight:
                                    //                                 FontWeight
                                    //                                     .w400,
                                    //                             color:
                                    //                                 kTextInputPlaceholderColor)),
                                    //                 // Text(
                                    //                 //     "The package includes the use of 3M products and services",
                                    //                 //     textAlign: TextAlign
                                    //                 //         .center,
                                    //                 //     overflow:
                                    //                 //         TextOverflow
                                    //                 //             .ellipsis,
                                    //                 //     // maxLines: 2,
                                    //                 //     style: GoogleFonts
                                    //                 //         .montserrat(
                                    //                 //             fontSize:
                                    //                 //                 12,
                                    //                 //             // height: 2,
                                    //                 //             fontWeight:
                                    //                 //                 FontWeight
                                    //                 //                     .w400,
                                    //                 //             color: kTextInputPlaceholderColor
                                    //                 //                 .withOpacity(
                                    //                 //                     0.49))),
                                    //               ],
                                    //             ),
                                    //           ),

                                    //           // RichText(
                                    //           //     textAlign: TextAlign
                                    //           //         .center,
                                    //           //     text: TextSpan(
                                    //           //         text: datalist[index]

                                    //           //                   .ordersPlans[0].planName.toString() +
                                    //           //             "\n",
                                    //           //         style: GoogleFonts
                                    //           //             .montserrat(
                                    //           //                 fontSize: 32,
                                    //           //                 fontWeight:
                                    //           //                     FontWeight
                                    //           //                         .w700,
                                    //           //                 color:
                                    //           //                     kTextInputPlaceholderColor),
                                    //           //         children: [
                                    //           //           TextSpan(
                                    //           //               text: datalist[index]

                                    //           //                   .ordersPlans[0].plansubName.toString() +
                                    //           //                   "\n",
                                    //           //               style: GoogleFonts.montserrat(
                                    //           //                   fontSize:
                                    //           //                       11,
                                    //           //                   fontWeight:
                                    //           //                       FontWeight
                                    //           //                           .w400,
                                    //           //                   color:
                                    //           //                       kTextInputPlaceholderColor)),
                                    //           //           TextSpan(
                                    //           //               text:
                                    //           //                   "The package includes the use of 3M products and services",
                                    //           //               style: GoogleFonts.montserrat(
                                    //           //                   fontSize:
                                    //           //                       12,
                                    //           //                   height: 2,
                                    //           //                   fontWeight:
                                    //           //                       FontWeight
                                    //           //                           .w400,
                                    //           //                   color: kTextInputPlaceholderColor
                                    //           //                       .withOpacity(
                                    //           //                           0.49))),
                                    //           //         ])),
                                    //         ],
                                    //       ),
                                    //       Positioned(
                                    //         bottom: 0,
                                    //         left: w * 0.02,
                                    //         child: TextButton(
                                    //           style: TextButton.styleFrom(
                                    //             backgroundColor: kbluecolor,
                                    //             shadowColor: kblackcolor
                                    //                 .withOpacity(0.07),
                                    //             padding:
                                    //                 EdgeInsets.all(h * 0.012),
                                    //             elevation: 3,
                                    //             shape: RoundedRectangleBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       h * 0.1),
                                    //             ),
                                    //           ),
                                    //           onPressed: () {
                                    //             Navigator.push(
                                    //                 context,
                                    //                 MaterialPageRoute(
                                    //                     builder: (context) =>
                                    //                         JobCard(
                                    //                           orderid: datalist[
                                    //                                   index]
                                    //                               .id,
                                    //                         )));
                                    //           },
                                    //           child: Text(
                                    //             "Job Card",
                                    //             style: GoogleFonts.montserrat(
                                    //                 fontSize: 12,
                                    //                 fontWeight: FontWeight.w500,
                                    //                 color: kwhitecolor),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       Positioned(
                                    //         bottom: 0,
                                    //         right: w * 0.02,
                                    //         child: TextButton(
                                    //           style: TextButton.styleFrom(
                                    //             backgroundColor: kbluecolor,
                                    //             shadowColor: kblackcolor
                                    //                 .withOpacity(0.07),
                                    //             padding:
                                    //                 EdgeInsets.all(h * 0.012),
                                    //             elevation: 3,
                                    //             shape: RoundedRectangleBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       h * 0.1),
                                    //             ),
                                    //           ),
                                    //           onPressed: () {
                                    //             Navigator.push(
                                    //                 context,
                                    //                 MaterialPageRoute(
                                    //                     builder: (context) =>
                                    //                         CarHealth(
                                    //                           id: datalist[
                                    //                                   index]
                                    //                               .id,
                                    //                         )));
                                    //           },
                                    //           child: Text(
                                    //             "Car Health",
                                    //             style: GoogleFonts.montserrat(
                                    //                 fontSize: 12,
                                    //                 fontWeight: FontWeight.w500,
                                    //                 color: kwhitecolor),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  );
                                },

                                // pagination: const SwiperPagination(
                                //     alignment: Alignment.bottomCenter,
                                //     builder: SwiperPagination.dots),
                              ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                        ),
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
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) => BottomNavBar(
                                  index: 0,
                                ),
                              ),
                              (route) =>
                                  false, //if you want to disable back feature set to false
                            );
                            // showdialog();
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
