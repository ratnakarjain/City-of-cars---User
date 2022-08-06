// ignore_for_file: avoid_print

import 'package:cityofcars/Screens/notification.dart';
import 'package:cityofcars/Screens/terms.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/url.dart';
import 'verification.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  var prefs = Prefernece.pref;
  String mobilenumber = "";

  var height;
  var width;
  bool istaped1 = false;
  bool istaped2 = false;
  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();

  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  String nameError = "";
  String mobileError = "";
  String emailError = "";
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
    return LayoutBuilder(builder: (context, constraints) {
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
                          nameError = "";
                          emailError = "";
                          mobileError = "";
                          mobile.clear();
                          mail.clear();
                          name.clear();
                          setState(() {});
                        },
                  child: Container(
                    height: height * 0.04,
                    width: width * 0.25,
                    // padding:
                    //     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                                fontSize: 12),
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
                          mobile.clear();

                          setState(() {
                            // mobile.clear();
                          });
                        }
                      : () {},
                  child: Container(
                    height: height * 0.04,
                    width: width * 0.25,
                    // padding:
                    //     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        vertical: height * 0.04, horizontal: 22),
                    decoration: const BoxDecoration(color: kLightOrangeBgColor),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Material(
                            color: kwhitecolor,
                            shadowColor:
                                kTextInputPlaceholderColor.withOpacity(0.3),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(height * 0.05)),
                            child: TextFormField(
                              onTap: () {
                                setState(() {});
                              },
                              focusNode: myFocusNode,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  nameError = "Please Enter name";
                                  setState(() {});
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: ((value) {
                                if (value == " ") {
                                  name.clear();
                                }
                              }),
                              // autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: name,
                              decoration: InputDecoration(
                                hintText: "Name*",
                                errorStyle: const TextStyle(
                                  height: 0,
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: width * 0.1),
                                hintStyle: TextStyle(
                                    color: kTextInputPlaceholderColor
                                        .withOpacity(0.32)),
                                // labelText: "Name*",
                                // labelStyle: TextStyle(
                                //     color: myFocusNode.hasFocus
                                //         ? kbluecolor
                                //         : kTextInputPlaceholderColor
                                //             .withOpacity(0.32)),

                                border: InputBorder.none,

                                focusedBorder: InputBorder.none,
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
                          Visibility(
                            visible: nameError != "",
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Text(
                                  nameError,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: kredcolor,
                                        height: 2,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Material(
                            color: kwhitecolor,
                            shadowColor:
                                kTextInputPlaceholderColor.withOpacity(0.3),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(height * 0.05)),
                            child: TextFormField(
                              controller: mobile,
                              focusNode: myFocusNode1,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9]")),
                              ],
                              // autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  mobileError = "Please Enter mobile Number";
                                  setState(() {});
                                  return "";
                                } else if (value.length != 10) {
                                  setState(() {});
                                  mobileError =
                                      "Mobile no. should be enter 10 digit";
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                if (value == " ") {
                                  mobile.clear();
                                }
                                if (value == "0") {
                                  mobile.clear();
                                }
                              },
                              maxLength: 10,
                              decoration: InputDecoration(
                                hintText: "Mobile No.*",
                                prefixText: "+91 ",
                                counterText: "",
                                errorStyle: const TextStyle(
                                  height: 0,
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: width * 0.03),
                                hintStyle: TextStyle(
                                    color: kTextInputPlaceholderColor
                                        .withOpacity(0.32)),
                                // labelText: "Mobile No.*",
                                // labelStyle: TextStyle(
                                //     color: myFocusNode1.hasFocus
                                //         ? kbluecolor
                                //         : kTextInputPlaceholderColor
                                //             .withOpacity(0.32)),
                                focusedBorder: InputBorder.none,
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
                          Visibility(
                            visible: mobileError != "",
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Text(
                                  mobileError,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: kredcolor,
                                        height: 2,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Material(
                            color: kwhitecolor,
                            shadowColor:
                                kTextInputPlaceholderColor.withOpacity(0.3),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(height * 0.05)),
                            child: TextFormField(
                              onTap: () {
                                setState(() {});
                              },
                              focusNode: myFocusNode2,
                              controller: mail,
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r"\s")),
                                FilteringTextInputFormatter.deny(RegExp('[ ]')),
                              ],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return null;
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  emailError = "Please Enter a valid email id";
                                  return '';
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "E-Mail (Optional)",
                                errorStyle: const TextStyle(
                                  height: 0,
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: width * 0.1),
                                hintStyle: TextStyle(
                                    color: kTextInputPlaceholderColor
                                        .withOpacity(0.32)),
                                // labelText: "E-Mail (Optional)",
                                // labelStyle: TextStyle(
                                //     color: myFocusNode2.hasFocus
                                //         ? kbluecolor
                                //         : kTextInputPlaceholderColor
                                //             .withOpacity(0.32)),
                                focusedBorder: InputBorder.none,
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
                          Visibility(
                            visible: emailError != "",
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Text(
                                  emailError,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: kredcolor,
                                        height: 2,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 22),
                    height: height * 0.15,
                    padding: const EdgeInsets.symmetric(
                        vertical: 29, horizontal: 22),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          onTap: () {
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter mobile Number";
                            } else if (value.length != 10) {
                              return "Mobile no. should be enter 10 digit";
                            } else {
                              return null;
                            }
                          },
                          maxLength: 10,
                          // inputFormatters: [DialCodeFormatter()],
                          focusNode: myFocusNode3,
                          controller: mobile,
                          keyboardType: TextInputType.phone,
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ],
                          onChanged: (value) {
                            if (value == " ") {
                              mobile.clear();
                            }
                            if (value == "0") {
                              mobile.clear();
                            }
                          },
                          decoration: InputDecoration(
                            counterText: "",
                            prefixText: "+91 ",
                            hintText: "Mobile No.*",
                            hintStyle: TextStyle(
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.32)),
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
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),

            //sjahjkdshdjkhakjd sjkndkjand

            const SizedBox(height: 22),
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
                          " Sign in",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              textStyle: const TextStyle(color: kredcolor)),
                        ),
                      ),
                    ],
                  )
                : Container(),
            isSelected
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
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
                          " Sign up",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              textStyle: const TextStyle(color: kredcolor)),
                        ),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(height: 10),
            //this is login button
            Visibility(
              visible: isSelected,
              child: istaped1
                  ? loder
                  : RRecctButton(
                      text: "CONTINUE",
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();

                        if (_formKey.currentState!.validate()) {
                          istaped1 = true;
                          mobilenumber = mobile.text;
                          login();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const Verfication(),
                          //     ));

                          // mobile.clear();
                          // mail.clear();
                          // name.clear();
                          setState(() {});
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
            ),
            // this is register button
            Visibility(
              visible: !isSelected,
              child: istaped2
                  ? loder
                  : RRecctButton(
                      text: "CONTINUE",
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();

                        if (_formKey.currentState!.validate()) {
                          istaped2 = true;
                          nameError = "";
                          emailError = "";
                          mobileError = "";
                          mobilenumber = mobile.text;
                          register().whenComplete(() {
                            nameError = "";
                            emailError = "";
                            mobileError = "";
                          });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const Verfication(),
                          //     ));

                          // mobile.clear();
                          // mail.clear();
                          // name.clear();
                          setState(() {});
                        }
                        setState(() {});
                      },
                      buttonColor: korangecolor,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),
                      h: 52,
                      w: width - 44),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: !isSelected,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Column(
                  children: [
                    Text(
                      "By clicking continue, I agree to the all the ",
                      style: GoogleFonts.montserrat(
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          textStyle: const TextStyle(color: Colors.black)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Terms()));
                      },
                      child: Text(
                        "Terms and Conditions",
                        style: GoogleFonts.montserrat(
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            textStyle: const TextStyle(color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mail.dispose();
    mobile.dispose();
    name.dispose();
  }

  Future register() async {
    var url = Uri.parse(registerUrl);
    try {
      var response = await http.post(url, body: {
        'name': name.text,
        'email': mail.text,
        'mobile': "91" + mobile.text,
        "type": "customer"
        // "role":"624c7a3c9b4a12e570e35d4f"
      });
      var jsonResponse = convert.jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("success");
        if (jsonResponse["status"]) {
          prefs!.setString('token', jsonResponse["token"].toString());
          prefs!.setString('id', jsonResponse["sesdata"]["_id"].toString());
          prefs!.setString('name', jsonResponse["sesdata"]["name"].toString());
          prefs!
              .setString('image', jsonResponse["sesdata"]["image"].toString());
          prefs!.setString(
              'mobile', jsonResponse["sesdata"]["mobile"].toString());
          prefs!.setString(
              'street', jsonResponse["sesdata"]["Street"].toString());
          prefs!
              .setString('state', jsonResponse["sesdata"]["State"].toString());
          prefs!.setString(
              'pincode', jsonResponse["sesdata"]["PinCode"].toString());
          prefs!
              .setString('email', jsonResponse["sesdata"]["email"].toString());
          token = prefs!.getString("token")!;
          Ids.userid = jsonResponse["sesdata"]["_id"];

          print("$token");
          print(Ids.userid);
          istaped2 = false;
          setState(() {});
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Verfication(
                  mobile: mobilenumber,
                  toLogin: false,
                ),
              ));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(jsonResponse["message"]),
          ));
          return response.body;
        } else {
          istaped2 = false;
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(jsonResponse["message"]),
          ));
        }
      } else {
        istaped2 = false;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(jsonResponse["message"]),
        ));
      }
    } catch (e) {
      print("error $e");
      istaped2 = false;
      setState(() {});
    }
  }

  login() async {
    var url = Uri.parse(loginUrl);
    try {
      var response = await http.post(url, body: {
        'mobile': "91" + mobile.text,
        "type": "customer"
        // "roleId":"624c7a3c9b4a12e570e35d4f"
      });
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print("success");
        prefs!.setString("token", jsonResponse["token"]);
        token = prefs!.getString("token")!;
        Ids.userid = jsonResponse["data"]["_id"];
        prefs!.setString('token', jsonResponse["token"].toString());
        prefs!.setString('id', jsonResponse["data"]["_id"].toString());
        prefs!.setString('name', jsonResponse["data"]["name"].toString());
        prefs!.setString('image', jsonResponse["data"]["image"].toString());
        prefs!.setString('mobile', jsonResponse["data"]["mobile"].toString());
        prefs!.setString('street', jsonResponse["data"]["Street"].toString());
        prefs!.setString('state', jsonResponse["data"]["State"].toString());
        prefs!.setString('pincode', jsonResponse["data"]["PinCode"].toString());
        prefs!.setString('email', jsonResponse["data"]["email"].toString());
        print("$token");
        print(Ids.userid);

        istaped1 = false;
        setState(() {});
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Verfication(mobile: mobilenumber, toLogin: true),
            ));
      } else if (response.statusCode == 201) {
        istaped1 = false;
        setState(() {});
        var jsonResponse = convert.jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(jsonResponse["message"]),
        ));
      }
    } catch (e) {
      print("error $e");
    }
  }
}
