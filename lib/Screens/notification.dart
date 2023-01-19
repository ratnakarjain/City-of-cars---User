import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/database.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // List<String> titleList = [];
  // List<String> bodyList = [];
  // List<String> isread = [];
  // List<String> timeList = [];
  // List<String> typeList = [];
  List<Note> notificationList = [];
  List<bool> selectedList = [];
  // List<String> replyIdList = [];
  late SharedPreferences preferences;
  bool isloading = true;
  // List selected = [];
  int item = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    getData();

    // isread.add("false");
    // preferences!.setStringList("isRead", isread);
    // selected = List.generate(item, (index) {
    //   return false;
    // });
  }

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // preferences.remove("titleList");
    // preferences.remove("bodyList");
    // preferences.remove("isRead");
    // preferences.remove("timeList");
    // preferences.remove("typeList");

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kLightOrangeBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        child: notificationList.isEmpty
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
                            children:
                                List.generate(notificationList.length, (index) {
                          Note note = notificationList[index];
                          return GestureDetector(
                            onTap: () {
                              switch (note.number.toString().toLowerCase()) {
                                case "presets":
                                  print("presets");
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

                                  break;
                                case "approvel":
                                  print("approvel");
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
                                  break;

                                // case "pendingcart":

                                //   break;
                                // case "offer":

                                //   break;
                                case "conversation":
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
                                case "order":
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
                                  break;

                                case "blogs":
                                  Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          BottomNavBar(
                                        index: 1,
                                      ),
                                    ),
                                    (route) =>
                                        false, //if you want to disable back feature set to false
                                  );

                                  break;
                                case "":
                                  break;
                              }
                            },
                            child: Container(
                              // height: h*0.3,
                              width: w,
                              margin: EdgeInsets.only(
                                  top: index == notificationList.length - 1
                                      ? 0
                                      : (h * 0.05)),
                              padding: EdgeInsets.only(
                                bottom: h * 0.02,
                                top: index == notificationList.length - 1
                                    ? h * 0.15
                                    : ((notificationList.length - index) *
                                        h *
                                        0.11),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(h * 0.06)),
                                  color: !note.isImportant
                                      ? kbluecolor
                                      : kwhitecolor,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.5))
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(top: h * 0.025),
                                    child: CircleAvatar(
                                      radius: h * 0.015,
                                      backgroundColor: !note.isImportant
                                          ? kGreenColor
                                          : carhealthColor4,
                                    ),
                                  )),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${note.title}:\n${note.description}\n",
                                            maxLines:
                                                selectedList[index] ? 200 : 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                fontWeight: !note.isImportant
                                                    ? FontWeight.bold
                                                    : FontWeight.w500,
                                                height: 1.5,
                                                color: !note.isImportant
                                                    ? kwhitecolor
                                                    : kTextInputPlaceholderColor),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  timedifference(note
                                                          .createdTime
                                                          .toIso8601String())
                                                      .toString(),
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 2,
                                                      color: !note.isImportant
                                                          ? kwhitecolor
                                                          : kTextInputPlaceholderColor)),
                                              SizedBox(
                                                height: h * 0.035,
                                                child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedList[index] =
                                                            !selectedList[
                                                                index];
                                                      });
                                                    },
                                                    icon: Icon(
                                                      selectedList[index]
                                                          ? Icons
                                                              .keyboard_arrow_up_rounded
                                                          : Icons
                                                              .keyboard_arrow_down_rounded,
                                                      size: h * 0.04,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ],
                                      ))
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
    // List<String> isRead = [];
    // preferences = await SharedPreferences.getInstance();
    notificationList = await NotesDatabase.instance.readAllNotes();
    selectedList = List.generate(notificationList.length, (index) => false);

    // if (preferences.containsKey("titleList")) {
    //   titleList = preferences.getStringList("titleList")!;
    //   bodyList = preferences.getStringList("bodyList")!;
    //   isread = preferences.getStringList("isRead")!;
    //   timeList = preferences.getStringList("timeList")!;
    //   typeList = preferences.getStringList("typeList")!;
    //   print(preferences.getStringList('titleList'));
    //   print(preferences.getStringList('bodyList'));
    //   print(preferences.getStringList('isRead'));
    //   print(preferences.getStringList('timeList'));
    //   print(preferences.getStringList('typeList'));
    //   if (isread.length < titleList.length) {
    //     isread = List.generate(titleList.length, (index) => "true");
    //   }
    //   selectedList = List.generate(titleList.length, (index) => false);
    //   print("========= $selectedList");
    //   // replyIdList = preferencesgetStringList("replyIdList")!;
    //   // isread.forEach((element) {
    //   //   isRead.add("true");
    //   // });
    // }
    // print("title list length " + titleList.length.toString() + "^^");
    // print("title list length " + titleList.toString() + "^^");
    // print("title list length " + timeList.toString() + "^^");
    // print("type list length " + typeList.toString() + "^^");
    // print("is read list length " + isread.toString() + "^^");
    // preferences.setStringList("isRead", isread);
    // preferences.commit();
    // notificationCount = 0;
    // context.read<Counter>().getNotify();

    setState(() {
      // titleList = titleList.reversed.toList();
      // bodyList = bodyList.reversed.toList();
      // isread = isread.reversed.toList();
      // timeList = timeList.reversed.toList();
      // replyIdList = replyIdList.reversed.toList();
      isloading = false;
    });
    for (var element in notificationList) {
      element.isImportant = true;
    }
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
