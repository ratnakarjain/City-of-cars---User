import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Services/models/plansModel.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/Shapes/widgets.dart';
import '../../../Utils/constants.dart';
import '../productDetail.dart';

var h;
var w;

class CommonServices extends StatefulWidget {
  String label;
  List<PlanModel> data;
  String subcategoryid;
  String? search;
  CommonServices({
    Key? key,
    required this.label,
    required this.data,
    required this.subcategoryid,
    this.search,
  }) : super(key: key);

  @override
  State<CommonServices> createState() => _CommonServicesState();
}

class _CommonServicesState extends State<CommonServices> {
  @override
  List<PlanModel> plans = [];
  List keys = [];
  List<bool> drop = [];

  int dropvalue = 0;
  ScrollController _scrollController = ScrollController();
  void initState() {
    // TODO: implement initState
    plans.addAll(widget.data);
    print(plans.toString() + "===============");
    drop = List.generate(plans.length, (index) {
      return false;
    });
    print("++++++++++++++" + widget.subcategoryid);
    for (int i = 0; i < plans.length; i++) {
      keys.add(i);
      keys[i] = GlobalKey();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: h * 0.005),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
            color: kbluecolor,
            text: widget.label.toString(),
            textStyle: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: kwhitecolor),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          plans.isEmpty
              ? Center(
                  child: Text(
                    // "There are no service packs in this category.",
                    "Please tap on profile to select a city or add a new car.",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    return Visibility(
                      visible: plans[index]
                          .packs
                          .first
                          .planName
                          .toLowerCase()
                          .contains(widget.search ?? ""),
                      child: GestureDetector(
                        onTap: () {
                          dropvalue = 0;
                          setState(() {});
                          Ids.subcategoryid = widget.subcategoryid;
                          Ids.planid = plans[index].planid;
                          print(Ids.categoryid);
                          print(Ids.subcategoryid);
                          print(Ids.planid);
                          // print(plans[index]["_id"]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  planDetails: plans[index],
                                ),
                              ));
                        },
                        child: Stack(
                          children: [
                            Container(
                              height:
                                  dropvalue == index + 1 ? h * 0.4 : h * 0.20,
                              color: kwhitecolor,
                              margin: EdgeInsets.only(
                                  top: h * 0.018,
                                  left: w * 0.01,
                                  right: w * 0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  plans[index].label != ""
                                      ? Label(
                                          color: korangecolor,
                                          text: plans[index].label,
                                          textStyle: GoogleFonts.montserrat(
                                            fontSize: 6,
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: kwhitecolor),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 3),
                                        )
                                      : SizedBox(
                                          height: h * 0.015,
                                        ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.06,
                                        vertical: h * 0.01),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                plans[index]
                                                    .packs
                                                    .first
                                                    .planName,
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                // "Services Pack",
                                                plans[index].packs[1].planName,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        kTextInputPlaceholderColor
                                                            .withOpacity(0.6)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(h * 0.01),
                                          decoration: BoxDecoration(
                                              color: kLightOrangeBgColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.01)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "₹" +
                                                    plans[index]
                                                        .packs
                                                        .first
                                                        .planPrice
                                                        .toString(),
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Incl. Taxes",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 7,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        kTextInputPlaceholderColor
                                                            .withOpacity(0.6)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: w * 0.06, bottom: h * 0.01),
                                    child: Text(
                                      (plans[index].hour.isEmpty
                                              ? ""
                                              : "Takes ${plans[index].hour} Hrs ") +
                                          (plans[index].months.isEmpty
                                              ? ""
                                              : "/ Every ${plans[index].months} Months"),
                                      style: GoogleFonts.montserrat(
                                          fontSize: 7,
                                          fontWeight: FontWeight.w600,
                                          color: kTextInputPlaceholderColor
                                              .withOpacity(0.6)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.03),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: GestureDetector(
                                                onTap: plans[index]
                                                            .includes
                                                            .length <=
                                                        3
                                                    ? () {}
                                                    : () {
                                                        dropvalue = index + 1;
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
                                                  color: kLightOrangeBgColor,
                                                  height: h * 0.055,
                                                  width: w * 0.6,
                                                  margin: EdgeInsets.only(
                                                      right: w * 0.03),
                                                  padding:
                                                      EdgeInsets.all(h * 0.005),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                          key: keys[index],
                                                          width: w * 0.55,
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Center(
                                                                      child: ListView
                                                                          .builder(
                                                                        itemCount: plans[index].includes.length >
                                                                                3
                                                                            ? 3
                                                                            : plans[index].includes.length,
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        shrinkWrap:
                                                                            true,
                                                                        physics:
                                                                            const NeverScrollableScrollPhysics(),
                                                                        itemBuilder:
                                                                            (context,
                                                                                indexx) {
                                                                          return Container(
                                                                            width: plans[index].includes.length > 3
                                                                                ? w * 0.14
                                                                                : w * 0.16,
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: w * 0.02),
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                CachedNetworkImage(
                                                                                  // fit: BoxFit.fill,
                                                                                  height: h * 0.022,
                                                                                  // width: w*0.07,
                                                                                  imageUrl: plans[index].includes[indexx].image.toString(),
                                                                                  placeholder: (context, url) => Container(),
                                                                                  errorWidget: (context, url, error) => Image.network("https://i.gifer.com/DKke.gif"),
                                                                                ),
                                                                                // Image.asset(
                                                                                //   "assets/images/EngineOil.png",
                                                                                //   height: h * 0.03,
                                                                                // ),
                                                                                Text(
                                                                                  plans[index].includes[indexx].name,
                                                                                  // "Engine Oil ",
                                                                                  // textScaleFactor: 0.7,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: GoogleFonts.montserrat(fontSize: 8, height: 2, fontWeight: FontWeight.w600, color: kTextInputPlaceholderColor.withOpacity(0.6)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: w *
                                                                          0.02,
                                                                    ),
                                                                    Visibility(
                                                                      visible:
                                                                          plans[index].includes.length >
                                                                              3,
                                                                      child: Text(
                                                                          "+${plans[index].includes.length - 3} more",
                                                                          style:
                                                                              GoogleFonts.montserrat(
                                                                            fontSize:
                                                                                7,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          )),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 10),
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              )
                                              // DropDown(data: plans[index]["services_id"]),
                                              ),
                                          Expanded(
                                            child: RRecctButton2(
                                              onTap: () {
                                                Ids.subcategoryid =
                                                    widget.subcategoryid;
                                                Ids.planid =
                                                    plans[index].planid;
                                                print(Ids.categoryid);
                                                print(Ids.subcategoryid);
                                                print(Ids.planid);
                                                // print(plans[index]["_id"]);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductDetails(
                                                        planDetails:
                                                            plans[index],
                                                      ),
                                                    ));
                                              },
                                              h: h * 0.045,
                                              w: w * 0.3,
                                              radius: h * 0.02,
                                              buttonColor: kGreenColor,
                                              widget: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "Book now ".toUpperCase(),
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  kwhitecolor)),
                                                  SizedBox(
                                                    width: w * 0.01,
                                                  ),
                                                  SvgPicture.asset(
                                                    "assets/svg/Book Now.svg",
                                                    height: h * 0.02,
                                                  )
                                                  // Image.asset(
                                                  //     "assets/images/doublArrow.png"),
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
                                left: w * 0.04,
                                top: h * 0.11,
                                child: Container(
                                  width: w * 0.6,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            color: kblackcolor.withOpacity(0.2))
                                      ]),
                                  child: GridView.count(
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 2,
                                      crossAxisCount: 3,
                                      childAspectRatio: 1.6,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(top: h * 0.01),
                                      children: List.generate(
                                          plans[index].includes.length,
                                          (indexx) {
                                        return Column(
                                          children: [
                                            CachedNetworkImage(
                                              // fit: BoxFit.fill,
                                              height: h * 0.022,
                                              imageUrl: plans[index]
                                                  .includes[indexx]
                                                  .image
                                                  .toString(),
                                              placeholder: (context, url) =>
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
                                              plans[index]
                                                  .includes[indexx]
                                                  .name,
                                              // "Engine Oil ",
                                              // textScaleFactor: 0.7,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      kTextInputPlaceholderColor
                                                          .withOpacity(0.6)),
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
          // Plans(
          //   h: h,
          //   w: w,
          //   text: "Basic",
          //   islabel: true,
          //   labeltext: "Frequently Booked",
          // ),
          // Plans(
          //   h: h,
          //   w: w,
          //   text: "Standerd",
          //   islabel: false,
          // ),
          // Plans(
          //   h: h,
          //   w: w,
          //   text: "Primium",
          //   islabel: true,
          //   labeltext: "Reccomended",
          // ),
          SizedBox(
            height: h * 0.018,
          ),
        ],
      ),
    );
  }
}

// class Plans extends StatelessWidget {
//   String? labeltext;
//   double h;
//   double w;
//   String text;
//   Plans(
//       {Key? key,
//       required this.h,
//       required this.w,
//       required this.text,

//       this.labeltext})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: kwhitecolor,
//       margin: EdgeInsets.only(top: h * 0.018, left: w * 0.01, right: w * 0.01),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           labeltext!.isNotEmpty
//               ? Label(
//                   color: korangecolor,
//                   text: labeltext!,
//                   textStyle: GoogleFonts.montserrat(
//                     fontSize: 6,
//                     textStyle: const TextStyle(
//                         fontWeight: FontWeight.bold, color: kwhitecolor),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
//                 )
//               : SizedBox(
//                   height: h * 0.015,
//                 ),
//           Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: w * 0.06, vertical: h * 0.01),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         text,

//                         style: GoogleFonts.montserrat(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Services Pack",

//                         style: GoogleFonts.montserrat(
//                           fontSize: 8,
//                             fontWeight: FontWeight.w600,
//                             color: kTextInputPlaceholderColor.withOpacity(0.6)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(h * 0.01),
//                   decoration: BoxDecoration(
//                       color: kLightOrangeBgColor,
//                       borderRadius: BorderRadius.circular(h * 0.01)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         "₹ 2700",

//                         style: GoogleFonts.montserrat(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Incl. Taxes",
//                         style: GoogleFonts.montserrat(
//                           fontSize: 7,
//                             fontWeight: FontWeight.w600,
//                             color: kTextInputPlaceholderColor.withOpacity(0.6)),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: w * 0.06, bottom: h * 0.01),
//             child: Text(
//               "Takes 4 Hrs / Every 3 Months",

//               style: GoogleFonts.montserrat(
//                 fontSize: 7,
//                   fontWeight: FontWeight.w600,
//                   color: kTextInputPlaceholderColor.withOpacity(0.6)),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: w * 0.03),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: DropDown(

//                     ),
//                   ),
//                   Expanded(
//                     child: RRecctButton2(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const ProductDetails(),
//                             ));
//                       },
//                       h: h * 0.045,
//                       w: w * 0.3,
//                       radius: h * 0.02,
//                       buttonColor: kGreenColor,
//                       widget: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Book now ".toUpperCase(),

//                               style: GoogleFonts.montserrat(
//                                 fontSize: 11,
//                                   fontWeight: FontWeight.w600,
//                                   color: kwhitecolor)),
//                           SizedBox(
//                             width: w * 0.01,
//                           ),
//                           Image.asset("assets/images/doublArrow.png"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ]),
//           ),
//           SizedBox(
//             height: h * 0.02,
//           )
//         ],
//       ),
//     );
//   }
// }

class DropDown extends StatefulWidget {
  var data;
  DropDown({Key? key, required this.data}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  ScrollController _controller = ScrollController();
  String dropdownvalue = '';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];
  List datas = [];
  @override
  void initState() {
    // TODO: implement initState
    datas = widget.data;
    print(datas.length.toString() + "+++++++++++++++===========");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightOrangeBgColor,
      height: h * 0.055,
      width: w * 0.6,
      margin: EdgeInsets.only(right: w * 0.03),
      padding: EdgeInsets.all(h * 0.005),
      child: DropdownButtonHideUnderline(
        child: (DropdownButton(
          hint: SizedBox(
            width: w * 0.5,
            child: Row(
              children: [
                Center(
                  child: ListView.builder(
                    itemCount: datas.length > 3 ? 3 : datas.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              fit: BoxFit.fill,
                              height: h * 0.03,
                              imageUrl: datas[index]["image"].toString(),
                              placeholder: (context, url) => loder,
                              errorWidget: (context, url, error) =>
                                  Image.network("https://i.gifer.com/DKke.gif"),
                            ),
                            // Image.asset(
                            //   "assets/images/EngineOil.png",
                            //   height: h * 0.03,
                            // ),
                            Text(
                              datas[index]["title"] ?? "",
                              // "Engine Oil ",
                              // textScaleFactor: 0.7,
                              style: GoogleFonts.montserrat(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.6)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: w * 0.02,
                ),
                Visibility(
                  visible: datas.length > 3,
                  child: Text("+${datas.length - 3} more",
                      style: GoogleFonts.montserrat(
                        fontSize: 7,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          ),
          isDense: true,
          // Initial Value
          // value: dropdownvalue,

          // Down Arrow Icon
          icon: const Icon(Icons.arrow_forward_ios, size: 10),

          // Array list of items
          items: items.map((String item) {
            return DropdownMenuItem(
                value: item,
                // child: Text(""),
                child: GridView.count(
                  controller: _controller,
                  shrinkWrap: true,
                  // mainAxisSpacing: 16,
                  // crossAxisSpacing: 16,
                  // childAspectRatio: 0.8,
                  crossAxisCount: 3,
                  children: List.generate(datas.length, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.fill,
                            height: h * 0.03,
                            imageUrl: datas[index]["image"].toString(),
                            placeholder: (context, url) => loder,
                            errorWidget: (context, url, error) =>
                                Image.network("https://i.gifer.com/DKke.gif"),
                          ),
                          // Image.asset(
                          //   "assets/images/EngineOil.png",
                          //   height: h * 0.03,
                          // ),
                          Text(
                            datas[index]["title"] ?? "",
                            // "Engine Oil ",
                            // textScaleFactor: 0.7,
                            style: GoogleFonts.montserrat(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.6)),
                          ),
                        ],
                      ),
                    );
                  }),
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Column(
                //     children: [
                //       Image.asset(
                //         "assets/images/EngineOil.png",
                //         height: h * 0.03,
                //       ),
                //       Text(
                //         "Engine Oil ",
                //         // textScaleFactor: 0.7,
                //         style: GoogleFonts.montserrat(
                //           fontSize: 8,
                //             fontWeight: FontWeight.w600,
                //             color: kTextInputPlaceholderColor.withOpacity(0.6)),
                //       ),
                //     ],
                //   ),
                //   Column(
                //     children: [
                //       Image.asset(
                //         "assets/images/oifilter.png",
                //         height: h * 0.03,
                //       ),
                //       Text(
                //         "Oil Filter",
                //         // textScaleFactor: 0.7,
                //         style: GoogleFonts.montserrat(
                //             fontWeight: FontWeight.w600,
                //             fontSize: 8,
                //             color: kTextInputPlaceholderColor.withOpacity(0.6)),
                //       ),
                //     ],
                //   ),
                //   Column(
                //     children: [
                //       Image.asset(
                //         "assets/images/wind.png",
                //         height: h * 0.03,
                //       ),
                //       Text(
                //         "Air Filter",
                //         // textScaleFactor: 0.7,
                //         style: GoogleFonts.montserrat(
                //           fontSize: 8,
                //             fontWeight: FontWeight.w600,
                //             color: kTextInputPlaceholderColor.withOpacity(0.6)),
                //       ),
                //     ],
                //   ),
                //   ],
                // ),
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