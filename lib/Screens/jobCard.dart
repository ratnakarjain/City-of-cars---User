import 'dart:convert';

import 'package:cityofcars/Screens/video.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image.dart';

class JobCard extends StatefulWidget {
  String orderid;
  static var data;
  JobCard({Key? key, required this.orderid}) : super(key: key);

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();
  ScrollController _controller3 = ScrollController();
  ScrollController _controller4 = ScrollController();
  var h;
  var w;
  List heading = [
    "Suspension",
    "Clutch",
    "Horn",
    "Software",
    "Battery",
    "Hood",
    "Power Windows",
  ];
  List subh = [
    "Break",
    "Loose",
    "NW",
    "Reset",
    "Weak",
    "Noise impounded from rear",
    "NW",
  ];
  List images = ["girl.png", "man.png", "view.png"];
  // List availabel = [
  //   "Warranty booklet",
  //   "Stereo",
  //   "ORVM",
  //   "Power Windows",
  //   "AC Operation",
  //   "Carpet Mats",
  //   "Antenna",
  //   "Interior Illumination",
  //   "Horn",
  //   "Seat Belt",
  //   "Warning Lights",
  //   "Handbrake",
  // ];
  // List notAvailabel = [
  //   "Clutch",
  //   "Power Steering",
  //   "Defrost / Heater",
  //   "Central locking",
  //   "Spare Wheel",
  //   "Headlight Bulbs",
  //   "Tail Light Bulbs",
  //   "Fog Light",
  //   "Windscreen Wipers",
  // ];
  // List missingParts = [
  //   "Windscreen Water",
  //   "Wheel Caps",
  //   "Toolkit / First Aid",
  //   "Trunk Mat",
  //   "Cabin Mats",
  //   "Toolkit / First Aid",
  // ];
  var data;
  var geninfo;
  List availeble = [];
  List notavaileble = [];
  List missing = [];
  var custCon;
  var condi;
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    print(widget.orderid);
    getjobcard(widget.orderid).then((value) {
      if (JobCard.data != null) {
        print("entering ===");
        data = JobCard.data;
        geninfo = jsonDecode(data["genCondition"]);
        custCon = jsonDecode(data["customerConcerns"]);
        condi = jsonDecode(data["condition"]);
        for (int i = 0; i < geninfo.length; i++) {
          if (geninfo[i]["x"] == 1) {
            availeble.add(geninfo[i]);
          }
          if (geninfo[i]["x"] == 2) {
            notavaileble.add(geninfo[i]);
          }
          if (geninfo[i]["x"] == 3) {
            missing.add(geninfo[i]);
          }

          // print(availeble.toString()+"avaible");
          // print(notavaileble.toString()+"not availble");
          print(missing.toString() + "missing");
        }
        print(condi);
        print(custCon);
        print(geninfo);
        setState(() {});
      }
      setState(() {
        isloading = false;
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.orderid.toString() + "==============");
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        elevation: 0,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "Job Card",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: isloading
          ? loder
          : data == null
              ? Center(
                  child: Text(
                    "No data",
                    style: GoogleFonts.montserrat(
                        fontSize: 21, fontWeight: FontWeight.w400),
                  ),
                )
              : SizedBox(
                  height: h,
                  width: w,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: h * 0.02, horizontal: w * 0.02),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: RRectCard(
                                  // h: h * 0.1,
                                  // w: w * 0.6,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.06, vertical: h * 0.02),
                                  widget: RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                        text: "Name:",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            height: 1.5,
                                            color: ksubHading),
                                        children: [
                                          TextSpan(
                                            text:
                                                " ${data['orderid']["orderData"][0]["bookingdata"]["name"]}\n",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: ksubHading),
                                          ),
                                          TextSpan(
                                            text: "Address",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color: ksubHading),
                                          ),
                                          TextSpan(
                                            text:
                                                " - ${data['orderid']["orderData"][0]["bookingdata"]["houseNo"]}, ${data['orderid']["orderData"][0]["bookingdata"]["Street"]},\n",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: ksubHading),
                                          ),
                                          TextSpan(
                                            text:
                                                "${data['orderid']["orderData"][0]["bookingdata"]["state"]} - ${data['orderid']["orderData"][0]["bookingdata"]["pincode"]}\n",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: ksubHading),
                                          ),
                                          TextSpan(
                                            text: "GST: ",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color: ksubHading),
                                          ),
                                          TextSpan(
                                            text: data["Gst"], //"07ABBCS0227P",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: ksubHading),
                                          )
                                        ]),
                                  ),
                                  borderRadius: h * 0.05,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: h * 0.08,
                                      width: w * 0.27,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.02),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  data["orderid"]["orderData"]
                                                      [0]["cars"]["image"]),
                                              fit: BoxFit.fill)),
                                    ),
                                    // Image.asset("assets/images/Uber1.png"),
                                    RichText(
                                      text: TextSpan(
                                          text: data["orderid"]["orderData"][0]
                                              ["cars"]["cars"],
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 9,
                                            height: 2,
                                            color: kTextInputPlaceholderColor,
                                          ),
                                          children: [
                                            TextSpan(
                                                text:
                                                    " ${data["orderid"]["orderData"][0]["brands"]["brands"]}",
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 9,
                                                    height: 2,
                                                    color:
                                                        kTextInputPlaceholderColor))
                                          ]),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        data["type"] == "pdf"
                            ? GestureDetector(
                                onTap: () async {
                                  await launchURL(data["image"]);
                                },
                                child: Container(
                                  height: h * 0.04,
                                  child: Center(
                                      child: Image.asset(
                                    "assets/images/pdf.png",
                                    height: h * 0.03,
                                  )),
                                ),
                              )
                            : data["type"] == "video"
                                ? Center(
                                    child: GestureDetector(
                                        onTap: () async {
                                          // await launchURL(data["image"]);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VideoApp(
                                                        video: data["image"],
                                                      )));
                                        },
                                        child: Container(
                                            height: h * 0.1,
                                            width: w * 0.27,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: w * 0.02),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.03),
                                            ),
                                            child: Stack(
                                              children: [
                                                Center(
                                                    child: Videophoto(
                                                  video: data["image"],
                                                )),
                                                const Center(
                                                    child:
                                                        Icon(Icons.play_arrow))
                                              ],
                                            )
                                            // child: Image.asset(
                                            //     "assets/images/${images[index]}")
                                            )),
                                  )
                                : Visibility(
                                    visible: data["image"] != null,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Images(
                                                      image: data["image"],
                                                    )));
                                      },
                                      child: Hero(
                                        tag: "image",
                                        child: SizedBox(
                                          height: h * 0.2,
                                          child: Center(
                                            child: ListView.builder(
                                              physics: const BouncingScrollPhysics(),
                                              controller: _controller1,
                                              shrinkWrap: true,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: h * 0.015),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 1,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: h * 0.1,
                                                  width: w * 0.27,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: w * 0.02),
                                                  decoration: BoxDecoration(
                                                      // gradient: LinearGradient(
                                                      //     begin: Alignment.bottomCenter,
                                                      //     end: Alignment.center,
                                                      //     colors: [
                                                      //       kblackcolor.withOpacity(0.5),
                                                      //       kTransparent
                                                      //     ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              h * 0.03),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              data["image"]),
                                                          fit: BoxFit.fill)),
                                                  // child: Image.asset(
                                                  //     "assets/images/${images[index]}")
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.09),
                          child: Text(
                            "Customer Concerns",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kTextInputPlaceholderColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(h * 0.015),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: h * 0.18,
                                        padding:
                                            EdgeInsets.only(left: w * 0.02),
                                        decoration: BoxDecoration(
                                            color: kwhitecolor,
                                            borderRadius: BorderRadius.circular(
                                                h * 0.03)),
                                        child: ListView.builder(
                                          controller: _controller2,
                                          padding: EdgeInsets.all(h * 0.01),
                                          shrinkWrap: true,
                                          itemCount: custCon.length,
                                          itemBuilder: ((context, index) {
                                            return Text(
                                              custCon[index],
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: ksubHading,
                                                  height: 1.5),
                                            );
                                            // Row(
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: [
                                            //     Expanded(
                                            //       flex: 2,
                                            //       child: Text(
                                            //         heading[index],
                                            //         style: GoogleFonts.montserrat(
                                            //             fontSize: 10,
                                            //             fontWeight: FontWeight.w700,
                                            //             color: ksubHading,
                                            //             height: 1.5),
                                            //       ),
                                            //     ),
                                            //     VerticalDivider(
                                            //       width: w * 0.05,
                                            //       color: kTextInputPlaceholderColor,
                                            //     ),
                                            //     Expanded(
                                            //       flex: 3,
                                            //       child: Text(
                                            //         subh[index],
                                            //         style: GoogleFonts.montserrat(
                                            //             fontSize: 10,
                                            //             fontWeight: FontWeight.w400,
                                            //             color: ksubHading,
                                            //             height: 1.5),
                                            //       ),
                                            //     ),
                                            //   ],
                                            // );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: w * 0.03,
                              ),
                              Expanded(
                                child: RRectCard(
                                  h: h * 0.18,
                                  shadowColor: kTransparent,
                                  padding:
                                      EdgeInsets.symmetric(vertical: h * 0.015),
                                  widget: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                  "assets/images/numP.png",
                                                  height: h * 0.03,
                                                  width: w * 0.08),
                                            ),
                                            Expanded(
                                              child: Text(
                                                data["orderid"]["orderData"][0]
                                                        ["bookingdata"]["carno"]
                                                    .toString()
                                                    .toUpperCase(),
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 7,
                                                    color:
                                                        kTextInputPlaceholderColor
                                                            .withOpacity(0.48),
                                                    height: 1.5),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                  "assets/images/000.png",
                                                  height: h * 0.03,
                                                  width: w * 0.07),
                                            ),
                                            Expanded(
                                              child: Text(
                                                data["OdometerKms"].toString(),
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 7,
                                                    color:
                                                        kTextInputPlaceholderColor
                                                            .withOpacity(0.48),
                                                    height: 1.5),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                "assets/images/EngineOil.png",
                                                height: h * 0.03,
                                                width: w * 0.07,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                "${data["fuel"]} Points",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 7,
                                                    color:
                                                        kTextInputPlaceholderColor
                                                            .withOpacity(0.48),
                                                    height: 1.5),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  borderRadius: h * 0.02,
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: availeble.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: w * 0.09),
                                child: Text(
                                  "Available",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: kTextInputPlaceholderColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(h * 0.01),
                                child: RRectCard(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.05,
                                        vertical: h * 0.02),
                                    widget: GridView.count(
                                      shrinkWrap: true,
                                      controller: _controller3,
                                      mainAxisSpacing: h * 0.01,
                                      crossAxisSpacing: w * 0.01,
                                      // scrollDirection: Axis.vertical,
                                      crossAxisCount: 3,
                                      padding:
                                          EdgeInsets.only(bottom: h * 0.01),
                                      childAspectRatio: 1.6,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      // padding: EdgeInsets.all(10),
                                      children: List.generate(availeble.length,
                                          (index) {
                                        return RRectCard(
                                          // color: kGreenColor,
                                          h: 10,
                                          borderRadius: h * 0.03,
                                          padding: EdgeInsets.all(h * 0.01),
                                          widget: Center(
                                            child: Text(
                                              availeble[index]["heading"],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    kTextInputPlaceholderColor,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    borderRadius: h * 0.02),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: notavaileble.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: w * 0.09),
                                child: Text(
                                  "Not Available",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: kTextInputPlaceholderColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(h * 0.01),
                                child: RRectCard(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.05,
                                        vertical: h * 0.02),
                                    widget: GridView.count(
                                      shrinkWrap: true,
                                      childAspectRatio: 1.6,
                                      controller: _controller3,
                                      scrollDirection: Axis.vertical,
                                      crossAxisCount: 3,
                                      crossAxisSpacing: w * 0.01,
                                      mainAxisSpacing: h * 0.01,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding:
                                          EdgeInsets.only(bottom: h * 0.01),

                                      // padding: EdgeInsets.all(10),
                                      children: List.generate(
                                          notavaileble.length, (index) {
                                        return RRectCard(
                                          padding: EdgeInsets.all(h * 0.01),
                                          color: kredcolor,
                                          h: 10,
                                          borderRadius: h * 0.03,
                                          shadowColor: kTransparent,
                                          widget: Center(
                                            child: Text(
                                              notavaileble[index]["heading"]
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color: kwhitecolor,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    borderRadius: h * 0.02),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: missing.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: w * 0.09),
                                child: Text(
                                  "Missing Parts",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: kTextInputPlaceholderColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(h * 0.01),
                                child: RRectCard(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.05,
                                        vertical: h * 0.02),
                                    widget: GridView.count(
                                      childAspectRatio: 1.6,
                                      crossAxisSpacing: w * 0.01,
                                      mainAxisSpacing: h * 0.01,
                                      shrinkWrap: true,
                                      controller: _controller3,
                                      scrollDirection: Axis.vertical,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 3,
                                      padding:
                                          EdgeInsets.only(bottom: h * 0.01),
                                      children: List.generate(missing.length,
                                          (index) {
                                        // geninfo[index]["x"]!=3 ? break;
                                        return RRectCard(
                                          padding: EdgeInsets.all(h * 0.01),
                                          // color: kredcolor,
                                          h: 10,
                                          borderRadius: h * 0.03,
                                          widget: Center(
                                            child: Text(
                                              missing[index]["heading"],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    kTextInputPlaceholderColor,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    borderRadius: h * 0.02),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.09),
                          child: Text(
                            "Condition",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kTextInputPlaceholderColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(h * 0.01),
                          child: RRectCard(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.05, vertical: h * 0.02),
                              widget: GridView.count(
                                shrinkWrap: true,
                                childAspectRatio: 1.6,
                                controller: _controller3,
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 3,
                                crossAxisSpacing: w * 0.01,
                                mainAxisSpacing: h * 0.01,

                                // padding: EdgeInsets.all(10),
                                children: List.generate(condi.length, (index) {
                                  return RRectCard(
                                    padding: EdgeInsets.all(h * 0.01),
                                    color: condi[index]["x"] == 1
                                        ? kGreenColor
                                        : condi[index]["x"] == 2
                                            ? korangecolor
                                            : kredcolor,
                                    h: 10,
                                    borderRadius: h * 0.03,
                                    shadowColor: kTransparent,
                                    widget: Center(
                                      child: Text(
                                        condi[index]["heading"],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: kwhitecolor,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              borderRadius: h * 0.02),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.09),
                          child: Text(
                            "Tyres",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kTextInputPlaceholderColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(h * 0.01),
                          child: RRectCard(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.05, vertical: h * 0.02),
                              widget: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: RRectCard(
                                      padding: EdgeInsets.all(h * 0.01),
                                      color: kLightOrangeBgColor,
                                      h: h * 0.15,
                                      borderRadius: h * 0.06,
                                      widget: Center(
                                        child: Text(
                                          "Continental GT (3) MRGF (1)",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: kTextInputPlaceholderColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: GridView.count(
                                        shrinkWrap: true,
                                        childAspectRatio: 1.6,
                                        crossAxisSpacing: w * 0.01,
                                        mainAxisSpacing: h * 0.01,
                                        controller: _controller3,
                                        scrollDirection: Axis.vertical,
                                        crossAxisCount: 2,
                                        // padding: EdgeInsets.all(10),
                                        children: [
                                          RRectCard(
                                            padding: EdgeInsets.all(h * 0.01),
                                            color: data["frontL"] == "G"
                                                ? kGreenColor
                                                : data["frontL"] == "A"
                                                    ? korangecolor
                                                    : kredcolor,
                                            borderRadius: h * 0.025,
                                            widget: Center(
                                              child: Text(
                                                "FRT Left",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: kwhitecolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          RRectCard(
                                            padding: EdgeInsets.all(h * 0.01),
                                            color: data["frontR"] == "G"
                                                ? kGreenColor
                                                : data["frontR"] == "A"
                                                    ? korangecolor
                                                    : kredcolor,
                                            borderRadius: h * 0.025,
                                            widget: Center(
                                              child: Text(
                                                "FRT Right",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: kwhitecolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          RRectCard(
                                            padding: EdgeInsets.all(h * 0.01),
                                            color: data["backL"] == "G"
                                                ? kGreenColor
                                                : data["backL"] == "A"
                                                    ? korangecolor
                                                    : kredcolor,
                                            borderRadius: h * 0.025,
                                            widget: Center(
                                              child: Text(
                                                "RR Left",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: kwhitecolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          RRectCard(
                                            padding: EdgeInsets.all(h * 0.01),
                                            color: data["backR"] == "G"
                                                ? kGreenColor
                                                : data["backR"] == "A"
                                                    ? korangecolor
                                                    : kredcolor,
                                            borderRadius: h * 0.025,
                                            widget: Center(
                                              child: Text(
                                                "RR Right",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: kwhitecolor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                              borderRadius: h * 0.02),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.09),
                          child: Text(
                            "Battery",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kTextInputPlaceholderColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: h * 0.01, horizontal: w * 0.02),
                          child: RRectCard(
                            padding: EdgeInsets.all(h * 0.02),
                            color: data["batterycondition"] == "G"
                                ? kGreenColor
                                : data["batterycondition"] == "A"
                                    ? korangecolor
                                    : kredcolor,
                            borderRadius: h * 0.02,
                            widget: Center(
                              child: Text(
                                data["Battery"],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: kwhitecolor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: w * 0.09),
                          child: Text(
                            "Remarks",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: kTextInputPlaceholderColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: h * 0.01, horizontal: w * 0.02),
                          child: RRectCard(
                            padding: EdgeInsets.all(h * 0.02),
                            color: kwhitecolor,
                            w: w * 0.6,
                            borderRadius: h * 0.02,
                            widget: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: data["OverallRemarks"],
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                      color: ksubHading),
                                  children: [
                                    // TextSpan(
                                    //   text: " Rodriques\n",
                                    //   style: GoogleFonts.montserrat(
                                    //       fontSize: 10,
                                    //       fontWeight: FontWeight.w400,
                                    //       color: ksubHading),
                                    // ),
                                    // TextSpan(
                                    //   text: "Address",
                                    //   style: GoogleFonts.montserrat(
                                    //       fontSize: 10,
                                    //       fontWeight: FontWeight.w700,
                                    //       color: ksubHading),
                                    // ),
                                    // TextSpan(
                                    //   text: " - B-155, Model Town - 3,\n",
                                    //   style: GoogleFonts.montserrat(
                                    //       fontSize: 10,
                                    //       fontWeight: FontWeight.w400,
                                    //       color: ksubHading),
                                    // ),
                                    // TextSpan(
                                    //   text: "Delhi - 110009\n",
                                    //   style: GoogleFonts.montserrat(
                                    //       fontSize: 10,
                                    //       fontWeight: FontWeight.w400,
                                    //       color: ksubHading),
                                    // ),
                                    // TextSpan(
                                    //   text: "GST:",
                                    //   style: GoogleFonts.montserrat(
                                    //       fontSize: 10,
                                    //       fontWeight: FontWeight.w700,
                                    //       color: ksubHading),
                                    // ),
                                    // TextSpan(
                                    //   text: "07ABBCS0227P",
                                    //   style: GoogleFonts.montserrat(
                                    //       fontSize: 10,
                                    //       fontWeight: FontWeight.w400,
                                    //       color: ksubHading),
                                    // )
                                  ]),
                            ),
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       flex: 2,
                        //       child: Row(
                        //         children: [
                        //           Expanded(
                        //             flex: 2,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                   color: kwhitecolor,
                        //                   borderRadius: BorderRadius.only(
                        //                     topLeft: Radius.circular(h * 0.03),
                        //                     bottomLeft: Radius.circular(h * 0.03),
                        //                   )),
                        //               child: ListView.builder(
                        //                 padding: EdgeInsets.all(h * 0.01),
                        //                 shrinkWrap: true,
                        //                 itemCount: heading.length,
                        //                 itemBuilder: ((context, index) {
                        //                   return Text(
                        //                     heading[index],
                        //                     style: GoogleFonts.montserrat(
                        //                         fontSize: 10,
                        //                         fontWeight: FontWeight.w700,
                        //                         color: ksubHading,
                        //                         height: 1.5),
                        //                   );
                        //                 }),
                        //               ),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: w * 0.005,
                        //           ),
                        //           Expanded(
                        //             flex: 3,
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                   color: kwhitecolor,
                        //                   borderRadius: BorderRadius.only(
                        //                     topRight: Radius.circular(h * 0.03),
                        //                     bottomRight: Radius.circular(h * 0.03),
                        //                   )),
                        //               child: ListView.builder(
                        //                 padding: EdgeInsets.all(h * 0.01),
                        //                 shrinkWrap: true,
                        //                 itemCount: subh.length,
                        //                 itemBuilder: ((context, index) {
                        //                   return Text(
                        //                     subh[index],
                        //                     style: GoogleFonts.montserrat(
                        //                         fontSize: 10,
                        //                         fontWeight: FontWeight.w400,
                        //                         color: ksubHading,
                        //                         height: 1.5),
                        //                   );
                        //                 }),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: RRectCard(
                        //         h: h * 0.1,
                        //         w: w * 0.2,
                        //         widget: Row(),
                        //         borderRadius: h * 0.02,
                        //       ),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
    );
  }
}
