// ignore_for_file: avoid_print

import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Services/signInSignUp.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:country_codes/country_codes.dart';
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
  var mail = TextEditingController();
  var mobile = TextEditingController();
  var name = TextEditingController();

  var height;
  var width;
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();

  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();

  var isSelected;
  var _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = widget.isSignIn;
    // mobile.text = "1234567890";
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // height: height,
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
                  height: height * 0.04,
                  width: width * 0.25,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

                        setState(() {
                          // mobile.clear();
                        });
                      }
                    : () {},
                child: Container(
                  height: height * 0.04,
                  width: width * 0.25,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          const SizedBox(height: 20),
          !isSelected
              ? Container(
                  width: width,
                  // height: height * 0.5,
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: 22),
                  decoration: const BoxDecoration(color: kLightOrangeBgColor),
                  child: Center(
                    child: Card(
                        elevation: 3,
                        shadowColor: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.12)),
                        child: Container(
                          //   height: height * 0.45,
                          width: width - 44,
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.06,
                              vertical: height * 0.035),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  focusNode: myFocusNode,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: name,
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

                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kTextInputPlaceholderColor
                                              .withOpacity(0.3)),
                                    ),

                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kbluecolor, width: 1.0),
                                    ),
                                  ),
                                  cursorColor: kCursorColor,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  controller: mobile,
                                  focusNode: myFocusNode1,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter mobile Number";
                                    } else if (value.length != 10) {
                                      return "Mobile no. length shuld 10";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Mobile No.*",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kTextInputPlaceholderColor
                                              .withOpacity(0.3)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.32)),
                                    // labelText: "Mobile No.*",
                                    // labelStyle: TextStyle(
                                    //     color: myFocusNode1.hasFocus
                                    //         ? kbluecolor
                                    //         : kTextInputPlaceholderColor
                                    //             .withOpacity(0.32)),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kbluecolor, width: 1.0),
                                    ),
                                  ),
                                  cursorColor: kCursorColor,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  focusNode: myFocusNode2,
                                  controller: mail,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return null;
                                    } else if (!RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return 'Enter a valid email!';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "E-Mail (Optional)",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: kTextInputPlaceholderColor
                                              .withOpacity(0.3)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.32)),
                                    // labelText: "E-Mail (Optional)",
                                    // labelStyle: TextStyle(
                                    //     color: myFocusNode2.hasFocus
                                    //         ? kbluecolor
                                    //         : kTextInputPlaceholderColor
                                    //             .withOpacity(0.32)),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: kbluecolor, width: 1.0),
                                    ),
                                  ),
                                  cursorColor: kCursorColor,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        )),
                  ),
                )
              : Container(
                  width: width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                  height: height * 0.15,
                  padding:
                      const EdgeInsets.symmetric(vertical: 29, horizontal: 22),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        onTap: () {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter mobile Number";
                          } else if (value.length != 10) {
                            return "Mobile no. length shuld 10";
                          } else {
                            return null;
                          }
                        },
                        // inputFormatters: [DialCodeFormatter()],
                        focusNode: myFocusNode3,
                        controller: mobile,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Mobile No.*",
                          hintStyle: TextStyle(
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.32)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.3)),
                          ),

                          // labelText: "Mobile No.",
                          // labelStyle: TextStyle(
                          //     color: myFocusNode3.hasFocus
                          //         ? kbluecolor
                          //         : kTextInputPlaceholderColor.withOpacity(0.32)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: kbluecolor, width: 1.0),
                          ),
                        ),
                        cursorColor: kCursorColor,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(height: 20),
          RRecctButton(
              text: "CONTINUE",
              onTap: !isSelected
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        // register(name.text, mail.text, mobile.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Verfication(),
                            ));
                        mobile.clear();
                        mail.clear();
                        name.clear();
                        print("gogogogogogo");
                      }
                    }
                  : () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Verfication(),
                            ));
                        mobile.clear();
                        mail.clear();
                        name.clear();
                      }
                    },
              buttonColor: korangecolor,
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              h: 52,
              w: width - 44),
          const SizedBox(height: 10),
          !isSelected
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.montserrat(
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          textStyle: const TextStyle(color: Colors.black)),
                    ),
                    InkWell(
                      onTap: () {
                        isSelected = !isSelected;
                        setState(() {
                          mobile.clear();
                          mail.clear();
                          name.clear();
                        });
                      },
                      child: Text(
                        " Log in",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            textStyle: const TextStyle(color: kredcolor)),
                      ),
                    ),
                  ],
                )
              : Container()
        ]),
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mail.dispose();
    mobile.dispose();
    name.dispose();
  }
}
