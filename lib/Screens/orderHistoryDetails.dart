import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/Service%20Main/payment.dart';

import 'package:cityofcars/Screens/bottomnavBar.dart';

import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Buttons/button.dart';
import '../Services/models/orderhistoryModel.dart';

class OrderDetails extends StatefulWidget {
  List<OrdersPlans> ordersPlans;
  OrderDetails({Key? key, required this.ordersPlans}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var h;
  var w;
  String dropdownvalue = '';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];
  int dropvalue = 0;
  List data = [];
  String _null = "";
  double subtotal = 0;
  int whichindex = 0;
  ScrollController _scrollController = ScrollController();
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.ordersPlans.length; i++) {
      totalvalue(double.parse(widget.ordersPlans[i].planPrice.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        centerTitle: false,
        foregroundColor: kblackcolor,
        title: Text(
          "Order Details",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.ordersPlans.length,
              itemBuilder: (context, index) {
                OrdersPlans order = widget.ordersPlans[index];

                return GestureDetector(
                  onTap: () {
                    dropvalue = 0;
                    setState(() {});
                  },
                  child: Container(
                    // height: dropvalue == index + 1 ? h * 0.35 : h * 0.18,
                    decoration: BoxDecoration(
                        color: kwhitecolor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(h * 0.015),
                            bottomLeft: Radius.circular(h * 0.015))),
                    margin: EdgeInsets.only(
                      top: h * 0.018,
                      left: w * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.06, vertical: h * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "Basic Plan",
                                    order.planName.toString(),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    // "Service Pack",
                                    order.plansubName.toString(),
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.6)),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "₹" + order.planPrice.toString(),
                                    // data[index]["selectplan"]
                                    //             [0][
                                    //         "typeprice"]
                                    //     .toString(),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Incl. Taxes",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600,
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.48)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.08, bottom: h * 0.01),
                          child: Text(
                            "Takes ${order.hour} Hrs / Every ${order.month} Months",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 7,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.6)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Visibility(
                                //   visible: dropvalue != index + 1,
                                //   child: Expanded(
                                //     child: Container(
                                //       color: kLightOrangeBgColor,
                                //       height: h * 0.055,
                                //       // width: w * 0.7,
                                //       margin:
                                //           EdgeInsets.only(right: w * 0.03),
                                //       padding: EdgeInsets.all(h * 0.005),
                                //       child: Row(
                                //         children: [
                                //           ListView.builder(
                                //             itemCount:
                                //                 // order
                                //                 //     .list!
                                //                 //     .length,
                                //                 order.list!.length > 3
                                //                     ? 3
                                //                     : order.list!.length,
                                //             scrollDirection: Axis.horizontal,
                                //             shrinkWrap: true,
                                //             physics:
                                //                 const NeverScrollableScrollPhysics(),
                                //             itemBuilder: (context, indexx) {
                                //               return Container(
                                //                 width: w * 0.16,
                                //                 padding: EdgeInsets.symmetric(
                                //                     horizontal: w * 0.02),
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment
                                //                           .start,
                                //                   children: [
                                //                     CachedNetworkImage(
                                //                       fit: BoxFit.fill,
                                //                       height: h * 0.03,
                                //                       imageUrl: order
                                //                           .list![indexx].image
                                //                           .toString(), //data[index]["Plans"]["services_id"][indexx]["image"].toString(),
                                //                       placeholder:
                                //                           (context, url) =>
                                //                               Container(),
                                //                       errorWidget: (context,
                                //                               url, error) =>
                                //                           const Icon(Icons
                                //                               .error_outline_rounded),
                                //                     ),
                                //                     Text(
                                //                       // data[index]["Plans"]["services_id"][indexx]["title"] ?? "",
                                //                       order.list![indexx].name
                                //                           .toString(),
                                //                       overflow: TextOverflow
                                //                           .ellipsis,
                                //                       // "Engine Oil ",
                                //                       // textScaleFactor: 0.7,
                                //                       style: GoogleFonts.montserrat(
                                //                           fontSize: 8,
                                //                           fontWeight:
                                //                               FontWeight.w600,
                                //                           color:
                                //                               kTextInputPlaceholderColor
                                //                                   .withOpacity(
                                //                                       0.6)),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               );
                                //             },
                                //           ),
                                //           SizedBox(
                                //             width: w * 0.02,
                                //           ),
                                //           Visibility(
                                //             visible: order.list!.length > 3,
                                //             child: Text(
                                //                 "+${order.list!.length - 3} more",
                                //                 style: GoogleFonts.montserrat(
                                //                   fontSize: 7,
                                //                   fontWeight: FontWeight.w600,
                                //                 )),
                                //           ),
                                //           const Icon(Icons.arrow_forward_ios,
                                //               size: 10),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Visibility(
                                  // visible: dropvalue == index + 1,
                                  child: Expanded(
                                    flex: 3,
                                    child: GestureDetector(
                                      onTap: (() {
                                        dropvalue = 0;

                                        setState(() {});
                                      }),
                                      child: Container(
                                        color: kLightOrangeBgColor,
                                        // height: h * 0.055,
                                        // width: w * 0.6,
                                        margin:
                                            EdgeInsets.only(right: w * 0.03),
                                        padding: EdgeInsets.all(h * 0.005),
                                        child: GridView.count(
                                            crossAxisSpacing: 1,
                                            mainAxisSpacing: 2,
                                            crossAxisCount: 4,
                                            childAspectRatio: 1.6,
                                            shrinkWrap: true,
                                            padding:
                                                EdgeInsets.only(top: h * 0.01),
                                            children: List.generate(
                                                order.list!.length, (indexx) {
                                              return Column(
                                                children: [
                                                  CachedNetworkImage(
                                                    fit: BoxFit.fill,
                                                    height: h * 0.03,
                                                    imageUrl: order
                                                        .list![indexx].image
                                                        .toString(),
                                                    placeholder:
                                                        (context, url) =>
                                                            Container(),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Image.network(
                                                            "https://i.gifer.com/DKke.gif"),
                                                  ),
                                                  // Image.asset(
                                                  //   "assets/images/EngineOil.png",
                                                  //   height: h * 0.03,
                                                  // ),
                                                  Text(
                                                    order.list![indexx].name
                                                        .toString(),
                                                    // "Engine Oil ",
                                                    // textScaleFactor: 0.7,
                                                    style: GoogleFonts.montserrat(
                                                        fontSize: 8,
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        color:
                                                            kTextInputPlaceholderColor
                                                                .withOpacity(
                                                                    0.6)),
                                                  ),
                                                ],
                                              );
                                            })),
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: w * 0.1,
                                // )
                              ]),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: kwhitecolor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(h * 0.015),
                    bottomLeft: Radius.circular(h * 0.015))),
            margin: EdgeInsets.only(
              top: h * 0.018,
              left: w * 0.02,
            ),
            padding:
                EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.06),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(widget.ordersPlans.isEmpty ? "₹ 0" : "₹ $subtotal",
                            style: GoogleFonts.montserrat(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Incl. Taxes",
                            style: GoogleFonts.montserrat(
                              color: ksubHading,
                              fontSize: 6,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: h * 0.03,
          // ),
          // Center(
          //   child: RRecctButton(
          //     onTap: () {
          //       // proceed();
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => const Payment()));
          //     },
          //     buttonColor: korangecolor,
          //     text: "Proceed".toUpperCase(),
          //     h: h * 0.06,
          //     w: w * 0.9,
          //     style: GoogleFonts.montserrat(
          //       color: kwhitecolor,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: h * 0.04,
          ),
        ],
      ),
    );
  }

  totalvalue(double price) {
    subtotal = subtotal + price;
    print(subtotal);
  }
}
