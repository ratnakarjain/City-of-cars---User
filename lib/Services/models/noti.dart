
import 'dart:developer';

import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/Service Main/InsidCategoryTabViw/common_services.dart';



class Notifications extends StatefulWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> titleList = [];
  List<String> bodyList = [];
  List<String> isread = [];
  List<String> reviewList = [];
  List<String> typeList = [];
  List<String> replyIdList = [];

  ScrollController _controller = new ScrollController();
int notificationCount=0;

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: w*0.015),
            child: Text(
              "Notifications",
              style:
                  TextStyle(fontFamily: 'Segoepr', fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),



      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: h*0.03,),
             ListView.builder(
                shrinkWrap: true,
                controller: _controller,
                itemCount: titleList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = titleList[index];
                  return Dismissible(
                    key:UniqueKey(),
                    onDismissed: (direction) async {
                      titleList.removeAt(index);
                      bodyList.removeAt(index);
                      isread.removeAt(index);
                      typeList.removeAt(index);
                      reviewList.removeAt(index);
                      replyIdList.removeAt(index);
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.setStringList("titleList", titleList);
                      pref.setStringList("bodyList", bodyList);
                      pref.setStringList("isRead", isread);
                      pref.setStringList("typeList", typeList);
                      pref.setStringList("reviewIdList", reviewList);
                      pref.setStringList("replyIdList", reviewList);
                      setState(() {

                      });
                    },
                    child: GestureDetector(
                      // onTap: (){
                      //   switch(typeList[index].toString().toLowerCase()){
                      //     case "review":
                      //       NotificationModel model = NotificationModel();
                      //       model.review_id = reviewList[index].toString();
                      //       model.type = typeList[index].toString();
                      //       model.reply_id = replyIdList[index].toString();
                      //       navigatorKey.currentState!.pushNamed("/communityReplyId", arguments: model);
                      //       break;
                      //     case "hotspot":
                      //       NotificationModel model = NotificationModel();
                      //       model.review_id = reviewList[index].toString();
                      //       model.type = typeList[index].toString();
                      //       model.reply_id = replyIdList[index].toString();
                      //       navigatorKey.currentState!.pushNamed("/hotspotreply", arguments: model);
                      //       break;
                      //     case "addhotspot":
                      //       Navigator.pushReplacement(context, MaterialPageRoute(
                      //           builder: (context) =>
                      //               HomeNav(index: 2,)));
                      //       break;
                      //     case "giveaway":
                      //       Navigator.pushReplacement(context, MaterialPageRoute(
                      //           builder: (context) =>
                      //               HomeNav(index: 0,)));
                      //       break;
                      //     case "sendmail":
                      //       Navigator.pushReplacement(context, MaterialPageRoute(
                      //           builder: (context) =>
                      //               HomeNav(index: 0,)));
                      //       break;
                      //     case "business":
                      //       NotificationModel model = NotificationModel();
                      //       model.review_id = reviewList[index].toString();
                      //       model.type = typeList[index].toString();
                      //       model.reply_id = replyIdList[index].toString();

                      //       Navigator.pushNamed(context, "/detailedbusiness", arguments: model);

                      //       break;

                      //     case "businesslist":
                      //       Navigator.pushReplacement(context, MaterialPageRoute(
                      //           builder: (context) =>
                      //               Explore()));
                      //       break;
                      //       case "latest":
                      //       Navigator.pushReplacement(context, MaterialPageRoute(
                      //           builder: (context) =>
                      //               Businesslist()));
                      //       break;
                      //   }

                      // },
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: w*0.04),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w*0.04),
                                  color: kLightOrangeBgColor),
                              child: Column(
                                children: [
                                  Container(


                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: w*0.04),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                 // "One New Message",
                                                  titleList[index].toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: kwhitecolor,
                                                      fontFamily: "Segoepr"),
                                                ),
                                                Text(
                                                 //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                                  bodyList[index].toString(),
                                                  textAlign: TextAlign.left,
                                                  maxLines: 10,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    //overflow: TextOverflow.ellipsis,
                                                      fontSize: 10,
                                                      color: Color(0xFFCECECE),
                                                      fontFamily: 'Roboto'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //
                                          // Padding(
                                          //   padding: const EdgeInsets.all(8.0),
                                          //   child: Column(
                                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //     children: [
                                          //       Padding(
                                          //         padding: EdgeInsets.only(right:2.w),
                                          //         child: Text(
                                          //           "2 hrs ago",
                                          //           style: TextStyle(
                                          //             fontSize: 8.sp,
                                          //             color: kPrimaryColor,
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       SizedBox(height: 30,)
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h*0.01,
                                  ),

                                  // SizedBox(
                                  //   height: 1.h,
                                  // ),

                                ],
                              )),
                          SizedBox(
                            height: h*0.02,
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      
    );
  }

  Future<void> getData() async {

    List<String> isRead = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("titleList")) {
      titleList = preferences.getStringList("titleList")!;
      bodyList = preferences.getStringList("bodyList")!;
      isread = preferences.getStringList("isRead")!;
      typeList = preferences.getStringList("typeList")!;
      reviewList = preferences.getStringList("reviewIdList")!;
      replyIdList = preferences.getStringList("replyIdList")!;
      isread.forEach((element) {
        isRead.add("true");
      });
    }
    print("title list length "+titleList.length.toString()+"^^");
    preferences.setStringList("isRead", isRead);
    preferences.commit();
    notificationCount = 0;
    // context.read<Counter>().getNotify();

    setState(() {
      titleList = titleList.reversed.toList();
      bodyList = bodyList.reversed.toList();
      typeList = typeList.reversed.toList();
      reviewList = reviewList.reversed.toList();
      replyIdList = replyIdList.reversed.toList();
    });
  }

}