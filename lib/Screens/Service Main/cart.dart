import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/Service%20Main/payment.dart';
import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Services/models/plansModel.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Services/servies.dart';
import '../../Utils/Buttons/button.dart';

class Cart extends StatefulWidget {
  static Packes packe =Packes();
   Cart({Key? key, }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
    // TODO: implement initState
    fecthdata().whenComplete(() {
      if (data.isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          print("typeprice "+data[i]["selectplan"][0]["typeprice"].toString()+"^^");
          totalvalue(double.parse(data[i]["selectplan"][0]["typeprice"].toString()));
        }
        setState(() {});
      }
    });
    super.initState();
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
              child: data.isEmpty
                  ? _null != ""
                      ? Center(
                          child: Text(_null),
                        )
                      : loder
                  : ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return isloading && index == whichindex
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: loder,
                              )
                            : Container(
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
                                            : h * 0.17,
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
                                                        data[index]["selectplan"][0]
                                                            ["planName"],
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
                                                        "₹" +
                                                            data[index]["selectplan"][0]
                                                                    [
                                                                    "typeprice"]
                                                                .toString(),
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
                                                "Takes ${data[index]["Plans"]["hours"]} Hrs / Every ${data[index]["Plans"]["hours"]} Months",
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
                                                    // Container(
                                                    //   color: kLightOrangeBgColor,
                                                    //   padding: EdgeInsets.all(h * 0.005),
                                                    //   child: Row(
                                                    //     children: [
                                                    //       Padding(
                                                    //         padding: EdgeInsets.symmetric(
                                                    //             horizontal: h * 0.005),
                                                    //         child: Column(
                                                    //           mainAxisAlignment:
                                                    //               MainAxisAlignment.spaceBetween,
                                                    //           children: [
                                                    //             Image.asset(
                                                    //               "assets/images/EngineOil.png",
                                                    //               height: h * 0.03,
                                                    //             ),
                                                    //             Text(
                                                    //               "Engine Oil",
                                                    //               textScaleFactor: 0.7,
                                                    //               style: GoogleFonts.montserrat(
                                                    //                   fontWeight: FontWeight.w500,
                                                    //                   color: kTextInputPlaceholderColor
                                                    //                       .withOpacity(0.6)),
                                                    //             ),
                                                    //           ],
                                                    //         ),
                                                    //       ),
                                                    //       Padding(
                                                    //         padding: EdgeInsets.symmetric(
                                                    //             horizontal: h * 0.005),
                                                    //         child: Column(
                                                    //           mainAxisAlignment:
                                                    //               MainAxisAlignment.spaceBetween,
                                                    //           children: [
                                                    //             Image.asset(
                                                    //               "assets/images/oifilter.png",
                                                    //               height: h * 0.03,
                                                    //             ),
                                                    //             Text(
                                                    //               "Oil Filter",
                                                    //               textScaleFactor: 0.7,
                                                    //               style: GoogleFonts.montserrat(
                                                    //                   fontWeight: FontWeight.w500,
                                                    //                   color: kTextInputPlaceholderColor
                                                    //                       .withOpacity(0.6)),
                                                    //             ),
                                                    //           ],
                                                    //         ),
                                                    //       ),
                                                    //       Padding(
                                                    //         padding: EdgeInsets.symmetric(
                                                    //             horizontal: h * 0.005),
                                                    //         child: Column(
                                                    //           children: [
                                                    //             Image.asset(
                                                    //               "assets/images/wind.png",
                                                    //               height: h * 0.03,
                                                    //             ),
                                                    //             Text(
                                                    //               "Air Filter",
                                                    //               textScaleFactor: 0.7,
                                                    //               style: GoogleFonts.montserrat(
                                                    //                   fontWeight: FontWeight.w500,
                                                    //                   color: kTextInputPlaceholderColor
                                                    //                       .withOpacity(0.6)),
                                                    //             ),
                                                    //           ],
                                                    //         ),
                                                    //       ),
                                                    //       InkWell(
                                                    //         onTap: () {},
                                                    //         child: Row(
                                                    //           children: [
                                                    //             Text("+9 more",
                                                    //                 textScaleFactor: 0.7,
                                                    //                 style: GoogleFonts.montserrat(
                                                    //                   fontWeight: FontWeight.w500,
                                                    //                 )),
                                                    //             Icon(Icons.arrow_forward_ios,
                                                    //                 size: h * 0.015),
                                                    //           ],
                                                    //         ),
                                                    //       ),
                                                    //     ],
                                                    //   ),
                                                    // ),
                                                    // Container(
                                                    //   color: kLightOrangeBgColor,
                                                    //   height: h * 0.06,
                                                    //   width: w * 0.6,
                                                    //   margin: EdgeInsets.only(
                                                    //       right: w * 0.03),
                                                    //   padding:
                                                    //       EdgeInsets.all(h * 0.005),
                                                    //   child:
                                                    //       DropdownButtonHideUnderline(
                                                    //     child: (DropdownButton(
                                                    //       hint: SizedBox(
                                                    //         width: w * 0.5,
                                                    //         child: Row(
                                                    //           mainAxisAlignment:
                                                    //               MainAxisAlignment
                                                    //                   .spaceBetween,
                                                    //           children: [
                                                    //             Column(
                                                    //               children: [
                                                    //                 Image.asset(
                                                    //                   "assets/images/EngineOil.png",
                                                    //                   height: h * 0.03,
                                                    //                 ),
                                                    //                 Text(
                                                    //                   "Engine Oil ",
                                                    //                   // textScaleFactor: 0.7,
                                                    //                   style: GoogleFonts.montserrat(
                                                    //                       fontSize: 8,
                                                    //                       fontWeight:
                                                    //                           FontWeight
                                                    //                               .w600,
                                                    //                       color: kTextInputPlaceholderColor
                                                    //                           .withOpacity(
                                                    //                               0.6)),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //             Column(
                                                    //               children: [
                                                    //                 Image.asset(
                                                    //                   "assets/images/oifilter.png",
                                                    //                   height: h * 0.03,
                                                    //                 ),
                                                    //                 Text(
                                                    //                   "Oil Filter",
                                                    //                   // textScaleFactor: 0.7,
                                                    //                   style: GoogleFonts.montserrat(
                                                    //                       fontWeight:
                                                    //                           FontWeight
                                                    //                               .w600,
                                                    //                       fontSize: 8,
                                                    //                       color: kTextInputPlaceholderColor
                                                    //                           .withOpacity(
                                                    //                               0.6)),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //             Column(
                                                    //               children: [
                                                    //                 Image.asset(
                                                    //                   "assets/images/wind.png",
                                                    //                   height: h * 0.03,
                                                    //                 ),
                                                    //                 Text(
                                                    //                   "Air Filter",
                                                    //                   // textScaleFactor: 0.7,
                                                    //                   style: GoogleFonts.montserrat(
                                                    //                       fontSize: 8,
                                                    //                       fontWeight:
                                                    //                           FontWeight
                                                    //                               .w600,
                                                    //                       color: kTextInputPlaceholderColor
                                                    //                           .withOpacity(
                                                    //                               0.6)),
                                                    //                 ),
                                                    //               ],
                                                    //             ),
                                                    //             Text("+9 more",
                                                    //                 style: GoogleFonts
                                                    //                     .montserrat(
                                                    //                   fontSize: 8,
                                                    //                   fontWeight:
                                                    //                       FontWeight
                                                    //                           .w600,
                                                    //                 )),
                                                    //           ],
                                                    //         ),
                                                    //       ),
                                                    //       isDense: true,
                                                    //       // Initial Value
                                                    //       // value: dropdownvalue,

                                                    //       // Down Arrow Icon
                                                    //       icon: const Icon(
                                                    //           Icons.arrow_forward_ios,
                                                    //           size: 10),

                                                    //       // Array list of items
                                                    //       items:
                                                    //           items.map((String items) {
                                                    //         return DropdownMenuItem(
                                                    //           value: items,
                                                    //           child: Row(
                                                    //             mainAxisAlignment:
                                                    //                 MainAxisAlignment
                                                    //                     .spaceAround,
                                                    //             children: [
                                                    //               Column(
                                                    //                 children: [
                                                    //                   Image.asset(
                                                    //                     "assets/images/EngineOil.png",
                                                    //                     height:
                                                    //                         h * 0.03,
                                                    //                   ),
                                                    //                   Text(
                                                    //                     "Engine Oil ",
                                                    //                     // textScaleFactor: 0.7,
                                                    //                     style: GoogleFonts.montserrat(
                                                    //                         fontSize: 8,
                                                    //                         fontWeight:
                                                    //                             FontWeight
                                                    //                                 .w600,
                                                    //                         color: kTextInputPlaceholderColor
                                                    //                             .withOpacity(
                                                    //                                 0.6)),
                                                    //                   ),
                                                    //                 ],
                                                    //               ),
                                                    //               Column(
                                                    //                 children: [
                                                    //                   Image.asset(
                                                    //                     "assets/images/oifilter.png",
                                                    //                     height:
                                                    //                         h * 0.03,
                                                    //                   ),
                                                    //                   Text(
                                                    //                     "Oil Filter",
                                                    //                     // textScaleFactor: 0.7,
                                                    //                     style: GoogleFonts.montserrat(
                                                    //                         fontWeight:
                                                    //                             FontWeight
                                                    //                                 .w600,
                                                    //                         fontSize: 8,
                                                    //                         color: kTextInputPlaceholderColor
                                                    //                             .withOpacity(
                                                    //                                 0.6)),
                                                    //                   ),
                                                    //                 ],
                                                    //               ),
                                                    //               Column(
                                                    //                 children: [
                                                    //                   Image.asset(
                                                    //                     "assets/images/wind.png",
                                                    //                     height:
                                                    //                         h * 0.03,
                                                    //                   ),
                                                    //                   Text(
                                                    //                     "Air Filter",
                                                    //                     // textScaleFactor: 0.7,
                                                    //                     style: GoogleFonts.montserrat(
                                                    //                         fontSize: 8,
                                                    //                         fontWeight:
                                                    //                             FontWeight
                                                    //                                 .w600,
                                                    //                         color: kTextInputPlaceholderColor
                                                    //                             .withOpacity(
                                                    //                                 0.6)),
                                                    //                   ),
                                                    //                 ],
                                                    //               ),
                                                    //             ],
                                                    //           ),
                                                    //         );
                                                    //       }).toList(),
                                                    //       // After selecting the desired option,it will
                                                    //       // change button value to selected value
                                                    //       onChanged:
                                                    //           (String? newValue) {
                                                    //         setState(() {
                                                    //           dropdownvalue = newValue!;
                                                    //         });
                                                    //       },
                                                    //     )),
                                                    //   ),
                                                    // ),
                                                    GestureDetector(
                                                      onTap: data[index]["Plans"]
                                                                      [
                                                                      "services_id"]
                                                                  .length <=
                                                              3
                                                          ? () {}
                                                          : () {
                                                              dropvalue =
                                                                  index + 1;
                                                              // showGeneralDialog(context: keys[index].currentContext!, pageBuilder: pageBuilder)
                                                              // showGeneralDialog(
                                                              //   context: keys[index].currentContext!,
                                                              //   pageBuilder: ( context,
                                                              //       Animation<double> animation,
                                                              //       Animation<double>
                                                              //           secondaryAnimation) {
                                                              //     return AlertDialog(
                                                              //       content: Container(
                                                              //         width: 200.0,
                                                              //         height: 200.0,
                                                              //         color: Colors.orange,
                                                              //       ),
                                                              //     );
                                                              //   },
                                                              //   barrierDismissible: true,
                                                              //   barrierLabel:
                                                              //       MaterialLocalizations.of(context)
                                                              //           .modalBarrierDismissLabel,
                                                              //   barrierColor: Colors.black,
                                                              //   transitionDuration:
                                                              //       const Duration(milliseconds: 200),
                                                              // );

                                                              setState(() {});
                                                            },
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
                                                                              itemCount: data[index]["Plans"]["services_id"].length > 3 ? 3 : data[index]["Plans"]["services_id"].length,
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
                                                                                        imageUrl: data[index]["Plans"]["services_id"][indexx]["image"].toString(),
                                                                                        placeholder: (context, url) => Container(),
                                                                                        errorWidget: (context, url, error) => Image.network("https://i.gifer.com/DKke.gif"),
                                                                                      ),
                                                                                      // Image.asset(
                                                                                      //   "assets/images/EngineOil.png",
                                                                                      //   height: h * 0.03,
                                                                                      // ),
                                                                                      Text(
                                                                                        data[index]["Plans"]["services_id"][indexx]["title"] ?? "",
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
                                                                            visible:
                                                                                data[index]["Plans"]["services_id"].length > 3,
                                                                            child: Text("+${data[index]["Plans"]["services_id"].length - 3} more",
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
                                                    InkWell(
                                                      onTap: () {
                                                        // print(data[index]["_id"]);
                                                        isloading = true;
                                                        whichindex = index;
                                                        setState(() {});
                                                        delete(data[index]
                                                                ["_id"])
                                                            .whenComplete(() {
                                                          isloading = false;
                                                          if (data.isNotEmpty) {
                                                            subtotal = 0;
                                                            for (int i = 0; i < data.length; i++) {
                                                              totalvalue(double.parse(data[i]["selectplan"][0]["typeprice"].toString()));
                                                            }
                                                          }
                                                        });

                                                        setState(() {});
                                                      },
                                                      child: CircleAvatar(
                                                        radius: h * 0.02,
                                                        backgroundColor:
                                                            kbluecolor,
                                                        foregroundColor:
                                                            kwhitecolor,
                                                        child: FittedBox(
                                                            child: Icon(
                                                          Icons.delete,
                                                          size: h * 0.022,
                                                        )),
                                                      ),
                                                    )
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
                                                children: List.generate(
                                                    data[index]["Plans"]
                                                            ["services_id"]
                                                        .length, (indexx) {
                                                  return Column(
                                                    children: [
                                                      CachedNetworkImage(
                                                        fit: BoxFit.fill,
                                                        height: h * 0.03,
                                                        imageUrl: data[index][
                                                                        "Plans"]
                                                                    [
                                                                    "services_id"]
                                                                [
                                                                indexx]["image"]
                                                            .toString(),
                                                        placeholder:
                                                            (context, url) =>
                                                                Container(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.network(
                                                                "https://i.gifer.com/DKke.gif"),
                                                      ),
                                                      // Image.asset(
                                                      //   "assets/images/EngineOil.png",
                                                      //   height: h * 0.03,
                                                      // ),
                                                      Text(
                                                        data[index]["Plans"][
                                                                    "services_id"]
                                                                [
                                                                indexx]["title"]
                                                            .toString(),
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
            Padding(
              padding: EdgeInsets.only(top: h * 0.02, left: w * 0.1),
              child: InkWell(
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
                },
                child: CircleAvatar(
                  radius: h * 0.025,
                  backgroundColor: kblackcolor,
                  foregroundColor: kwhitecolor,
                  child: Icon(Icons.add),
                ),
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("Sub-Total",
                  //         style: GoogleFonts.montserrat(
                  //           fontSize: 13,
                  //           color: ksubHading,
                  //           fontWeight: FontWeight.bold,
                  //         )),
                  //     Text("₹ $subtotal",
                  //         style: GoogleFonts.montserrat(
                  //           fontSize: 11,
                  //           fontWeight: FontWeight.bold,
                  //         )),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("Taxes",
                  //         style: GoogleFonts.montserrat(
                  //           fontSize: 13,
                  //           color: ksubHading,
                  //           fontWeight: FontWeight.bold,
                  //         )),
                  //     Text("₹ 200",
                  //         style: GoogleFonts.montserrat(
                  //           fontSize: 11,
                  //           fontWeight: FontWeight.bold,
                  //         )),
                  //   ],
                  // ),
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
                          Text("₹ $subtotal",
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

  Future fecthdata() async {
    await addcartitem(Cart.packe).then((value) {
      print("Response "+value.toString()+"^");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value["msg"]),
      ));
    }).whenComplete(() async {
      await getcartitems().then((value) {
        setState(() {
          data.addAll(value);
          if (value == null) {
            _null = "You have nothing in Cart. Please add...";
            setState(() {

            });
          } else {
            _null = "";
            setState(() {});
          }
          print(data.toString() + "============");
          // for(int i=0; i<data.length; i++){
          //   plan=data[i]["Plans"];
          //   print(plan.toString()+"+++++++++++=====");
          // }
          //       service.addAll(value);
          //            print("================="+service.toString());
          // print("================="+service[0]["title"].toString());
        });
      });
    });
  }

  Future delete(String id) async {
    await deletecartitem(id).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value["msg"]),
      ));
    }).whenComplete(() async {
      await getcartitems().then((value) {
        print("+++++++++++++++=============" + value.toString());
        setState(() {
          data.clear();
          data.addAll(value);
          if (value.isEmpty) {
            _null = "You have nothing in Cart. Please add...";
            print(_null);
            setState(() {});
          } else {
            _null = "";
            setState(() {});
          }
          print(data.toString() + "============");
          setState(() {});
          // for(int i=0; i<data.length; i++){
          //   plan=data[i]["Plans"];
          //   print(plan.toString()+"+++++++++++=====");
          // }
          //       service.addAll(value);
          //            print("================="+service.toString());
          // print("================="+service[0]["title"].toString());
        });
      });
    });
  }
}
