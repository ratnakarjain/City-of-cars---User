import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var h;
  var w;
  List selected = [];
  int item = 22;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = List.generate(item, (index) {
      return false;
    });
  }

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

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
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          // controller: _controller,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: h * 0.05),
          child: Stack(children:
               List.generate(item, (index) {
                return Container(
                  // height: h*0.3,
                  width: w,
                  margin: EdgeInsets.only(top: index == item - 1 ? 0 : (h * 0.05)),
                  padding: EdgeInsets.only(
                    bottom: h * 0.02,
                    top: index == item - 1 ? h * 0.15 : ((item - index) * h * 0.11),
                  ),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(h * 0.06)),
                      color: selected[index] ? kbluecolor : kwhitecolor,
                      boxShadow: [BoxShadow(blurRadius: 5)]),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  selected[index] = !selected[index];
                                });
                              },
                              child: CircleAvatar(
                                radius: h * 0.015,
                                backgroundColor:
                                    selected[index] ? kGreenColor : carhealthColor4,
                              ))),
                      Expanded(
                        flex: 3,
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text:
                                  "Everyday English-French-Spanish: Conversation and Fun - Joe!\n",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: selected[index]
                                      ? kwhitecolor
                                      : kTextInputPlaceholderColor),
                              children: [
                                TextSpan(
                                    text: "9 hrs",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 2,
                                        color: selected[index]
                                            ? kwhitecolor
                                            : kTextInputPlaceholderColor)),
                              ]),
                        ),
                      )
                    ],
                  ),
                );
              })
                 


                
              ),
        ),
      ),
    );
  }
}
