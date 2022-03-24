import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'verification.dart';

class LoginSignUp extends StatefulWidget {
  bool isSignIn;
   LoginSignUp({Key? key, required this.isSignIn}) : super(key: key);

  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  var height;
  var width;
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();

  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();

  var isSelected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
isSelected = widget.isSignIn;
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(top: height * 0.08),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(height * 0.05 / 2),
                onTap: isSelected
                    ? () {}
                    : () {
                        isSelected = !isSelected;
                        setState(() {});
                      },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: isSelected ? kbluecolor : Colors.transparent,
                      borderRadius: BorderRadius.circular(height * 0.05 / 2)),
                  child: Center(
                    child: Text("SIGN IN",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : kSinginTextColor.withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        )),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(height * 0.05 / 2),
                onTap: isSelected
                    ? () {
                        isSelected = !isSelected;

                        setState(() {});
                      }
                    : () {},
                child: Container(
                  height: height * 0.05,
                  width: width * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.05 / 2),
                      color: isSelected ? Colors.transparent : kbluecolor),
                  child: Center(
                    child: Text("SIGN UP",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: isSelected
                                  ? kSinginTextColor.withOpacity(0.6)
                                  : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        )),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          !isSelected
              ? Container(
                  width: width,
                  // height: height * 0.5,
                  padding: EdgeInsets.symmetric(vertical: 29, horizontal: 22),
                  decoration: BoxDecoration(color: kLightOrangeBgColor),
                  child: Center(
                    child: Card(
                        elevation: 3,
                        shadowColor: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.12)),
                        child: Container(
                          //   height: height * 0.45,
                          width: width - 44,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              TextFormField(
                                onTap: () {
                                  setState(() {});
                                },
                                focusNode: myFocusNode,
                                decoration: InputDecoration(
                                  hintText: "Name*",
                                  hintStyle: TextStyle(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.32)),
                                  // labelText: "Name*",
                                  // labelStyle: TextStyle(
                                  //     color: myFocusNode.hasFocus
                                  //         ? kbluecolor
                                  //         : kTextInputPlaceholderColor
                                  //             .withOpacity(0.32)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kbluecolor, width: 1.0),
                                  ),
                                ),
                                cursorColor: kCursorColor,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                onTap: () {
                                  setState(() {});
                                },
                                focusNode: myFocusNode1,
                                decoration: InputDecoration(
                                  hintText: "Mobile No.*",
                                  hintStyle: TextStyle(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.32)),
                                  // labelText: "Mobile No.*",
                                  // labelStyle: TextStyle(
                                  //     color: myFocusNode1.hasFocus
                                  //         ? kbluecolor
                                  //         : kTextInputPlaceholderColor
                                  //             .withOpacity(0.32)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kbluecolor, width: 1.0),
                                  ),
                                ),
                                cursorColor: kCursorColor,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                onTap: () {
                                  setState(() {});
                                },
                                focusNode: myFocusNode2,
                                decoration: InputDecoration(
                                  hintText: "E-Mail (Optional)",
                                  hintStyle: TextStyle(
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.32)),
                                  // labelText: "E-Mail (Optional)",
                                  // labelStyle: TextStyle(
                                  //     color: myFocusNode2.hasFocus
                                  //         ? kbluecolor
                                  //         : kTextInputPlaceholderColor
                                  //             .withOpacity(0.32)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kbluecolor, width: 1.0),
                                  ),
                                ),
                                cursorColor: kCursorColor,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        )),
                  ),
                )
              : Container(
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                  height: 293,
                  padding: EdgeInsets.symmetric(vertical: 29, horizontal: 22),
                  child: Center(
                    child: TextFormField(
                      onTap: () {
                        setState(() {});
                      },
                      focusNode: myFocusNode3,
                      decoration: InputDecoration(
                        hintText: "Mobile No.*",
                        hintStyle: TextStyle(
                            color:
                                kTextInputPlaceholderColor.withOpacity(0.32)),

                        // labelText: "Mobile No.",
                        // labelStyle: TextStyle(
                        //     color: myFocusNode3.hasFocus
                        //         ? kbluecolor
                        //         : kTextInputPlaceholderColor.withOpacity(0.32)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kbluecolor, width: 1.0),
                        ),
                      ),
                      cursorColor: kCursorColor,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
          SizedBox(height: 20),
          RRecctButton(
              text: "CONTINUE",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Verfication(),));
                
              },
              buttonColor: korangecolor,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              h: 52,
              w: width - 44),
          SizedBox(height: 10),
          !isSelected
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.montserrat(
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          textStyle: TextStyle(color: Colors.black)),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Log in",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            textStyle: TextStyle(color: kredcolor)),
                      ),
                    ),
                  ],
                )
              : Container()
        ]),
      ),
    ));
  }
}
