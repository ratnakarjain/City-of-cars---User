import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/Service%20Main/cart.dart';
import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Services/models/plansModel.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Buttons/button.dart';
import '../../Utils/constants.dart';
import '../../Utils/functions.dart';

class ProductDetails extends StatefulWidget {
  static String selctedprice = "";
  PlanModel planDetails;
  ProductDetails({Key? key, required this.planDetails}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController _controller1 = ScrollController();
  var h;
  var w;
  int currentPage = 0;
  bool des = false;
  bool basic = true;
  bool service = false;
  int selceted = 0;
  List terms = [];
  bool booknow = false;
  List backimage = [
    "https://wallpaperaccess.com/full/33110.jpg",
    "https://wallpaperaccess.com/full/14444.jpg",
    "https://wallpaperaccess.com/full/33116.jpg",
    "https://wallpaperaccess.com/full/33118.jpg"
  ];
  PlanModel details = PlanModel();
  List images = [];
  @override
  void initState() {
    details = widget.planDetails;
    // terms = details["Subcategory"];
    print(terms);
    print(details);
    getplanbanner().then((value) {
      images.addAll(value);
      setState(() {});
    });
    ProductDetails.selctedprice = details.planprice.toString();
    print(ProductDetails.selctedprice);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("enter the loop" + details.toString());
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg3,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        foregroundColor: kwhitecolor,
        centerTitle: false,
        titleSpacing: -w * 0.02,
        title: Text(
          "Periodic Services",
          style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: kwhitecolor)),
        ),
        // flexibleSpace: Container(
        //   height: h * 0.25,
        //   child: Stack(
        //     children: [
        //       PageView.builder(
        //           onPageChanged: (value) {
        //             setState(() {
        //               currentPage = value;
        //             });
        //           },
        //           itemCount: images.length,
        //           itemBuilder: (context, index) => Container(
        //                 decoration: BoxDecoration(
        //                     image: DecorationImage(
        //                         image: NetworkImage(
        //                           images[index],
        //                         ),
        //                         fit: BoxFit.contain)),
        //               )),
        //       Positioned(
        //         bottom: 0,
        //         left: 0,
        //         right: 0,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: images.map((url) {
        //             int index = images.indexOf(url);
        //             return Container(
        //               width: 8.0,
        //               height: 8.0,
        //               margin: const EdgeInsets.symmetric(
        //                   vertical: 10.0, horizontal: 4.0),
        //               decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: currentPage == index
        //                     ? kdarkpurple
        //                     : ksubHading.withOpacity(0.32),
        //               ),
        //             );
        //           }).toList(),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        controller: _controller1,
        // physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: h * 0.15,
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * 0.08,
                      vertical: h * 0.03,
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h * 0.1,
                              ),
                              Text(
                                details.packs[0].planName.toString(),
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: kTextInputPlaceholderColor)),
                              ),
                              Text(
                                details.packs[1].planName.toString(),
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.6))),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListView.builder(
                            itemCount: details.packs.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Visibility(
                                visible:
                                    details.packs[index].planPrice != "NaN",
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: h * 0.01,
                                        child: Checkbox(
                                          value: index == selceted,
                                          side: const BorderSide(
                                              color: kGreenColor, width: 2),
                                          activeColor: kGreenColor,
                                          onChanged: (value) {
                                            selceted = index;
                                            setState(() {
                                              service = false;
                                              ProductDetails.selctedprice =
                                                  details.planprice.toString();
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              "₹" +
                                                  details
                                                      .packs[index].planPrice,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: index == selceted
                                                      ? 21
                                                      : 12,
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: index == selceted
                                                          ? kTextInputPlaceholderColor
                                                          : kTextInputPlaceholderColor
                                                              .withOpacity(
                                                                  0.5))),
                                            ),
                                          ),
                                          Text(
                                            details.packs[index].pricedes,
                                            // "multi-brand price",
                                            maxLines: 1,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 6,
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: kblackcolor
                                                        .withOpacity(0.50))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           details.planname.toString(),
                    //           style: GoogleFonts.montserrat(
                    //               textStyle: const TextStyle(
                    //             fontSize: 25,
                    //             fontWeight: FontWeight.bold,
                    //           )),
                    //         ),
                    //         Text(
                    //           details.servicepackname.toString(),
                    //           style: GoogleFonts.montserrat(
                    //               textStyle: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 16,
                    //                   color: kblackcolor.withOpacity(0.50))),
                    //         ),
                    //       ],
                    //     ),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Checkbox(
                    //               value: basic,
                    //               side:
                    //                   const BorderSide(color: kGreenColor, width: 2),
                    //               activeColor: kGreenColor,
                    //               onChanged: (value) {
                    //                 basic = value!;
                    //                 setState(() {
                    //                   service = false;
                    //                   ProductDetails.selctedprice=details.planprice.toString();
                    //                 });
                    //               },
                    //             ),
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.end,
                    //               children: [
                    //                 Text(
                    //                   "₹" + details.planprice,
                    //                   style: GoogleFonts.montserrat(
                    //                       fontSize: 21,
                    //                       textStyle: const TextStyle(
                    //                         fontWeight: FontWeight.bold,
                    //                       )),
                    //                 ),
                    //                 Text(
                    //                   details.planpricdes,
                    //                   // "multi-brand price",
                    //                   style: GoogleFonts.montserrat(
                    //                       fontSize: 6,
                    //                       textStyle: TextStyle(
                    //                           fontWeight: FontWeight.w400,
                    //                           color: kblackcolor.withOpacity(0.50))),
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //         Row(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Checkbox(
                    //               side:
                    //                   const BorderSide(color: kGreenColor, width: 2),
                    //               activeColor: kGreenColor,
                    //               value: service,
                    //               onChanged: (value) {
                    //                 service = value!;
                    //                 setState(() {
                    //                   basic = false;
                    //                   ProductDetails.selctedprice=details.componyprice.toString();
                    //                 });
                    //               },
                    //             ),
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.end,
                    //               children: [
                    //                 Text(
                    //                   "₹" + details.componyprice,
                    //                   style: GoogleFonts.montserrat(
                    //                       fontSize: 12,
                    //                       textStyle: TextStyle(
                    //                           fontWeight: FontWeight.bold,
                    //                           color: kTextInputPlaceholderColor
                    //                               .withOpacity(0.5))),
                    //                 ),
                    //                 Text(
                    //                   details.componypricedes,
                    //                   // "company authorised",
                    //                   style: GoogleFonts.montserrat(
                    //                       fontSize: 6,
                    //                       textStyle: TextStyle(
                    //                           fontWeight: FontWeight.w400,
                    //                           color: kblackcolor.withOpacity(0.50))),
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // ),
                    ),
                booknow
                    ? loder
                    : RRecctButton2(
                        onTap: booknow
                            ? () {}
                            : () {
                                if (!service && !basic) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Please select price"),
                                  ));
                                } else {
                                  if ((Ids.brandid == "" ||
                                          Ids.brandid == "null") ||
                                      (Ids.carid == "" ||
                                              Ids.carid == "null") &&
                                          (Ids.cityid == "" ||
                                              Ids.cityid == "null") ||
                                      (Ids.fuelid == "" ||
                                          Ids.fuelid == "null")) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Please select car first"),
                                    ));
                                  } else {
                                    Cart.packe = details.packs[selceted];
                                    print(jsonEncode(Cart.packe) + "1235432");
                                    booknow = true;
                                    setState(() {});
                                    getslot().then((value) {
                                      if (value != "") {
                                        Ids.slotid = value;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Cart(
                                                getcart: false,
                                              ),
                                            ));
                                        booknow = false;
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Slot(),
                                            ));
                                        setState(() {
                                          booknow = false;
                                        });
                                      }
                                    });
                                  }
                                }
                              },
                        h: h * 0.05,
                        w: w * 0.85,
                        radius: h * 0.02,
                        buttonColor: kGreenColor,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Book now ".toUpperCase(),
                                textScaleFactor: 1,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: kwhitecolor)),
                            SizedBox(
                              width: w * 0.04,
                            ),
                            SvgPicture.asset(
                              "assets/svg/Book Now.svg",
                              height: h * 0.02,
                            )
                            // Image.asset(
                            //   "assets/images/doublArrow.png",
                            //   scale: 0.8,
                            // ),
                          ],
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(top: h * 0.03),
                  width: w,
                  child: Stack(
                    children: [
                      Container(
                        width: w,
                        margin: EdgeInsets.only(top: h * 0.04),
                        decoration: BoxDecoration(
                            color: kwhitecolor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                  h * 0.05,
                                ),
                                bottomLeft: Radius.circular(h * 0.05)),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                  color: Colors.grey)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: h * 0.05, left: w * 0.051),
                              child: Row(
                                children: [
                                  Label(
                                    text: "Description",
                                    isupper: false,
                                    color: kTransparent,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.05,
                                        vertical: h * 0.005),
                                    textStyle: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: kblackcolor,
                                    ),
                                  ),

                                  // Icon(Icons.pages)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.013,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.06),
                              child: GestureDetector(
                                onTap: () {
                                  des = !des;
                                  setState(() {});
                                },
                                child: Stack(
                                  children: [
                                    RRectCard(
                                        w: w,
                                        color: kLightOrangeBgColor,
                                        widget: SingleChildScrollView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: h * 0.015,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.09),
                                                constraints: des
                                                    ? const BoxConstraints()
                                                    : BoxConstraints(
                                                        maxHeight: h * 0.1,
                                                      ),
                                                child: Text(
                                                  details.description,
                                                  // "sacjhavclavcahvcasvcuvkjdb cksdbvihdsbvisbcbdskv bsdhbvksdvbsdkvbhvsdbvksdbv kdfbvlkdfbvzdfkvbsdfklbv df;obhdsfb dfbh dfb hadf ubhadofbh dalfigbldifugblaidfubv difbgiadfugbviasfugv liasugvliasu vgadiugv adibvadilfubgliadfugbaldfibgadfiubgaidfubgaidfubg",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: h * 0.027,
                                              ),
                                              // Visibility(
                                              //   visible: des,
                                              //   child: Column(
                                              //     children: [
                                              //       Padding(
                                              //         padding: EdgeInsets.symmetric(
                                              //             horizontal: w * 0.09),
                                              //         child: Text(
                                              //           "This pack is essential every 3000 km or 6 months whichever is earlier",
                                              //           style:
                                              //               GoogleFonts.montserrat(
                                              //             fontSize: 12,
                                              //             height: 1.5,
                                              //             fontWeight:
                                              //                 FontWeight.w400,
                                              //           ),
                                              //         ),
                                              //       ),
                                              //       SizedBox(
                                              //         height: h * 0.027,
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        borderRadius: h * 0.02),
                                    Positioned(
                                      bottom: h * 0.005,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Icon(des
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: h * 0.032, left: w * 0.051),
                              child: Label(
                                text: "Included Services",
                                color: kTransparent,
                                isupper: false,
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.05, vertical: h * 0.005),
                                textStyle: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kblackcolor),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: h * 0.0271,
                                  left: w * 0.15,
                                  right: w * 0.15,
                                  bottom: h * 0.035),
                              child: RRectCard(
                                  borderRadius: h * 0.01,
                                  color: kLightOrangeBgColor,
                                  // h: h * 0.21,
                                  w: w * 0.8,
                                  widget: Center(
                                    child: GridView.count(
                                      crossAxisCount: 3,
                                      childAspectRatio: 1,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(
                                          left: w * 0.05,
                                          right: w * 0.05,
                                          bottom: h * 0.01,
                                          top: h * 0.01),
                                      children: List.generate(
                                          details.includes.length, (index) {
                                        return Container(
                                          // margin:
                                          //     EdgeInsets.only(top: h * 0.005),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: index <
                                                      (details.includes.length %
                                                                  3 ==
                                                              0
                                                          ? details.includes
                                                                  .length -
                                                              3
                                                          : details.includes
                                                                          .length %
                                                                      3 ==
                                                                  1
                                                              ? details.includes
                                                                      .length -
                                                                  1
                                                              : details.includes
                                                                      .length -
                                                                  2)
                                                  ? Border(
                                                      bottom: BorderSide(
                                                      width: 1,
                                                      color: kgrey
                                                          .withOpacity(0.5),
                                                    ))
                                                  : null),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // CachedNetworkImage(
                                              //   fit: BoxFit.fill,
                                              //   height: h * 0.03,
                                              //   imageUrl: details["services_id"]
                                              //           [index]["image"]
                                              //       .toString(),
                                              //   placeholder: (context, url) =>
                                              //       Container(),
                                              //   errorWidget: (context, url,
                                              //           error) =>
                                              //       Image.network(
                                              //           "https://i.gifer.com/DKke.gif"),
                                              // ),
                                              Image.network(
                                                // "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                                details.includes[index].image
                                                    .toString(),
                                                height: h * 0.03,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container();
                                                },
                                              ),
                                              // Image.asset(
                                              //   "assets/images/EngineOil.png",
                                              //   height: h * 0.03,
                                              // ),
                                              Text(
                                                details.includes[index].name,
                                                // "Engine Oil ",
                                                // textScaleFactor: 0.7,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        kTextInputPlaceholderColor
                                                            .withOpacity(0.6)),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  )
                                  //  Padding(
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: w * 0.05, vertical: h * 0.03),
                                  //   child: Column(
                                  //     children: [
                                  //       Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceAround,
                                  //         children: [
                                  //           Column(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Image.asset(
                                  //                 "assets/images/EngineOil.png",
                                  //                 height: h * 0.03,
                                  //               ),
                                  //               Text(
                                  //                 "Engine Oil",
                                  //                 textAlign: TextAlign.center,
                                  //                 textScaleFactor: 0.7,
                                  //                 style: GoogleFonts.montserrat(
                                  //                     fontWeight: FontWeight.w500,
                                  //                     color:
                                  //                         kTextInputPlaceholderColor
                                  //                             .withOpacity(0.6)),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Image.asset(
                                  //                 "assets/images/oifilter.png",
                                  //                 height: h * 0.03,
                                  //               ),
                                  //               Text(
                                  //                 "Oil Filter",
                                  //                 textAlign: TextAlign.center,
                                  //                 textScaleFactor: 0.7,
                                  //                 style: GoogleFonts.montserrat(
                                  //                     fontWeight: FontWeight.w500,
                                  //                     color:
                                  //                         kTextInputPlaceholderColor
                                  //                             .withOpacity(0.6)),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             children: [
                                  //               Image.asset(
                                  //                 "assets/images/wind.png",
                                  //                 height: h * 0.03,
                                  //               ),
                                  //               Text(
                                  //                 "Air Filter",
                                  //                 textScaleFactor: 0.7,
                                  //                 textAlign: TextAlign.center,
                                  //                 style: GoogleFonts.montserrat(
                                  //                     fontWeight: FontWeight.w500,
                                  //                     color:
                                  //                         kTextInputPlaceholderColor
                                  //                             .withOpacity(0.6)),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       SizedBox(
                                  //         height: h * 0.01,
                                  //       ),
                                  //       const Divider(
                                  //         color: Colors.blueGrey,
                                  //       ),
                                  //       SizedBox(
                                  //         height: h * 0.01,
                                  //       ),
                                  //       Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceAround,
                                  //         children: [
                                  //           Column(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Image.asset(
                                  //                 "assets/images/cabin_filter.png",
                                  //                 height: h * 0.03,
                                  //               ),
                                  //               Text(
                                  //                 "Cabin filter",
                                  //                 textScaleFactor: 0.7,
                                  //                 textAlign: TextAlign.center,
                                  //                 style: GoogleFonts.montserrat(
                                  //                     fontWeight: FontWeight.w500,
                                  //                     color:
                                  //                         kTextInputPlaceholderColor
                                  //                             .withOpacity(0.6)),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Image.asset(
                                  //                 "assets/images/clutch_overhaul.png",
                                  //                 height: h * 0.03,
                                  //               ),
                                  //               Text(
                                  //                 "Clutch \noverhaul",
                                  //                 textScaleFactor: 0.7,
                                  //                 textAlign: TextAlign.center,
                                  //                 style: GoogleFonts.montserrat(
                                  //                     fontWeight: FontWeight.w500,
                                  //                     color:
                                  //                         kTextInputPlaceholderColor
                                  //                             .withOpacity(0.6)),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           Column(
                                  //             children: [
                                  //               Image.asset(
                                  //                 "assets/images/break_overhaul.png",
                                  //                 height: h * 0.03,
                                  //               ),
                                  //               Text(
                                  //                 "Breake \noverhaul",
                                  //                 textScaleFactor: 0.7,
                                  //                 textAlign: TextAlign.center,
                                  //                 style: GoogleFonts.montserrat(
                                  //                     fontWeight: FontWeight.w500,
                                  //                     color:
                                  //                         kTextInputPlaceholderColor
                                  //                             .withOpacity(0.6)),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: RRectCard(
                            h: h * 0.06,
                            w: w * 0.7,
                            padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                            widget: Row(
                              // mainAxisAlignment:
                              // MainAxisAlignment.spaceAround,
                              children: [
                                Visibility(
                                  visible: details.hour.isNotEmpty,
                                  child: Expanded(
                                    child: Center(
                                      child: Text("Takes ${details.hour} hrs",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: details.months.isNotEmpty,
                                  child: Expanded(
                                    child: Center(
                                      child: Text(
                                          "    Every ${details.months} months    ",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (details.document != "") {
                                        await launchURL(details.document);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text("No Document")));
                                      }
                                    },
                                    child: Center(
                                      child: Text("Rate Card",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 11,
                                            color: kbluecolor,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            borderRadius: h * 0.01),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: w * 0.06,
                    ),
                    Label(
                      text: "Terms & Conditions",
                      color: kTransparent,
                      isupper: false,
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05, vertical: h * 0.005),
                      textStyle: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kblackcolor,
                      ),
                    ),
                    // const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
                Container(
                  width: w,
                  margin: EdgeInsets.only(
                      top: h * 0.01, left: w * 0.09, right: w * 0.09),
                  padding: EdgeInsets.all(h * 0.03),
                  decoration: BoxDecoration(
                      color: kwhitecolor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            h * 0.05,
                          ),
                          bottomLeft: Radius.circular(h * 0.05)),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 3),
                            color: Colors.grey)
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: details
                                .termsheading, //'Who May Use the Services?',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: '\n\n\n${details.termsdetails}\n\n\n\n\n',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        // RichText(
                        //   text: TextSpan(
                        //     text: '•Step 1:',
                        //     style: GoogleFonts.montserrat(
                        //         fontWeight: FontWeight.w700,
                        //         fontSize: 9,
                        //         color: Colors.black),
                        //     children: [
                        //       TextSpan(
                        //         text:
                        //             ' You may use the Services only if you agree to form a binding contract with us and are not a person barred from receiving services under the laws of the applicable jurisdiction.\n',
                        //         style: GoogleFonts.montserrat(
                        //             fontWeight: FontWeight.w400,
                        //             fontSize: 9,
                        //             color: Colors.black),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // RichText(
                        //   text: TextSpan(
                        //     text: '•Step 2:',
                        //     style: GoogleFonts.montserrat(
                        //         fontWeight: FontWeight.w700,
                        //         fontSize: 9,
                        //         color: Colors.black),
                        //     children: [
                        //       TextSpan(
                        //         text:
                        //             ' Our Privacy Policy describes how we handle the information you provide to us when you use our Services.\n\n\n\n',
                        //         style: GoogleFonts.montserrat(
                        //             fontWeight: FontWeight.w400,
                        //             fontSize: 9,
                        //             color: Colors.black),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // RichText(
                        //   text: TextSpan(
                        //     text: 'Privacy',
                        //     style: GoogleFonts.montserrat(
                        //         fontWeight: FontWeight.w700,
                        //         fontSize: 9,
                        //         color: Colors.black),
                        //     children: [
                        //       TextSpan(
                        //         text:
                        //             '\n\n\nWhen one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.\n\n',
                        //         style: GoogleFonts.montserrat(
                        //             fontWeight: FontWeight.w400,
                        //             fontSize: 9,
                        //             color: Colors.black),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ]),
                ),
                SizedBox(
                  height: h * 0.02,
                )
              ],
            ),
            Container(
              height: h * 0.25,
              color: kblackcolor,
              child: Stack(
                children: [
                  PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: images.length,
                      itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      images[index],
                                    ),
                                    fit: BoxFit.contain)),
                          )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: images.map((url) {
                        int index = images.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPage == index
                                ? kdarkpurple
                                : ksubHading.withOpacity(0.32),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
