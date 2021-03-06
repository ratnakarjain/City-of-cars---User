import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/functions.dart';
import 'bottomnavBar.dart';
import 'editProfile.dart';
import 'messages.dart';

var h;
var w;

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> titleList = [];
  List<String> bodyList = [];
  List<String> isread = [];
  List<String> timeList = [];
  List<String> typeList = [];
  // List<String> replyIdList = [];
  var preferences = Prefernece.pref;
  List selected = [];
  int item = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    selected = List.generate(item, (index) {
      return false;
    });
  }

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
//  preferences!.remove("titleList");
//        preferences!.remove("bodyList");
//      preferences!.remove("isRead");
//        preferences!.remove("timeList");

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kLightOrangeBgColor,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        title: Text(
          "Notifications",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: SizedBox(
        width: w,
        child: titleList.isEmpty
            ? Center(
                child: Text(
                  "No Notifications yet",
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              )
            : LayoutBuilder(
                builder: (context, viewportConstraints) {
                  return SingleChildScrollView(
                    controller: _controller,
                    padding: EdgeInsets.only(bottom: h * 0.1),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.minHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Stack(
                            children: List.generate(titleList.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              print("ontap====");
                              switch (typeList[index].toString().toLowerCase()) {
                                case "editprofile":
                                  print("editprofile");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const EditProfile())));
                                  break;
                                // case "pendingcart":

                                //   break;
                                // case "offer":

                                //   break;
                                case "message":
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Messages())));

                                  break;
                                // case "feedback":

                                //   break;
                                // case "otp":
                                // Navigator.push(context, MaterialPageRoute(builder: ((context) => Messages())));

                                //   break;

                                case "blog":
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => BottomNavBar(
                                                index: 1,
                                              ))));

                                  break;
                                case "":
                                  break;
                              }
                            },
                            child: Container(
                              // height: h*0.3,
                              width: w,
                              margin: EdgeInsets.only(
                                  top: index == titleList.length - 1
                                      ? 0
                                      : (h * 0.05)),
                              padding: EdgeInsets.only(
                                bottom: h * 0.02,
                                top: index == titleList.length - 1
                                    ? h * 0.15
                                    : ((titleList.length - index) * h * 0.11),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(h * 0.06)),
                                  color: isread[index] == "false"
                                      ? kbluecolor
                                      : kwhitecolor,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.5))
                                  ]),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: InkWell(
                                          onTap: () {
                                            // setState(() {
                                            //   isread[index] = "false";
                                            // });
                                          },
                                          child: CircleAvatar(
                                            radius: h * 0.015,
                                            backgroundColor:
                                                isread[index] == "false"
                                                    ? kGreenColor
                                                    : carhealthColor4,
                                          ))),
                                  Expanded(
                                    flex: 3,
                                    child: RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                          text:
                                              "${titleList[index]}:\n${bodyList[index]}\n",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight:
                                                  isread[index] == "false"
                                                      ? FontWeight.bold
                                                      : FontWeight.w500,
                                              height: 1.5,
                                              color: isread[index] == "false"
                                                  ? kwhitecolor
                                                  : kTextInputPlaceholderColor),
                                          children: [
                                            TextSpan(
                                                text: timedifference(
                                                        timeList[index])
                                                    .toString(),
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    height: 2,
                                                    color: isread[index] ==
                                                            "false"
                                                        ? kwhitecolor
                                                        : kTextInputPlaceholderColor)),
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Future<void> getData() async {
    List<String> isRead = [];

    if (preferences!.containsKey("titleList")) {
      titleList = preferences!.getStringList("titleList")!;
      bodyList = preferences!.getStringList("bodyList")!;
      isread = preferences!.getStringList("isRead")!;
      timeList = preferences!.getStringList("timeList")!;
      typeList = preferences!.getStringList("typeList")!;
      // replyIdList = preferences.getStringList("replyIdList")!;
      isread.forEach((element) {
        isRead.add("true");
      });
    }
    print("title list length " + titleList.length.toString() + "^^");
    print("title list length " + titleList.toString() + "^^");
    print("title list length " + timeList.toString() + "^^");
    print("type list length " + typeList.toString() + "^^");
    preferences!.setStringList("isRead", isRead);
    preferences!.commit();
    // notificationCount = 0;
    // context.read<Counter>().getNotify();

    setState(() {
      // titleList = titleList.reversed.toList();
      // bodyList = bodyList.reversed.toList();
      // isread = isread.reversed.toList();
      // timeList = timeList.reversed.toList();
      // replyIdList = replyIdList.reversed.toList();
    });
  }
}



// class Noti extends StatefulWidget {
//   const Noti({Key? key}) : super(key: key);

//   @override
//   State<Noti> createState() => _NotiState();
// }

// class _NotiState extends State<Noti> {
//   List selected = [];
//   int item = 100;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //  notifications(item);
//   }

//   ScrollController _controller = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       // extendBodyBehindAppBar: true,
//       backgroundColor: kLightOrangeBgColor,
//       appBar: AppBar(
//         backgroundColor: kwhitecolor,
//         foregroundColor: kTextInputPlaceholderColor,
//         elevation: 0,
//         title: Text(
//           "Notifications",
//           style:
//               GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: SizedBox(
//         width: w,
//         child: LayoutBuilder(
//           builder: (context, viewportConstraints) {
//             return SingleChildScrollView(
//               controller: _controller,
//               padding: EdgeInsets.only(bottom: h * 0.1),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: viewportConstraints.maxHeight,
//                 ),
//                 child: IntrinsicHeight(
//                   child: Stack(
//                     children: [position(item)],
//                     //     children: List.generate(item, (index) {
//                     //   return Container(
//                     //     // height: h*0.3,
//                     //     width: w,
//                     //     margin: EdgeInsets.only(
//                     //         top: index == item - 1 ? 0 : (h * 0.05)),
//                     //     padding: EdgeInsets.only(
//                     //       bottom: h * 0.02,
//                     //       top: index == item - 1
//                     //           ? h * 0.15
//                     //           : ((item - index) * h * 0.11),
//                     //     ),
//                     //     decoration: BoxDecoration(
//                     //         borderRadius: BorderRadius.only(
//                     //             bottomLeft: Radius.circular(h * 0.06)),
//                     //         color: selected[index] ? kbluecolor : kwhitecolor,
//                     //         boxShadow: [const BoxShadow(blurRadius: 5)]),
//                     //     child: Row(
//                     //       children: [
//                     //         Expanded(
//                     //             child: InkWell(
//                     //                 onTap: () {
//                     //                   setState(() {
//                     //                     selected[index] = !selected[index];
//                     //                   });
//                     //                 },
//                     //                 child: CircleAvatar(
//                     //                   radius: h * 0.015,
//                     //                   backgroundColor: selected[index]
//                     //                       ? kGreenColor
//                     //                       : carhealthColor4,
//                     //                 ))),
//                     //         Expanded(
//                     //           flex: 3,
//                     //           child: RichText(
//                     //             textAlign: TextAlign.start,
//                     //             text: TextSpan(
//                     //                 text:
//                     //                     "Everyday English-French-Spanish: Conversation and Fun - Joe!\n",
//                     //                 style: GoogleFonts.montserrat(
//                     //                     fontSize: 14,
//                     //                     fontWeight: FontWeight.w700,
//                     //                     color: selected[index]
//                     //                         ? kwhitecolor
//                     //                         : kTextInputPlaceholderColor),
//                     //                 children: [
//                     //                   TextSpan(
//                     //                       text: "9 hrs",
//                     //                       style: GoogleFonts.montserrat(
//                     //                           fontSize: 12,
//                     //                           fontWeight: FontWeight.w400,
//                     //                           height: 2,
//                     //                           color: selected[index]
//                     //                               ? kwhitecolor
//                     //                               : kTextInputPlaceholderColor)),
//                     //                 ]),
//                     //           ),
//                     //         )
//                     //       ],
//                     //     ),
//                     //   );
//                     // })
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget notifications(int items) {
//     if (items < 1) {
//       return Container();
//     }
//     return Column(
//       children: [
//         items <= 1 ? Container() : notifications(items--),
//         Container(
//           // height: h*0.3,
//           width: w,
//           // margin: EdgeInsets.only(top:  (h * 0.05)),
//           padding: EdgeInsets.only(bottom: h * 0.02, top: h * 0.02
//               // top: index == item - 1 ? h * 0.15 : ((item - index) * h * 0.11),
//               ),
//           decoration: BoxDecoration(
//               color: kwhitecolor,
//               borderRadius:
//                   BorderRadius.only(bottomLeft: Radius.circular(h * 0.06)),
//               // color: selected[index] ? kbluecolor : kwhitecolor,
//               boxShadow: [const BoxShadow(blurRadius: 5)]),
//           child: Row(
//             children: [
//               Expanded(
//                   child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           // selected[index] = !selected[index];
//                         });
//                       },
//                       child: CircleAvatar(
//                         radius: h * 0.015,
//                         // backgroundColor:
//                         // selected[index] ? kGreenColor : carhealthColor4,
//                       ))),
//               Expanded(
//                 flex: 3,
//                 child: RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(
//                       text:
//                           "Everyday English-French-Spanish: Conversation and Fun - Joe!\n",
//                       style: GoogleFonts.montserrat(
//                         fontSize: 14,
//                         color: kTextInputPlaceholderColor,
//                         fontWeight: FontWeight.w700,
//                         // color: selected[index]
//                         //     ? kwhitecolor
//                         //     : kTextInputPlaceholderColor
//                       ),
//                       children: [
//                         TextSpan(
//                             text: "9 hrs",
//                             style: GoogleFonts.montserrat(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                               height: 2,
//                               // color: selected[index]
//                               //     ? kwhitecolor
//                               //     : kTextInputPlaceholderColor
//                             )),
//                       ]),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   position(int count) {
//     for (int i = 0; i < count; i++) {
//       return Positioned(
//         top: h * 0.12 * i,
//         child: Container(
//           // height: h*0.3,
//           width: w,
//           // margin: EdgeInsets.only(top:  (h * 0.05)),
//           padding: EdgeInsets.only(bottom: h * 0.02, top: h * 0.02
//               // top: index == item - 1 ? h * 0.15 : ((item - index) * h * 0.11),
//               ),
//           decoration: BoxDecoration(
//               color: kwhitecolor,
//               borderRadius:
//                   BorderRadius.only(bottomLeft: Radius.circular(h * 0.06)),
//               // color: selected[index] ? kbluecolor : kwhitecolor,
//               boxShadow: [const BoxShadow(blurRadius: 5)]),
//           child: Row(
//             children: [
//               Expanded(
//                   child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           // selected[index] = !selected[index];
//                         });
//                       },
//                       child: CircleAvatar(
//                         radius: h * 0.015,
//                         // backgroundColor:
//                         // selected[index] ? kGreenColor : carhealthColor4,
//                       ))),
//               Expanded(
//                 flex: 3,
//                 child: RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(
//                       text:
//                           "Everyday English-French-Spanish: Conversation and Fun - Joe!\n",
//                       style: GoogleFonts.montserrat(
//                         fontSize: 14,
//                         color: kTextInputPlaceholderColor,
//                         fontWeight: FontWeight.w700,
//                         // color: selected[index]
//                         //     ? kwhitecolor
//                         //     : kTextInputPlaceholderColor
//                       ),
//                       children: [
//                         TextSpan(
//                             text: "9 hrs",
//                             style: GoogleFonts.montserrat(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                               height: 2,
//                               // color: selected[index]
//                               //     ? kwhitecolor
//                               //     : kTextInputPlaceholderColor
//                             )),
//                       ]),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }

// qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq

// class Try extends StatefulWidget {
//   const Try({Key? key}) : super(key: key);

//   @override
//   State<Try> createState() => _TryState();
// }

// class _TryState extends State<Try> {
//   var h;
//   var w;
//   List selected = [];
//   int item = 100;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     selected = List.generate(item, (index) {
//       return false;
//     });
//   }

//   ScrollController _controller = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: kLightOrangeBgColor,
//       appBar: AppBar(
//         backgroundColor: kwhitecolor,
//         foregroundColor: kTextInputPlaceholderColor,
//         elevation: 0,
//         title: Text(
//           "Notifications",
//           style:
//               GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: SizedBox(
//         width: w,
//         child: LayoutBuilder(
//           builder: (context, viewportConstraints) {
//             return SingleChildScrollView(
//               controller: _controller,
//               padding: EdgeInsets.only(bottom: h * 0.1),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                     minHeight:
//                        viewportConstraints.maxHeight, // h*0.12*(item-1),
//                     maxHeight: double.infinity),
//                 child: IntrinsicHeight(
//                   child: Stack(
//                       children: List.generate(item, (index) {
//                     print(viewportConstraints.maxHeight);
//                     return Positioned(
//                       top: h * 0.12 * (item - 1 - index),
//                       child: Container(
//                         // height: h*0.3,
//                         width: w,
//                         // margin: EdgeInsets.only(
//                         //     top: index == item - 1 ? 0 : (h * 0.05)),
//                         padding: EdgeInsets.only(
//                           bottom: h * 0.02,
//                           top: h * 0.15,
//                         ),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(h * 0.06)),
//                             color: selected[index] ? kbluecolor : kwhitecolor,
//                             boxShadow: const [BoxShadow(blurRadius: 5)]),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 child: InkWell(
//                                     onTap: () {
//                                       setState(() {
//                                         selected[index] = !selected[index];
//                                       });
//                                     },
//                                     child: CircleAvatar(
//                                       radius: h * 0.015,
//                                       backgroundColor: selected[index]
//                                           ? kGreenColor
//                                           : carhealthColor4,
//                                     ))),
//                             Expanded(
//                               flex: 3,
//                               child: RichText(
//                                 textAlign: TextAlign.start,
//                                 text: TextSpan(
//                                     text:
//                                         "Everyday English-French-Spanish: Conversation and Fun - Joe!\n",
//                                     style: GoogleFonts.montserrat(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700,
//                                         color: selected[index]
//                                             ? kwhitecolor
//                                             : kTextInputPlaceholderColor),
//                                     children: [
//                                       TextSpan(
//                                           text: "9 hrs",
//                                           style: GoogleFonts.montserrat(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w400,
//                                               height: 2,
//                                               color: selected[index]
//                                                   ? kwhitecolor
//                                                   : kTextInputPlaceholderColor)),
//                                     ]),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   })),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
