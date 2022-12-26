import 'package:cityofcars/Screens/image.dart';
import 'package:cityofcars/Screens/messages.dart';
import 'package:cityofcars/Screens/video.dart';
import 'package:cityofcars/Services/models/ApprovalsModel.dart';
import 'package:cityofcars/Services/models/recentsModel.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Services/servies.dart';
import '../Utils/functions.dart';
import 'bottomnavBar.dart';

class Tracking extends StatefulWidget {
  String? orderid;
  String? time;
  String? date;
  final DateTime ordertime;
  Tracking(
      {Key? key, this.orderid, this.date, this.time, required this.ordertime})
      : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  var h;
  var w;
  bool istapped = false;
  int whichtapped = 0;
  String estimateTime = "";
  List<RecentModel> recent = [];
  List<ApprovalModel1> apprvallist = [];
  bool isloading = true;
  bool esti = false;
  @override
  void initState() {
    super.initState();
    // getestimateTime(widget.orderid.toString()).then((value) {}).whenComplete(() {
    //   esti = true;
    //   setState(() {

    //   });
    // });

    getapproveddetails(widget.orderid.toString()).then((value) {
      apprvallist.addAll(value);
      apprvallist = apprvallist.reversed.toList();
      setState(() {
        print(apprvallist);
      });
    });
    getrecentUpdates(widget.orderid.toString()).then((value) {
      recent.addAll(value);
      recent = recent.reversed.toList();

      setState(() {
        print(recent);

        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kTransparent,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Tracking",
          style: GoogleFonts.montserrat(
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: isloading
          ? loder
          : widget.date == "null" &&
                  widget.time == "null" &&
                  apprvallist.isEmpty &&
                  recent.isEmpty
              ? Center(
                  child: Dummy(
                    time: widget.ordertime,
                    h: h,
                    w: w,
                  ),
                  //  Text(
                  //   "Your order is successfully placed, wait for the scout response",
                  //   textAlign: TextAlign.center,
                  //   style: GoogleFonts.montserrat(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                )
              : Container(
                  decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage("assets/images/trackingback.png"),
                      //     fit: BoxFit.fill)
                      ),
                  height: h,
                  // height: h*0.3,
                  width: w,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child:
                            //  SvgPicture.asset(
                            //   "assets/svg/trackingback.svg",
                            //   width: w,
                            // )
                            Image.asset("assets/images/trackingback.png"),
                      ),
                      SingleChildScrollView(
                        // physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Padding(
                            //   padding:  EdgeInsets.all(h*0.01),
                            //   child: CircleAvatar(
                            //     backgroundColor: kwhitecolor,
                            //     foregroundColor: kTextInputPlaceholderColor,
                            //     child: Icon(Icons.my_location),
                            //   ),
                            // ),
                            SizedBox(
                              height: h * 0.45,
                            ),
                            Visibility(
                              visible: widget.time != "null" ||
                                  widget.date != "null",
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kwhitecolor,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          color: kshadowColor.withOpacity(0.2),
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.03,
                                      vertical: h * 0.015),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  text: "estimate delivery -",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          kTextInputPlaceholderColor),
                                                  children: [
                                                TextSpan(
                                                    text: widget.date
                                                                .toString() ==
                                                            "null"
                                                        ? " "
                                                        : DateFormat(" d MMMM")
                                                            .format(DateTime
                                                                .parse(widget
                                                                    .date
                                                                    .toString())),
                                                    // +
                                                    //             widget.time
                                                    //                 .toString() ==
                                                    //         "null"
                                                    //     ? " "
                                                    //     : " - " +
                                                    //         DateTime.parse(widget
                                                    //                 .time
                                                    //                 .toString())
                                                    //             .hour
                                                    //             .toString() +
                                                    //         ":" +
                                                    //         DateTime.parse(widget
                                                    //                 .time
                                                    //                 .toString())
                                                    //             .minute
                                                    //             .toString() +
                                                    //         " Hrs",

                                                    // widget.date.toString() + "  " + widget.time.toString(),
                                                    style: GoogleFonts.montserrat(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            kTextInputPlaceholderColor),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            //  widget.date.toString() ==
                                                            //         "null"
                                                            //     ? " "
                                                            //     : DateFormat.MMMMd().format(DateTime.parse(widget.date.toString())) +
                                                            //                 widget.time
                                                            //                     .toString() ==
                                                            //             "null"
                                                            //         ? " "
                                                            //         : " - " +
                                                            widget.time.toString() ==
                                                                    "null"
                                                                ? ""
                                                                : " " +
                                                                    DateTime.parse(widget
                                                                            .time
                                                                            .toString())
                                                                        .hour
                                                                        .toString() +
                                                                    ":" +
                                                                    DateTime.parse(widget
                                                                            .time
                                                                            .toString())
                                                                        .minute
                                                                        .toString() +
                                                                    " Hrs",
                                                      )
                                                    ])
                                              ])),
                                          // Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.start,
                                          //   children: [
                                          //     Text("reports & analytics ",
                                          //         style: GoogleFonts.montserrat(
                                          //             fontSize: 9,
                                          //             fontWeight:
                                          //                 FontWeight.w400,
                                          //             color:
                                          //                 kTextInputPlaceholderColor)),
                                          //     Image.asset(
                                          //         "assets/images/network.png")
                                          //   ],
                                          // )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushAndRemoveUntil<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                              builder: (BuildContext context) =>
                                                  BottomNavBar(
                                                index: 2,
                                              ),
                                            ),
                                            (route) =>
                                                false, //if you want to disable back feature set to false
                                          );
                                        },
                                        child: Text("view order",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    kTextInputPlaceholderColor)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const Messages(),
                                              ));
                                        },
                                        child: Text("help",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    kTextInputPlaceholderColor)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Visibility(
                              visible: apprvallist.isNotEmpty,
                              child: ListView.builder(
                                itemCount: apprvallist.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  ApprovalModel1 mod = ApprovalModel1();
                                  mod = apprvallist[index];
                                  return Visibility(
                                    visible: mod.heading != "",
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: kwhitecolor,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 3,
                                                color: kshadowColor
                                                    .withOpacity(0.2),
                                                offset: Offset(0, 3))
                                          ],
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  Radius.circular(h * 0.12))),
                                      margin: EdgeInsets.symmetric(
                                          vertical: h * 0.01),
                                      padding: EdgeInsets.only(
                                          left: w * 0.15,
                                          top: h * 0.01,
                                          bottom: h * 0.02,
                                          right: w * 0.1),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.01,
                                                horizontal: w * 0.04),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      text: "${mod.heading}\n",
                                                      style: GoogleFonts.montserrat(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              kTextInputPlaceholderColor),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                mod.subheading,
                                                            style: GoogleFonts.montserrat(
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: kTextInputPlaceholderColor
                                                                    .withOpacity(
                                                                        0.48))),
                                                      ]),
                                                ),
                                                mod.type == "pdf"
                                                    ? GestureDetector(
                                                        onTap: () async {
                                                          print("object");

                                                          await launchURL(
                                                              mod.image);
                                                        },
                                                        child: Image.asset(
                                                          "assets/images/pdf.png",
                                                          height: h * 0.03,
                                                        ))
                                                    : mod.type == "video"
                                                        ? GestureDetector(
                                                            onTap: () async {
                                                              //  await launchURL(mod.image);
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          VideoApp(
                                                                            video:
                                                                                mod.image,
                                                                          )));
                                                            },
                                                            child: Container(
                                                                height:
                                                                    h * 0.04,
                                                                width: w * 0.2,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(h *
                                                                              0.01),
                                                                  // image: DecorationImage(
                                                                  //     image:
                                                                  //         NetworkImage(
                                                                  //             mod.image),
                                                                  //     fit: BoxFit.fill)
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Center(
                                                                        child:
                                                                            Videophoto(
                                                                      video: mod
                                                                          .image,
                                                                    )),
                                                                    const Center(
                                                                        child: Icon(
                                                                            Icons.play_arrow))
                                                                  ],
                                                                )),
                                                          )
                                                        : mod.type == "image"
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              Images(image: mod.image)));
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      h * 0.04,
                                                                  width:
                                                                      w * 0.2,
                                                                  decoration: BoxDecoration(
                                                                      color: kblackcolor
                                                                          .withOpacity(
                                                                              0.2),
                                                                      borderRadius:
                                                                          BorderRadius.circular(h *
                                                                              0.01),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(mod
                                                                              .image),
                                                                          fit: BoxFit
                                                                              .cover)),
                                                                ),
                                                              )
                                                            : Container()
                                                // Image.asset("assets/images/images2.png")
                                              ],
                                            ),
                                          ),
                                          RRecctButton2(
                                            w: w * 0.8,
                                            widget: Padding(
                                              padding: EdgeInsets.all(h * 0.01),
                                              child:
                                                  mod.approvestatus == "false"
                                                      ? Center(
                                                          child: Text(
                                                            mod.status == "true"
                                                                ? "You approved this request."
                                                                : "You disapproved this request.",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        kwhitecolor),
                                                          ),
                                                        )
                                                      : istapped &&
                                                              whichtapped ==
                                                                  index + 1
                                                          ? loder
                                                          : Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                // Image.asset(
                                                                //     "assets/images/edit.png"),
                                                                SvgPicture
                                                                    .asset(
                                                                  "assets/svg/Edit-2.svg",
                                                                  height:
                                                                      h * 0.03,
                                                                ),
                                                                RichText(
                                                                  text: TextSpan(
                                                                      text:
                                                                          "Do you approve?\n",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              kwhitecolor),
                                                                      children: [
                                                                        TextSpan(
                                                                            text:
                                                                                "qty: ${mod.qty} pcs",
                                                                            style: GoogleFonts.montserrat(
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: ksubHading,
                                                                                height: 2)),
                                                                      ]),
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      istapped =
                                                                          true;
                                                                      whichtapped =
                                                                          index +
                                                                              1;
                                                                      setState(
                                                                          () {});
                                                                      setApprooval(
                                                                              mod.id,
                                                                              "false",
                                                                              context)
                                                                          .whenComplete(() {
                                                                        istapped =
                                                                            false;
                                                                        whichtapped =
                                                                            0;
                                                                        setState(
                                                                            () {
                                                                          Navigator.pushAndRemoveUntil<
                                                                              dynamic>(
                                                                            context,
                                                                            MaterialPageRoute<dynamic>(
                                                                              builder: (BuildContext context) => BottomNavBar(
                                                                                index: 2,
                                                                              ),
                                                                            ),
                                                                            (route) =>
                                                                                false, //if you want to disable back feature set to false
                                                                          );
                                                                        });
                                                                      });
                                                                    },
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          kredcolor,
                                                                      child:
                                                                          Center(
                                                                        child: Image.asset(
                                                                            "assets/images/x.png"),
                                                                      ),
                                                                    )),
                                                                InkWell(
                                                                    onTap: () {
                                                                      istapped =
                                                                          true;
                                                                      whichtapped =
                                                                          index +
                                                                              1;
                                                                      setState(
                                                                          () {});
                                                                      setApprooval(
                                                                              mod.id,
                                                                              "true",
                                                                              context)
                                                                          .whenComplete(() {
                                                                        istapped =
                                                                            false;
                                                                        whichtapped =
                                                                            0;
                                                                        setState(
                                                                            () {
                                                                          Navigator.pushAndRemoveUntil<
                                                                              dynamic>(
                                                                            context,
                                                                            MaterialPageRoute<dynamic>(
                                                                              builder: (BuildContext context) => BottomNavBar(
                                                                                index: 2,
                                                                              ),
                                                                            ),
                                                                            (route) =>
                                                                                false, //if you want to disable back feature set to false
                                                                          );
                                                                        });
                                                                      });
                                                                    },
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          korangecolor,
                                                                      child:
                                                                          Center(
                                                                        child: Image.asset(
                                                                            "assets/images/check.png"),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                            ),
                                            radius: h * 0.04,
                                            buttonColor: kbluecolor,
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
                                  color: kbg2,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(h * 0.05),
                                      topRight: Radius.circular(h * 0.05))),
                              margin: EdgeInsets.only(top: h * 0.01),
                              padding: EdgeInsets.all(h * 0.02),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    itemCount: recent.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(bottom: h * 0.02),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      RecentModel resmdl = RecentModel();
                                      resmdl = recent[index];

                                      return Padding(
                                        padding: EdgeInsets.only(top: h * 0.01),
                                        child: RRecctButton2(
                                          onTap: () {
                                            resmdl.visible = !resmdl.visible;
                                            setState(() {});
                                          },
                                          widget: Padding(
                                            padding: EdgeInsets.all(h * 0.01),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      CircleAvatar(
                                                          backgroundColor:
                                                              kdarkpurple,
                                                          child: Image.asset(
                                                              "assets/images/heart.png")),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                        text: TextSpan(
                                                            text: DateFormat.MMMMd().format(
                                                                    DateTime.parse(
                                                                        resmdl.time
                                                                            .toString())) +
                                                                " - " +
                                                                DateTime.parse(resmdl.time.toString())
                                                                    .hour
                                                                    .toString() +
                                                                ":" +
                                                                DateTime.parse(resmdl
                                                                        .time
                                                                        .toString())
                                                                    .minute
                                                                    .toString() +
                                                                " Hrs\n",
                                                            // " Hrs",
                                                            //       "${resmdl.time}\n",
                                                            style: GoogleFonts.montserrat(
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height:
                                                                    resmdl.time == ""
                                                                        ? 0
                                                                        : 1,
                                                                color: kTextInputPlaceholderColor),
                                                            children: [
                                                              TextSpan(
                                                                  text: resmdl
                                                                          .heading +
                                                                      "\n",
                                                                  // "Scout reached your location",
                                                                  style: GoogleFonts.montserrat(
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          kTextInputPlaceholderColor,
                                                                      height:
                                                                          1.3)),
                                                              TextSpan(
                                                                  text: resmdl
                                                                      .subheading,
                                                                  // "Scout reached your location",
                                                                  style: GoogleFonts.montserrat(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color:
                                                                          kTextInputPlaceholderColor,
                                                                      height:
                                                                          1)),
                                                            ]),
                                                      ),
                                                      Visibility(
                                                        visible: resmdl.visible,
                                                        child: Text(
                                                            resmdl.description,
                                                            // "New to Yoga, or looking to take your mat to practice in new places? Get to know your local community and neighbours better by joining our Yoga family.",
                                                            style: GoogleFonts.montserrat(
                                                                fontSize: 9,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    kTextInputPlaceholderColor,
                                                                height:
                                                                    resmdl.description ==
                                                                            ""
                                                                        ? 0
                                                                        : 1.5)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: h * 0.045,
                                                    width: w * 0.15,
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          right: 0,
                                                          child: resmdl.type ==
                                                                  "pdf"
                                                              ? GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    print(
                                                                        "object");
                                                                    // Navigator.push(
                                                                    //     context,
                                                                    //     MaterialPageRoute(
                                                                    //         builder:
                                                                    //             (context) =>
                                                                    //                 WebVIEW(
                                                                    //                   url: mod
                                                                    //                       .image,
                                                                    //                 )));

                                                                    // launchURL(mod.image);
                                                                    await launchURL(
                                                                        resmdl
                                                                            .file);
                                                                    // getFileFromUrl(
                                                                    //         mod.image)
                                                                    //     .then(
                                                                    //         (value) async {
                                                                    //          await pdflauncher(value.path);
                                                                    //   // launchURL(value.path);

                                                                    //   // await launchUrl(
                                                                    //   //     Uri.parse(
                                                                    //   //         value.path),
                                                                    //   //         mode: LaunchMode.externalApplication
                                                                    //   //         );
                                                                    // });
                                                                  },
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/pdf.png",
                                                                    height: h *
                                                                        0.03,
                                                                  ))
                                                              : resmdl.type ==
                                                                      "video"
                                                                  ? GestureDetector(
                                                                      onTap:
                                                                          () async {
                                                                        //  await launchURL(mod.image);
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                                builder: (context) => VideoApp(
                                                                                      video: resmdl.file,
                                                                                    )));
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(h *
                                                                                0.005),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/video.png",
                                                                            height:
                                                                                h * 0.03,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : InkWell(
                                                                      onTap: resmdl
                                                                              .file
                                                                              .isNotEmpty
                                                                          ? () {
                                                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Images(image: resmdl.file)));
                                                                            }
                                                                          : () {
                                                                              print(resmdl.file);
                                                                            },
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              h * 0.022,
                                                                          backgroundColor:
                                                                              kTransparent,
                                                                          backgroundImage:
                                                                              NetworkImage(
                                                                            resmdl.file,
                                                                          ),
                                                                          // child: Image.asset(
                                                                          //     "assets/images/mask2.png"),
                                                                        ),
                                                                      )),
                                                        ),
                                                        // Positioned(
                                                        //   left: 0,
                                                        //   child: InkWell(
                                                        //       onTap: () {},
                                                        //       child: Center(
                                                        //         child: Image.asset(
                                                        //             "assets/images/mask1.png"),
                                                        //       )),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          radius: h * 0.04,
                                          buttonColor: kwhitecolor,
                                        ),
                                      );
                                      RRecctButton2(
                                        widget: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: h * 0.01,
                                              horizontal: h * 0.01),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        kCursorColor,
                                                    child: Image.asset(
                                                        "assets/images/activity.png")),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                          text:
                                                              "10:02 (1:16 hr)\n",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      kTextInputPlaceholderColor),
                                                          children: [
                                                            TextSpan(
                                                                text:
                                                                    "Spare parts Installed\n",
                                                                style: GoogleFonts.montserrat(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        kTextInputPlaceholderColor,
                                                                    height: 2)),
                                                          ]),
                                                    ),
                                                    Visibility(
                                                      visible: false,
                                                      child: Text("",
                                                          // "New to Yoga, or looking to take your mat to practice in new places? Get to know your local community and neighbours better by joining our Yoga family.",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      kTextInputPlaceholderColor,
                                                                  height: 0)),
                                                    ),

                                                    // SizedBox(
                                                    //   height: h * 0.01,
                                                    // ),
                                                    // Image.asset("assets/images/images.png")
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  height: h * 0.045,
                                                  width: w * 0.15,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        right: 0,
                                                        child: InkWell(
                                                            onTap: () {},
                                                            child: Center(
                                                              child: Image.asset(
                                                                  "assets/images/mask2.png"),
                                                            )),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        child: InkWell(
                                                            onTap: () {},
                                                            child: Center(
                                                              child: Image.asset(
                                                                  "assets/images/mask1.png"),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        radius: h * 0.04,
                                        buttonColor: kwhitecolor,
                                      );
                                    },
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: h * 0.00),
                                    child: RRecctButton2(
                                      onTap: () {},
                                      widget: Padding(
                                        padding: EdgeInsets.all(h * 0.01),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                      backgroundColor:
                                                          korangecolor,
                                                      child: SvgPicture.asset(
                                                          "assets/svg/City.svg")),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                        text: DateFormat('MMMM dd')
                                                                .add_Hm()
                                                                .format(widget
                                                                    .ordertime
                                                                    .toLocal()) +
                                                            " (" +
                                                            (DateTime.now().difference(widget.ordertime.toLocal()).inMinutes < 60
                                                                ? DateTime.now().difference(widget.ordertime.toLocal()).inMinutes.toString() +
                                                                    " mins"
                                                                : DateTime.now()
                                                                        .difference(widget
                                                                            .ordertime
                                                                            .toLocal())
                                                                        .inHours
                                                                        .toString() +
                                                                    " hours") +
                                                            ")",

                                                        // " Hrs",
                                                        //       "${resmdl.time}\n",
                                                        style: GoogleFonts.montserrat(
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                kTextInputPlaceholderColor),
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  "\nYour Order has been placed",
                                                              // "Scout reached your location",
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize: 11,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      kTextInputPlaceholderColor,
                                                                  height: 1.3)),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                height: h * 0.045,
                                                width: w * 0.15,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      right: 0,
                                                      child: Center(
                                                        child: CircleAvatar(
                                                          radius: h * 0.022,
                                                          backgroundColor:
                                                              kTransparent,
                                                          backgroundImage:
                                                              const AssetImage(
                                                            "assets/images/mask2.png",
                                                          ),
                                                          // child: Image.asset(
                                                          //     "assets/images/mask2.png"),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      radius: h * 0.04,
                                      buttonColor: kwhitecolor,
                                    ),
                                  ),

                                  // RRecctButton2(
                                  //   widget: Padding(
                                  //     padding: EdgeInsets.all(h * 0.01),
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //       children: [
                                  //         Expanded(
                                  //           child: CircleAvatar(
                                  //               backgroundColor: kdarkpurple,
                                  //               child:
                                  //                   Image.asset("assets/images/heart.png")),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 4,
                                  //           child: RichText(
                                  //             text: TextSpan(
                                  //                 text: "9:00 (25 min)\n",
                                  //                 style: GoogleFonts.montserrat(
                                  //                     fontSize: 12,
                                  //                     fontWeight: FontWeight.w600,
                                  //                     color: kTextInputPlaceholderColor),
                                  //                 children: [
                                  //                   TextSpan(
                                  //                       text: "Scout reached your location",
                                  //                       style: GoogleFonts.montserrat(
                                  //                           fontSize: 10,
                                  //                           fontWeight: FontWeight.bold,
                                  //                           color:
                                  //                               kTextInputPlaceholderColor,
                                  //                           height: 2)),
                                  //                 ]),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           child: SizedBox(
                                  //             height: h * 0.045,
                                  //             width: w * 0.15,
                                  //             child: Stack(
                                  //               children: [
                                  //                 Positioned(
                                  //                   right: 0,
                                  //                   child: InkWell(
                                  //                       onTap: () {},
                                  //                       child: Center(
                                  //                         child: Image.asset(
                                  //                             "assets/images/mask2.png"),
                                  //                       )),
                                  //                 ),
                                  //                 Positioned(
                                  //                   left: 0,
                                  //                   child: InkWell(
                                  //                       onTap: () {},
                                  //                       child: Center(
                                  //                         child: Image.asset(
                                  //                             "assets/images/mask1.png"),
                                  //                       )),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  //   radius: h * 0.04,
                                  //   buttonColor: kwhitecolor,
                                  // ),
                                  // SizedBox(
                                  //   height: h * 0.02,
                                  // ),
                                  // RRecctButton2(
                                  //   widget: Padding(
                                  //     padding: EdgeInsets.all(h * 0.01),
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //       children: [
                                  //         Expanded(
                                  //           flex: 1,
                                  //           child: CircleAvatar(
                                  //               backgroundColor: kdarkpurple,
                                  //               child:
                                  //                   Image.asset("assets/images/heart.png")),
                                  //         ),
                                  //         Expanded(
                                  //           flex: 4,
                                  //           child: RichText(
                                  //             text: TextSpan(
                                  //                 text: "9:25 (47 min)\n",
                                  //                 style: GoogleFonts.montserrat(
                                  //                     fontSize: 12,
                                  //                     fontWeight: FontWeight.w600,
                                  //                     color: kTextInputPlaceholderColor),
                                  //                 children: [
                                  //                   TextSpan(
                                  //                       text:
                                  //                           "Post Inspection scanning done",
                                  //                       style: GoogleFonts.montserrat(
                                  //                           fontSize: 10,
                                  //                           fontWeight: FontWeight.bold,
                                  //                           color:
                                  //                               kTextInputPlaceholderColor,
                                  //                           height: 2)),
                                  //                 ]),
                                  //           ),
                                  //         ),
                                  //         Expanded(
                                  //           child: SizedBox(
                                  //             height: h * 0.045,
                                  //             width: w * 0.15,
                                  //             child: Stack(
                                  //               children: [
                                  //                 Positioned(
                                  //                   right: 0,
                                  //                   child: InkWell(
                                  //                       onTap: () {},
                                  //                       child: Center(
                                  //                         child: Image.asset(
                                  //                             "assets/images/mask3.png"),
                                  //                       )),
                                  //                 ),
                                  //                 Positioned(
                                  //                   left: 0,
                                  //                   child: InkWell(
                                  //                       onTap: () {},
                                  //                       child: Center(
                                  //                         child: Image.asset(
                                  //                             "assets/images/mask4.png"),
                                  //                       )),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  //   radius: h * 0.04,
                                  //   buttonColor: kwhitecolor,
                                  // ),
                                  // SizedBox(
                                  //   height: h * 0.02,
                                  // ),

                                  // SizedBox(
                                  //   height: h * 0.05,
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(visible: isloading, child: loder),
                    ],
                  )),
    );
  }
}

class Dummy extends StatelessWidget {
  final DateTime time;
  final h;
  final w;
  const Dummy({Key? key, required this.time, required this.h, required this.w});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: Column(
        children: [
          Image.asset(
            "assets/images/Tracking.png",
            width: w,
          ),
          // SvgPicture.asset(
          //   "assets/svg/trackingback.svg",
          //   width: w,
          // ),
          // SizedBox(
          //   height: h*0.1,
          // ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: kbg2,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(h * 0.05),
                        topRight: Radius.circular(h * 0.05))),
                margin: EdgeInsets.only(top: h * 0.01),
                padding: EdgeInsets.all(h * 0.02),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.01),
                      child: RRecctButton2(
                        onTap: () {},
                        widget: Padding(
                          padding: EdgeInsets.all(h * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: korangecolor,
                                        child: SvgPicture.asset(
                                            "assets/svg/City.svg")),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: DateFormat('MMMM dd')
                                                  .add_Hm()
                                                  .format(time.toLocal()) +
                                              " (" +
                                              (DateTime.now()
                                                          .difference(
                                                              time.toLocal())
                                                          .inMinutes <
                                                      60
                                                  ? DateTime.now()
                                                          .difference(
                                                              time.toLocal())
                                                          .inMinutes
                                                          .toString() +
                                                      " mins"
                                                  : DateTime.now()
                                                          .difference(
                                                              time.toLocal())
                                                          .inHours
                                                          .toString() +
                                                      " hours") +
                                              ")",
                                          // " Hrs",
                                          //       "${resmdl.time}\n",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 9,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  kTextInputPlaceholderColor),
                                          children: [
                                            TextSpan(
                                                text:
                                                    "\nYour Order has been placed",
                                                // "Scout reached your location",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        kTextInputPlaceholderColor,
                                                    height: 1.3)),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: h * 0.045,
                                  width: w * 0.15,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 0,
                                        child: Center(
                                          child: CircleAvatar(
                                            radius: h * 0.022,
                                            backgroundColor: kTransparent,
                                            backgroundImage: const AssetImage(
                                              "assets/images/mask2.png",
                                            ),
                                            // child: Image.asset(
                                            //     "assets/images/mask2.png"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        radius: h * 0.04,
                        buttonColor: kwhitecolor,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
