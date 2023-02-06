// import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Screens/loginSignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/servies.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var h;
  var w;
  int currentPage = 0;

  List cardData = [
    {
      "image": "assets/svg/Get_Started.svg",
      "heading": "Get started",
      "subheading":
          "We aims to solve all your problems related to cars. Let’s start with the services first."
    },
    {
      "image": "assets/svg/Book.svg",
      "heading": "Book",
      "subheading":
          "Select services, book your time slot and pay as per your convenience through multiple payment modes.",
    },
    {
      "image": "assets/svg/Track.svg",
      "heading": "Track & Analyse",
      "subheading":
          "We provide excellent customer experience and provide real-time updates and analytics.",
    },
  ];

  String _authStatus = 'Unknown';

  Future<void> initPlugin() async {
    // final TrackingStatus status =
    //     await AppTrackingTransparency.trackingAuthorizationStatus;
    // setState(() => _authStatus = '$status');
    // // If the system can show an authorization request dialog
    // if (status == TrackingStatus.notDetermined) {
    //   // Request system's tracking authorization dialog
    //   await Future.delayed(const Duration(milliseconds: 200));
    //   final TrackingStatus status =
    //       await AppTrackingTransparency.requestTrackingAuthorization();
    //   setState(() => _authStatus = '$status');
    // }
    // final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
  }

  @override
  void initState() {
    initPlugin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    @override
    void initState() {
      super.initState();
      getcmsdata();
    }

    return Scaffold(
      backgroundColor: kscaffoldcolor,
      body: SizedBox(
        height: h,
        width: w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: cardData.length,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            top: h * 0.08,
                            left: w * 0.05,
                            right: w * 0.05,
                            bottom: h * 0.02),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(h * 0.08)),
                          child: Container(
                            padding: EdgeInsets.all(h * 0.02),
                            height: h * 0.6,
                            width: w * 0.9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Image.asset(cardData[index]["image"]!),
                                Expanded(
                                    flex: 3,
                                    child: SvgPicture.asset(
                                        cardData[index]["image"])),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: h * 0.02,
                                  ),
                                  child: Center(
                                    child: Text(
                                      cardData[index]["heading"],
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 2,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: w * 0.8,
                                    padding: EdgeInsets.only(
                                        top: h * 0.015, bottom: h * 0.04),
                                    child: Center(
                                      child: Text(
                                        cardData[index]["subheading"],
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1,
                                        style: GoogleFonts.montserrat(
                                            color: kblacklightshadecolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cardData.map((url) {
                int index = cardData.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index ? kdarkpurple : ksubHading,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            RRecctButton(
              text: "LOGIN",
              h: h * 0.06,
              w: w * 0.88,
              buttonColor: kbluecolor,
              style: GoogleFonts.montserrat(
                color: kwhitecolor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginSignUp(
                        isSignIn: true,
                      ),
                    ));
              },
            ),
            SizedBox(
              height: h * 0.02,
            ),
            RRecctButton(
              text: "SIGNUP",
              h: h * 0.06,
              w: w * 0.88,
              buttonColor: korangecolor,
              style: GoogleFonts.montserrat(
                  color: kwhitecolor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginSignUp(
                        isSignIn: false,
                      ),
                    ));
              },
            ),
            SizedBox(
              height: h * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
