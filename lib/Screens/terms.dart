import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/constants.dart';
import '../Utils/preference.dart';
import 'package:flutter_html/flutter_html.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  var h;
  var w;
  var des;
  @override
  void initState() {
    super.initState();
    des = Prefernece.pref!.getString("us")??"";
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
          "Terms",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                margin: EdgeInsets.only(
                  top: h * 0.01,
                  bottom: h*0.02
                ),
                padding: EdgeInsets.all(h * 0.03),
                decoration: BoxDecoration(
                    color: kwhitecolor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          h * 0.05,
                        ),
                        bottomLeft: Radius.circular(h * 0.05)),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5, offset: Offset(0, 3), color: Colors.grey)
                    ]),
                child:
                Html(
                  data: des.toString(),

                )
                 
              ),
              RRecctButton(
                h: h * 0.06,
                w: w * 0.9,
                buttonColor: kbluecolor,
                text: "CONTINUE",
                style: GoogleFonts.montserrat(
                    color: kwhitecolor, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
