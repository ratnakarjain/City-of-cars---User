import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kwhitecolor,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.montserrat(
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kbg2,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(h * 0.08)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        offset: Offset(0, 5),
                        color: kTextInputPlaceholderColor.withOpacity(0.1))
                  ]),
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: kbluecolor,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "You can",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: kTextInputPlaceholderColor,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                          text: " change or add a new car ",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: kTextInputPlaceholderColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                          TextSpan(
                          text: "here",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: kTextInputPlaceholderColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                          ]
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            RRectCard(
              h: h * 0.08,
              w: w * 0.9,
              widget: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: kbluecolor,
                      foregroundColor: kwhitecolor,
                      child: Image.asset("assets/images/sunrise.png"),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "SOS",
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              borderRadius: h * 0.04,
            ),
            RRectCard(
              h: h * 0.08,
              w: w * 0.9,
              widget: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: korangecolor,
                      foregroundColor: kwhitecolor,
                      child: Image.asset("assets/images/heart.png"),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Order History",
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              borderRadius: h * 0.04,
            ),
            RRectCard(
              h: h * 0.08,
              w: w * 0.9,
              widget: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: korangecolor,
                      foregroundColor: kwhitecolor,
                      child: Image.asset("assets/images/heart.png"),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Car Health Analysis",
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              borderRadius: h * 0.04,
            ),
            RRectCard(
              h: h * 0.08,
              w: w * 0.9,
              widget: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: kbluecolor,
                      foregroundColor: kwhitecolor,
                      child: Image.asset("assets/images/sunrise.png"),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Help & Support",
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              borderRadius: h * 0.04,
            ),
            RRectCard(
              h: h * 0.08,
              w: w * 0.9,
              widget: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: korangecolor,
                      foregroundColor: kwhitecolor,
                      child: Image.asset("assets/images/heart.png"),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Log Out",
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
              borderRadius: h * 0.04,
            )
          ],
        ),
      ),
    );
  }
}
