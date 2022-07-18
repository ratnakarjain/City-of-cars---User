import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/Service%20Main/payment.dart';

import 'package:cityofcars/Screens/bottomnavBar.dart';

import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../Utils/Buttons/button.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key? key, }) : super(key: key);

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
          "Cart",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:  ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return  Container(
                                child: GestureDetector(
                                  onTap: () {
                                    dropvalue = 0;
                                    setState(() {});
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: dropvalue == index + 1
                                            ? h * 0.35
                                            : h * 0.18,
                                        decoration: BoxDecoration(
                                            color: kwhitecolor,
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(h * 0.015),
                                                bottomLeft: Radius.circular(
                                                    h * 0.015))),
                                        margin: EdgeInsets.only(
                                          top: h * 0.018,
                                          left: w * 0.02,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.06,
                                                  vertical: h * 0.01),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Basic Plan",
                                                        // data[index]
                                                        //         ["selectplan"]
                                                        //     [0]["planName"],
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Service Pack",
                                                        style: GoogleFonts.montserrat(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                kTextInputPlaceholderColor
                                                                    .withOpacity(
                                                                        0.6)),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "₹" +"2198",
                                                            // data[index]["selectplan"]
                                                            //             [0][
                                                            //         "typeprice"]
                                                            //     .toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Incl. Taxes",
                                                        style: GoogleFonts.montserrat(
                                                            fontSize: 7,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                kTextInputPlaceholderColor
                                                                    .withOpacity(
                                                                        0.48)),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: w * 0.08,
                                                  bottom: h * 0.01),
                                              child: Text(
                                               "Takes 2 Hrs / Every 7 Months",
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 7,
                                                    color:
                                                        kTextInputPlaceholderColor
                                                            .withOpacity(0.6)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.06),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: 
                                                      // data[index]["Plans"]
                                                      //                 [
                                                      //                 "services_id"]
                                                      //             .length <=
                                                              // 3
                                                          // ? 
                                                          () {},
                                                          // : () {
                                                          //     dropvalue =
                                                          //         index + 1;
                                                           
                                                          //     setState(() {});
                                                          //   },
                                                      child: Container(
                                                        color:
                                                            kLightOrangeBgColor,
                                                        height: h * 0.055,
                                                        width: w * 0.6,
                                                        margin: EdgeInsets.only(
                                                            right: w * 0.03),
                                                        padding: EdgeInsets.all(
                                                            h * 0.005),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                                // key: keys[index],
                                                                width: w * 0.55,
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Center(
                                                                            child:
                                                                                ListView.builder(
                                                                              itemCount: 3,  //data[index]["Plans"]["services_id"].length > 3 ? 3 : data[index]["Plans"]["services_id"].length,
                                                                              scrollDirection: Axis.horizontal,
                                                                              shrinkWrap: true,
                                                                              physics: const NeverScrollableScrollPhysics(),
                                                                              itemBuilder: (context, indexx) {
                                                                                return Padding(
                                                                                  padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                                                                                  child: Column(
                                                                                    children: [
                                                                                      CachedNetworkImage(
                                                                                        fit: BoxFit.fill,
                                                                                        height: h * 0.03,
                                                                                        imageUrl: "",//data[index]["Plans"]["services_id"][indexx]["image"].toString(),
                                                                                        placeholder: (context, url) => Container(),
                                                                                        errorWidget: (context, url, error) => const Icon(Icons.error_outline_rounded),
                                                                                      ),
                                                                                      
                                                                                      Text(
                                                                                        // data[index]["Plans"]["services_id"][indexx]["title"] ?? "",
                                                                                        "ubvcib",
                                                                                        // "Engine Oil ",
                                                                                        // textScaleFactor: 0.7,
                                                                                        style: GoogleFonts.montserrat(fontSize: 8, fontWeight: FontWeight.w600, color: kTextInputPlaceholderColor.withOpacity(0.6)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                w * 0.02,
                                                                          ),
                                                                          Visibility(
                                                                            visible:true,
                                                                                // data[index]["Plans"]["services_id"].length > 3,
                                                                            child: Text(
                                                                              "+9 more",
                                                                                style: GoogleFonts.montserrat(
                                                                                  fontSize: 7,
                                                                                  fontWeight: FontWeight.w600,
                                                                                )),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const Icon(
                                                                        Icons
                                                                            .arrow_forward_ios,
                                                                        size:
                                                                            10),
                                                                  ],
                                                                ))
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
                                      ),
                                      Visibility(
                                        visible: dropvalue == index + 1,
                                        child: Positioned(
                                          left: w * 0.08,
                                          top: h * 0.1,
                                          child: Container(
                                            width: w * 0.6,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 3,
                                                      color: kblackcolor
                                                          .withOpacity(0.2))
                                                ]),
                                            child: GridView.count(
                                                crossAxisSpacing: 1,
                                                mainAxisSpacing: 2,
                                                crossAxisCount: 3,
                                                childAspectRatio: 1.6,
                                                shrinkWrap: true,
                                                padding: EdgeInsets.only(
                                                  top: h*0.01
                                                ),
                                                children: List.generate(
                                                  3,
                                                    // data[index]["Plans"]
                                                    //         ["services_id"]
                                                    //     .length,
                                                         (indexx) {
                                                  return Column(
                                                    children: [
                                                      CachedNetworkImage(
                                                        fit: BoxFit.fill,
                                                        height: h * 0.03,
                                                        imageUrl:"",
                                                        //  data[index][
                                                        //                 "Plans"]
                                                        //             [
                                                        //             "services_id"]
                                                        //         [
                                                        //         indexx]["image"]
                                                        //     .toString(),
                                                        placeholder:
                                                            (context, url) =>
                                                                Container(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                                Icon(Icons.error)
                                                            // Image.network(
                                                            //     "https://i.gifer.com/DKke.gif"),
                                                      ),
                                                      // Image.asset(
                                                      //   "assets/images/EngineOil.png",
                                                      //   height: h * 0.03,
                                                      // ),
                                                      Text(
                                                        "iecgv",
                                                        // data[index]["Plans"][
                                                        //             "services_id"]
                                                        //         [
                                                        //         indexx]["title"]
                                                        //     .toString(),
                                                        // "Engine Oil ",
                                                        // textScaleFactor: 0.7,
                                                        style: GoogleFonts.montserrat(
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w600,
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
              padding: EdgeInsets.symmetric(
                  vertical: h * 0.02, horizontal: w * 0.06),
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
                          Text( data.isEmpty?"₹ 0": "₹ $subtotal",
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
            SizedBox(
              height: h * 0.03,
            ),
            Center(
              child: RRecctButton(
                onTap: () {
                  // proceed();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Payment()));
                },
                buttonColor: korangecolor,
                text: "Proceed".toUpperCase(),
                h: h * 0.06,
                w: w * 0.9,
                style: GoogleFonts.montserrat(
                  color: kwhitecolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  totalvalue(double price) {
    subtotal = subtotal + price;
    print(subtotal);
  }

  
  

}
