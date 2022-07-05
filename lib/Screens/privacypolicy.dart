import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/constants.dart';
import '../Utils/preference.dart';
class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({ Key? key }) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
          "Privacy Policy",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: h*0.02,horizontal: w*0.05),
        child: RichText(
          text: TextSpan(
            // text: "Heading\n",
            style:
              GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: kTextInputPlaceholderColor),
              children: [
                TextSpan(
                  text: des.toString(),
                   style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, color: kTextInputPlaceholderColor),
                )
              ]
          ),
        ),
      ),
    );
  }
}