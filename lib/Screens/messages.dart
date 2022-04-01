import 'dart:html';

import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Messages extends StatefulWidget {
  const Messages({ Key? key }) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "Message",
          style: GoogleFonts.montserrat(
            fontSize: 21,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Container(
        height: h,
        width: w,
      ),
    );
  }
}