import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/constants.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var h;
  var w;
  var des;
  @override
  void initState() {
    super.initState();
    des = Prefernece.pref!.getString("us") ?? "";
  }

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
          "About us",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
          padding:
              EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.05),
          child: SingleChildScrollView(
              child: Html(
            data: des.toString(),
          ))),
    );
  }
}
