import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/Buttons/button.dart';
import '../Utils/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          "Edit Profile",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.05, vertical: h * 0.02),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "My Documment     ",
                            style: GoogleFonts.montserrat(
                                fontSize: 9, fontWeight: FontWeight.w700),
                          ),
                          Icon(Icons.file_upload_outlined,color: kbluecolor,size:h*0.02,)
                        ],
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: "Registration Certificate\n",
                            style: GoogleFonts.montserrat(
                                color: kSelectedColor, fontSize: 8),
                            children: [
                              TextSpan(
                                  text: "Insurance Policy\n",
                                  style: GoogleFonts.montserrat(
                                      color: kSelectedColor, fontSize: 8)),
                              TextSpan(
                                  text: "Other\n",
                                  style: GoogleFonts.montserrat(
                                      color: kSelectedColor, fontSize: 8)),
                            ]),
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: h * 0.03,
                    backgroundColor: kwhitecolor,
                    child: Image.asset(
                      "assets/images/ava1.png",
                      fit: BoxFit.cover,
                      // height: h * 0.1,
                    ),
                  )
                ],
              ),
            ),
            Container(
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
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.05, vertical: h * 0.03),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Name*",
                        hintStyle: GoogleFonts.montserrat(
                            color: kTextInputPlaceholderColor.withOpacity(0.32),
                            fontSize: 13),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.32))),
                        contentPadding: EdgeInsets.only(left: w * 0.02)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Mobile No.*",
                        hintStyle: GoogleFonts.montserrat(
                            color: kTextInputPlaceholderColor.withOpacity(0.32),
                            fontSize: 13),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.32))),
                        contentPadding: EdgeInsets.only(left: w * 0.02)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: GoogleFonts.montserrat(
                            color: kTextInputPlaceholderColor.withOpacity(0.32),
                            fontSize: 13),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.32))),
                        contentPadding: EdgeInsets.only(left: w * 0.02)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "House No.. & Floor*",
                        hintStyle: GoogleFonts.montserrat(
                            color: kTextInputPlaceholderColor.withOpacity(0.32),
                            fontSize: 13),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.32))),
                        contentPadding: EdgeInsets.only(left: w * 0.02)),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Street*",
                        hintStyle: GoogleFonts.montserrat(
                            color: kTextInputPlaceholderColor.withOpacity(0.32),
                            fontSize: 13),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.32))),
                        contentPadding: EdgeInsets.only(left: w * 0.02)),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "State*",
                              hintStyle: GoogleFonts.montserrat(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.32),
                                  fontSize: 13),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.32))),
                              contentPadding: EdgeInsets.only(left: w * 0.02)),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Pin Code*",
                              hintStyle: GoogleFonts.montserrat(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.32),
                                  fontSize: 13),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.32))),
                              contentPadding: EdgeInsets.only(left: w * 0.02)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h*0.04,
                  )
                ],
              ),
            ),
              SizedBox(
                    height: h*0.04,
                  ),
             Center(
              child: RRecctButton(
                h: h * 0.06,
                w: w * 0.9,
                buttonColor: kbluecolor,
                text: "SAVE CHANGES",
                style: GoogleFonts.montserrat(
                    color: kwhitecolor, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
