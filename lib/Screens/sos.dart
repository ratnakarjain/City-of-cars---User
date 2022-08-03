import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/Buttons/button.dart';
import '../Utils/constants.dart';
import '../Utils/functions.dart';

class Sos extends StatefulWidget {
  const Sos({Key? key}) : super(key: key);

  @override
  State<Sos> createState() => _SosState();
}

class _SosState extends State<Sos> {
  var h;
  var w;
  bool istap = false;
  var _controller = TextEditingController();
  var prob = TextEditingController();
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
          "SOS / Not Sure?",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: h * 0.03,
                  bottom: h * 0.02,
                  left: w * 0.06,
                ),
                child: Text(
                  "Describe your problem?",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 2,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h * 0.38,
                decoration: BoxDecoration(
                    color: kwhitecolor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          h * 0.05,
                        ),
                        bottomLeft: Radius.circular(h * 0.05)),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 3),
                          color: Colors.grey)
                    ]),
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.15, vertical: h * 0.06),
                child: TextFormField(
                  controller: prob,
                  maxLines: 8,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 2,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
                // child:
                // Column(
                //   children: [
                //     Text(
                //       "This pack is essential every 3000 kms or 6 months whichever is earlier",
                //       style: GoogleFonts.montserrat(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w400,
                //         height: 2,
                //       ),
                //     ),
                //     SizedBox(
                //       height: h * 0.02,
                //     ),
                //     Text(
                //       "This pack is essential every 3000 kms or 6 months whichever is earlier",
                //       style: GoogleFonts.montserrat(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w400,
                //         height: 2,
                //       ),
                //     ),
                //     SizedBox(
                //       height: h * 0.02,
                //     ),
                //     Text(
                //       "This pack is essential every 3000 kms or 6 months whichever is earlier",
                //       style: GoogleFonts.montserrat(
                //         fontSize: 10,
                //         fontWeight: FontWeight.w400,
                //         height: 2,
                //       ),
                //     ),
                //   ],
                // ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.06, vertical: h * 0.03),
                child: Material(
                  color: kwhitecolor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(h * 0.06)),
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ],
                    onChanged: (value) {
                      if (value == " ") {
                        _controller.clear();
                      }
                      if (value == "0") {
                        _controller.clear();
                      }
                    },
                    maxLength: 10,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: w * 0.09),
                        hintText: "Mobile No.*",
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 2,
                        ),
                        counterText:"" ,
                        border: InputBorder.none),
                  ),
                ),
              ),
              istaped
                  ? loder
                  : Center(
                      child: RRecctButton(
                        h: h * 0.06,
                        w: w * 0.88,
                        onTap: () {
                          if (_controller.text.isNotEmpty &&
                              prob.text.isNotEmpty) {
                            istaped = true;
                            tosos();
                            setState(() {});
                          }else if (_controller.text.length<10&&prob.text.isNotEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Mobile number should be 10 digit")));
                            
                          }else if (prob.text.isEmpty&&_controller.text.length==10){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter your problem")));
                            
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter complete details")));
                          }
                        },
                        buttonColor: korangecolor,
                        text: "CONFIRM REQUEST",
                        style: GoogleFonts.montserrat(
                            color: kwhitecolor, fontWeight: FontWeight.w600),
                      ),
                    ),
              Center(
                child: Text(
                  "We will respond you as soon as possible!",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 2,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "or",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 2,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  makePhoneCall("9999955555");
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/call.png",
                      height: h * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Call us ",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kbluecolor,
                            height: 2,
                          ),
                          children: [
                            TextSpan(
                              text: "at",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: kTextInputPlaceholderColor,
                                height: 2,
                              ),
                            ),
                            TextSpan(
                              text: " 99999",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: kbluecolor,
                                height: 2,
                              ),
                            ),
                            TextSpan(
                              text: "55555",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: kGreenColor,
                                height: 2,
                              ),
                            ),
                            TextSpan(
                              text: "?",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: kTextInputPlaceholderColor,
                                height: 2,
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future tosos() async {
    await sos(_controller.text, prob.text).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value["msg"]),
      ));
    }).whenComplete(() async {
      istaped = false;
      _controller.clear();
      prob.clear();
      setState(() {});
      // for(int i=0; i<data.length; i++){
      //   plan=data[i]["Plans"];
      //   print(plan.toString()+"+++++++++++=====");
      // }
      //       service.addAll(value);
      //            print("================="+service.toString());
      // print("================="+service[0]["title"].toString());
    });
  }
}
