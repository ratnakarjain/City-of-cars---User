// ignore_for_file: deprecated_member_use

import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var h;
  var w;
  List message = ["hlo"];
  var _controller = TextEditingController();
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
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Image.asset("assets/images/ava1.png"),
                      Text(
                        "Support",
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: w * 0.06,
                        top: h * 0.015,
                        bottom: h * 0.015,
                        right: w * 0.03),
                    decoration: BoxDecoration(
                      color: kwhitecolor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(h * 0.1),
                        bottomRight: Radius.circular(h * 0.1),
                      ),
                    ),
                    child: Text(
                      "Hlo",
                      style: GoogleFonts.montserrat(),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: message.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: h * 0.01),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset("assets/images/ava2.png"),
                          Text(
                            "Ryan",
                            style: GoogleFonts.montserrat(
                                fontSize: 13, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: w * 0.05,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        width: w * 0.8,
                        padding: EdgeInsets.only(
                            left: w * 0.06,
                            top: h * 0.015,
                            bottom: h * 0.015,
                            right: w * 0.03),
                        decoration: BoxDecoration(
                          color: kwhitecolor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(h * 0.1),
                            bottomLeft: Radius.circular(h * 0.1),
                          ),
                        ),
                        child: Text(
                          message[index],
                          style: GoogleFonts.montserrat(),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Container(
              color: carhealthColor4,
              height: h * 0.08,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (_controller.text == "") {
                          _scaffoldKey.currentState!.showSnackBar(
                              const SnackBar(content: Text("Empty Text")));
                        } else {
                          message.add(_controller.text);
                          setState(() {
                            _controller.clear();
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: kgrey,
                            borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.elliptical(w * 0.07, h * 0.06))),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: kwhitecolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.only(left: w * 0.08),
                        child: TextFormField(
                          controller: _controller,
                          cursorColor: kgrey,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Say Something…",
                              hintStyle: TextStyle(
                                color: kwhitecolor.withOpacity(0.64),
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                              )),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
