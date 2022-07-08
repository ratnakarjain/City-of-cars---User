// // ignore_for_file: deprecated_member_use

// import 'package:cityofcars/Services/servies.dart';
// import 'package:cityofcars/Utils/Shapes/widgets.dart';
// import 'package:cityofcars/Utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// var h;
// var w;

// class Messages extends StatefulWidget {
//   const Messages({Key? key}) : super(key: key);

//   @override
//   State<Messages> createState() => _MessagesState();
// }

// class _MessagesState extends State<Messages> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//   List message = [
//     {"user": "Support", "message": "Hi"},
//   ];
//   var _controller = TextEditingController();
//   ScrollController _scrollController = ScrollController();
//   List msg = [];
//   bool isloading = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print(Ids.userid);
//     getMess().then((value) {
//       msg.addAll(value);
//       print(msg);
//       isloading = false;
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;
//     return Scaffold(
//         key: _scaffoldKey,
//         backgroundColor: kbg2,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: kwhitecolor,
//           foregroundColor: kTextInputPlaceholderColor,
//           title: Text(
//             "Support",
//             style: GoogleFonts.montserrat(
//                 fontSize: 21, fontWeight: FontWeight.w700),
//           ),
//         ),
//         body: Container(
//           height: h,
//           width: w,
//           child: isloading
//               ? Container()
//               : msg.isEmpty
//                   ? Center(
//                       child: Text(
//                         "No chat yet",
//                         style:
//                             GoogleFonts.montserrat(fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   : Mess(message: msg),
//         ),
//         // Container(
//         //   width: w,
//         //   child: Column(
//         //     mainAxisAlignment: MainAxisAlignment.end,
//         //     children: [
//         //       Column(
//         //         crossAxisAlignment: CrossAxisAlignment.start,

//         //         children: [
//         //           Row(
//         //             children: [
//         //               SizedBox(
//         //                 width: w * 0.05,
//         //               ),
//         //               Image.asset("assets/images/ava1.png"),
//         //               Text(
//         //                 "Support",
//         //                 style: GoogleFonts.montserrat(
//         //                     fontSize: 13, fontWeight: FontWeight.w700),
//         //               )
//         //             ],
//         //           ),
//         //           SizedBox(
//         //             height: h * 0.01,
//         //           ),
//         //           Container(
//         //             padding: EdgeInsets.only(
//         //                 left: w * 0.06,
//         //                 top: h * 0.015,
//         //                 bottom: h * 0.015,
//         //                 right: w * 0.03),
//         //             decoration: BoxDecoration(
//         //               color: kwhitecolor,
//         //               borderRadius: BorderRadius.only(
//         //                 topRight: Radius.circular(h * 0.1),
//         //                 bottomRight: Radius.circular(h * 0.1),
//         //               ),
//         //             ),
//         //             child: Text(
//         //               "Hlo",
//         //               style: GoogleFonts.montserrat(),
//         //             ),
//         //           )
//         //         ],
//         //       ),
//         //     ],
//         //   ),
//         // ),
//         // Column(
//         //   children: [
//         //     SizedBox(
//         //       height: h * 0.01,
//         //     ),
//         //     ListView.builder(
//         //       shrinkWrap: true,
//         //       itemCount: message.length,
//         //       physics: const NeverScrollableScrollPhysics(),
//         //       itemBuilder: (context, index) {
//         //         return Container(
//         //           margin: EdgeInsets.only(top: h * 0.01),
//         //           width: w,
//         //           child: Column(
//         //             crossAxisAlignment: CrossAxisAlignment.end,
//         //             children: [
//         //               Row(
//         //                 mainAxisAlignment: MainAxisAlignment.end,
//         //                 children: [
//         //                   Image.asset("assets/images/ava2.png"),
//         //                   Text(
//         //                     "Ryan",
//         //                     style: GoogleFonts.montserrat(
//         //                         fontSize: 13, fontWeight: FontWeight.w700),
//         //                   ),
//         //                   SizedBox(
//         //                     width: w * 0.05,
//         //                   ),
//         //                 ],
//         //               ),
//         //               SizedBox(
//         //                 height: h * 0.01,
//         //               ),
//         //               Container(
//         //                 width: w * 0.8,
//         //                 padding: EdgeInsets.only(
//         //                     left: w * 0.06,
//         //                     top: h * 0.015,
//         //                     bottom: h * 0.015,
//         //                     right: w * 0.03),
//         //                 decoration: BoxDecoration(
//         //                   color: kwhitecolor,
//         //                   borderRadius: BorderRadius.only(
//         //                     topLeft: Radius.circular(h * 0.1),
//         //                     bottomLeft: Radius.circular(h * 0.1),
//         //                   ),
//         //                 ),
//         //                 child: Text(
//         //                   message[index],
//         //                   style: GoogleFonts.montserrat(),
//         //                 ),
//         //               )
//         //             ],
//         //           ),
//         //         );
//         //       },
//         //     ),
//         //     SizedBox(
//         //       height: h * 0.01,
//         //     ),
//         //   ],
//         // ),

//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: Container(
//           // padding: EdgeInsets.symmetric(horizontal: w*0.01),
//           width: double.infinity,
//           height: h * 0.08,
//           color: carhealthColor4,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () async {
//                   // await sendMessage(_userID.toString(),false, _messageController.text, '0',
//                   //         'imagePath', _receiverID.toString())
//                   //     .then((value) => setState(() {

//                   //   SetInbox(false,_messageController.text.toString().trim(), "0","imagePath", _receiverID.toString(),widget.profileImage, widget.name ).then((value) {
//                   //     _messageController.clear();
//                   //   });

//                   // }));
//                 },
//                 child: Container(
//                   width: w * 0.2,
//                   decoration: BoxDecoration(
//                       color: kgrey,
//                       borderRadius: BorderRadius.only(
//                           bottomRight: Radius.elliptical(w * 0.07, h * 0.06))),
//                   child: GestureDetector(
//                     onTap: () {
//                       if (_controller.text.isNotEmpty) {
//                         postMess(_controller.text).then((value) {
//                           if (value == "success") {
//                             getMess().then((value) {
//                               msg.clear();
//                               msg.addAll(value);
//                               print(msg);
//                               isloading = false;
//                               setState(() {
//                                 _controller.clear();
//                               });
//                             });
//                           }
//                         });
//                       }
//                       // if (_controller.text == "") {
//                       //   _scaffoldKey.currentState!.showSnackBar(
//                       //       const SnackBar(content: Text("Empty Text")));
//                       // } else {
//                       //   message.add({
//                       //     "user": "User",
//                       //     "message": _controller.text,
//                       //   });
//                       //   setState(() {
//                       //     _controller.clear();
//                       //   });
//                       // }
//                     },
//                     child: const Center(
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: kwhitecolor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: w * 0.8,
//                 height: h * 0.07,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(0),
//                   // color: kBackgroundColor,
//                 ),
//                 child: TextFormField(
//                   controller: _controller,
//                   style: GoogleFonts.openSans(
//                       color: kwhitecolor,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400),
//                   onChanged: (value) {},
//                   validator: (val) {},
//                   // focusNode: focusNode,
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                     prefixIconConstraints: const BoxConstraints(minWidth: 30),
//                     suffixIconConstraints: const BoxConstraints(minWidth: 60),
//                     border: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     disabledBorder: InputBorder.none,
//                     hintText: "Say Something…",
//                     hintStyle: GoogleFonts.openSans(
//                         fontStyle: FontStyle.italic,
//                         color: kwhitecolor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Container(
//           //         color: carhealthColor4,
//           //         height: h * 0.08,
//           //         child: Row(
//           //           children: [
//           //             Expanded(
//           //               child: InkWell(
//           //                 onTap: () {
//           //                   if (_controller.text == "") {
//           //                     _scaffoldKey.currentState!.showSnackBar(
//           //                         const SnackBar(content: Text("Empty Text")));
//           //                   } else {
//           //                     message.add(_controller.text);
//           //                     setState(() {
//           //                       _controller.clear();
//           //                     });
//           //                   }
//           //                 },
//           //                 child: Container(
//           //                   decoration: BoxDecoration(
//           //                       color: kgrey,
//           //                       borderRadius: BorderRadius.only(
//           //                           bottomRight:
//           //                               Radius.elliptical(w * 0.07, h * 0.06))),
//           //                   child: Center(
//           //                     child: Icon(
//           //                       Icons.arrow_back,
//           //                       color: kwhitecolor,
//           //                     ),
//           //                   ),
//           //                 ),
//           //               ),
//           //             ),
//           //             Expanded(
//           //               flex: 4,
//           //               child: Container(
//           //                   padding: EdgeInsets.only(left: w * 0.08),
//           //                   child: TextFormField(
//           //                     controller: _controller,
//           //                     cursorColor: kgrey,
//           //                     decoration: InputDecoration(
//           //                         border: InputBorder.none,
//           //                         hintText: "Say Something…",
//           //                         hintStyle: TextStyle(
//           //                           color: kwhitecolor.withOpacity(0.64),
//           //                           fontStyle: FontStyle.italic,
//           //                           fontSize: 16,
//           //                         )),
//           //                   )),
//           //             )
//           //           ],
//           //         ),
//           //       ),

//           // bottomNavigationBar:  Container(
//           //           color: carhealthColor4,
//           //           height: h * 0.08,
//           //           child: Row(
//           //             children: [
//           //               Expanded(
//           //                 child: InkWell(
//           //                   onTap: () {
//           //                     if (_controller.text == "") {
//           //                       _scaffoldKey.currentState!.showSnackBar(
//           //                           const SnackBar(content: Text("Empty Text")));
//           //                     } else {
//           //                       message.add(_controller.text);
//           //                       setState(() {
//           //                         _controller.clear();
//           //                       });
//           //                     }
//           //                   },
//           //                   child: Container(
//           //                     decoration: BoxDecoration(
//           //                         color: kgrey,
//           //                         borderRadius: BorderRadius.only(
//           //                             bottomRight:
//           //                                 Radius.elliptical(w * 0.07, h * 0.06))),
//           //                     child: Center(
//           //                       child: Icon(
//           //                         Icons.arrow_back,
//           //                         color: kwhitecolor,
//           //                       ),
//           //                     ),
//           //                   ),
//           //                 ),
//           //               ),
//           //               Expanded(
//           //                 flex: 4,
//           //                 child: Container(
//           //                     padding: EdgeInsets.only(left: w * 0.08),
//           //                     child: TextFormField(
//           //                       controller: _controller,
//           //                       cursorColor: kgrey,
//           //                       decoration: InputDecoration(
//           //                           border: InputBorder.none,
//           //                           hintText: "Say Something…",
//           //                           hintStyle: TextStyle(
//           //                             color: kwhitecolor.withOpacity(0.64),
//           //                             fontStyle: FontStyle.italic,
//           //                             fontSize: 16,
//           //                           )),
//           //                     )),
//           //               )
//           //             ],
//           //           ),
//           //         ),
//         ));
//   }
// }

// class Mess extends StatelessWidget {
//   List message;
//   Mess({Key? key, required this.message}) : super(key: key);

//   @override
//   ScrollController _scrollController = ScrollController();
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: message.length,
//       padding: EdgeInsets.only(bottom: h * 0.12),
//       shrinkWrap: true,
//       reverse: true,
//       physics: const AlwaysScrollableScrollPhysics(),
//       controller: _scrollController,
//       itemBuilder: (context, index) {
//         int i = message.length-1-index;
//         if(message[i]["type"]=="sender")
//         {
//            return To(msg: message[i]["message"],show:i-1==-1?true:  message[i-1]["type"]!="sender",);
//         }
//         if(message[i]["type"]=="reciver")
//         {
//           return From(msg: message[i]["message"],show:i-1==-1?true: message[i-1]["type"]!="reciver",);
//         }
//         return Container();
//       },
//     );
//   }
// }

// class From extends StatelessWidget {
//   String msg;
//   bool show;
//   From({Key? key, required this.msg, required this.show}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           padding: EdgeInsets.only(top: h * 0.01),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Visibility(
//                 visible: show,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: w * 0.05,
//                     ),
//                     CircleAvatar(
//                       radius: h * 0.02,
//                       child: Image.asset(
//                         "assets/images/ava2.png",
//                         height: h * 0.05,
//                       ),
//                     ),
//                     SizedBox(
//                       width: w * 0.02,
//                     ),
//                     Text(
//                       "Support",
//                       // message[index]["user"],
//                       style: GoogleFonts.montserrat(
//                           fontStyle: FontStyle.italic,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       width: w * 0.05,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: h * 0.01,
//               ),
//               Container(
//                 constraints:
//                     BoxConstraints(minWidth: w * 0.1, maxWidth: w * 0.8),
//                 padding: EdgeInsets.only(
//                     left: w * 0.05,
//                     top: h * 0.015,
//                     bottom: h * 0.015,
//                     right: w * 0.1),
//                 decoration: BoxDecoration(
//                   color: kwhitecolor,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(h * 0.1),
//                     bottomRight: Radius.circular(h * 0.1),
//                   ),
//                 ),
//                 child: Text(
//                   msg,
//                   // message[index]["message"],
//                   // "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
//                   style: GoogleFonts.montserrat(),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class To extends StatelessWidget {
//   bool show;
//    String msg;
//    To({Key? key,required this.msg, required this.show}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(
//           padding: EdgeInsets.only(top: h * 0.01),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Visibility(
//                 visible: show,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: w * 0.05,
//                     ),
//                     Text(
//                       prefs!.getString("name").toString(),
//                       // message[index]["user"],
//                       style: GoogleFonts.montserrat(
//                           fontStyle: FontStyle.italic,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       width: w * 0.02,
//                     ),
//                     CircleAvatar(
//                       radius: h * 0.02,
//                       backgroundColor: kTransparent,
//                       backgroundImage: NetworkImage(prefs!.getString("image").toString()),
//                     ),

//                     SizedBox(
//                       width: w * 0.05,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: h * 0.01,
//               ),
//               Container(
//                 constraints:
//                     BoxConstraints(minWidth: w * 0.1, maxWidth: w * 0.8),
//                 padding: EdgeInsets.only(
//                   left: w * 0.1,
//                   top: h * 0.015,
//                   bottom: h * 0.015,
//                   right: w * 0.03,
//                 ),
//                 decoration: BoxDecoration(
//                   color: kwhitecolor,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(h * 0.1),
//                     bottomLeft: Radius.circular(h * 0.1),
//                   ),
//                 ),
//                 child: Text(
//                    msg,
//                   // "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
//                   style: GoogleFonts.montserrat(),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/models/messageModel.dart';
import '../Services/servies.dart';
import '../Utils/constants.dart';

var h;
var w;

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List message = [
    {"user": "Support", "message": "Hi"},
  ];
  var _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List<MessageModel> msg = [];
  bool isloading = true;
  bool send = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(Ids.userid);
    getMess().then((value) {
      if (value != null) {
        msg.addAll(value);
      }

      isloading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: kbg2,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kwhitecolor,
          foregroundColor: kTextInputPlaceholderColor,
          title: Text(
            "Support",
            style: GoogleFonts.montserrat(
                fontSize: 21, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          height: h,
          width: w,
          child: isloading
              ? Container()
              : msg.isEmpty
                  ? Center(
                      child: Text(
                        "No chat yet",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                      ),
                    )
                  : Mess(message: msg),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          // padding: EdgeInsets.symmetric(horizontal: w*0.01),
          width: double.infinity,
          height: h * 0.08,
          color: carhealthColor4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: FloatingActionButton(
                  backgroundColor: kgrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(w * 0.07, h * 0.06))),
                  onPressed: !send
                      ? () {}
                      : () {
                          if (_controller.text.isNotEmpty) {
                            setState(() {
                              send = false;
                            });
                            postMess(_controller.text).then((value) {
                              if (value != null) {
                                msg.clear();
                                msg.addAll(value);
                                isloading = false;
                                setState(() {
                                  _controller.clear();
                                  send = true;
                                });
                              }
                            });
                            // if (value == "success") {
                            //   getMess().then((value) {
                            //     msg.clear();
                            //     msg.addAll(value);
                            //     print(msg);
                            //     isloading = false;
                            //     setState(() {
                            //       _controller.clear();
                            //     });
                            //   });
                            // }
                            // });
                          }
                          // if (_controller.text == "") {
                          //   _scaffoldKey.currentState!.showSnackBar(
                          //       const SnackBar(content: Text("Empty Text")));
                          // } else {
                          //   message.add({
                          //     "user": "User",
                          //     "message": _controller.text,
                          //   });
                          //   setState(() {
                          //     _controller.clear();
                          //   });
                          // }
                        },
                  child: SizedBox(
                    height: h * 0.08,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kwhitecolor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: w * 0.8,
                  height: h * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    // color: kBackgroundColor,
                  ),
                  child: TextFormField(
                    controller: _controller,
                    enabled: send,

                    style: GoogleFonts.openSans(
                        color: kwhitecolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    onChanged: (value) {
                      if (value == " ") {
                        _controller.clear();
                        setState(() {});
                      }
                    },
                    validator: (val) {},
                    // focusNode: focusNode,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      prefixIconConstraints: const BoxConstraints(minWidth: 30),
                      suffixIconConstraints: const BoxConstraints(minWidth: 60),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Say Something…",
                      hintStyle: GoogleFonts.openSans(
                          fontStyle: FontStyle.italic,
                          color: kwhitecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Mess extends StatelessWidget {
  List<MessageModel> message;
  Mess({Key? key, required this.message}) : super(key: key);

  @override
  ScrollController _scrollController = ScrollController();
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: message.length,
      padding: EdgeInsets.only(bottom: h * 0.12),
      shrinkWrap: true,
      reverse: true,
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index) {
        print("+++++" + message.length.toString());
        int i = message.length - 1 - index;

        if (message[i].type == "sender") {
          return To(
            msg: message[i].message,
            show: i - 1 == -1 ? true : message[i - 1].type != "sender",
          );
        }
        if (message[i].type == "resiver") {
          return From(
            msg: message[i].message,
            show: i - 1 == -1 ? true : message[i - 1].type != "resiver",
          );
        }
        return Container();
      },
    );
  }
}

class From extends StatelessWidget {
  String msg;
  bool show;
  From({Key? key, required this.msg, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: h * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: show,
                child: Row(
                  children: [
                    SizedBox(
                      width: w * 0.05,
                    ),
                    CircleAvatar(
                      radius: h * 0.02,
                      child: Image.asset(
                        "assets/images/ava2.png",
                        height: h * 0.05,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Text(
                      "Support",
                      // message[index]["user"],
                      style: GoogleFonts.montserrat(
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: w * 0.05,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Container(
                constraints:
                    BoxConstraints(minWidth: w * 0.1, maxWidth: w * 0.8),
                padding: EdgeInsets.only(
                    left: w * 0.05,
                    top: h * 0.015,
                    bottom: h * 0.015,
                    right: w * 0.1),
                decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(h * 0.1),
                    bottomRight: Radius.circular(h * 0.1),
                  ),
                ),
                child: Text(
                  msg,
                  // message[index]["message"],
                  // "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
                  style: GoogleFonts.montserrat(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class To extends StatelessWidget {
  bool show;
  String msg;
  To({Key? key, required this.msg, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(top: h * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                visible: show,
                child: Row(
                  children: [
                    SizedBox(
                      width: w * 0.05,
                    ),
                    Text(
                      prefs!.getString("name").toString(),
                      // message[index]["user"],
                      style: GoogleFonts.montserrat(
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    CircleAvatar(
                      radius: h * 0.02,
                      backgroundColor: kTransparent,
                      backgroundImage:
                          NetworkImage(prefs!.getString("image").toString()),
                    ),
                    SizedBox(
                      width: w * 0.05,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Container(
                constraints:
                    BoxConstraints(minWidth: w * 0.1, maxWidth: w * 0.8),
                padding: EdgeInsets.only(
                  left: w * 0.1,
                  top: h * 0.015,
                  bottom: h * 0.015,
                  right: w * 0.03,
                ),
                decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(h * 0.1),
                    bottomLeft: Radius.circular(h * 0.1),
                  ),
                ),
                child: Text(
                  msg,
                  // "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
                  style: GoogleFonts.montserrat(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
