import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Buttons/button.dart';
import '../../Utils/Shapes/widgets.dart';
import '../../Utils/constants.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  ScrollController _controller1 = ScrollController();
  var h;
  var w;
  int currentPage = 0;
  List backimage = [
    "https://wallpaperaccess.com/full/33110.jpg",
    "https://wallpaperaccess.com/full/14444.jpg",
    "https://wallpaperaccess.com/full/33116.jpg",
    "https://wallpaperaccess.com/full/33118.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.18),
        child: AppBar(
          backgroundColor: kTransparent,
          elevation: 0,
          foregroundColor: kwhitecolor,
          title: Text(
            "Offers",
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: kwhitecolor)),
          ),
          flexibleSpace: Container(
            height: h * 0.25,
            child: Stack(
              children: [
                PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: backimage.length,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    backimage[index],
                                  ),
                                  fit: BoxFit.cover)),
                        )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: backimage.map((url) {
                      int index = backimage.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? const Color(0xFFFFFFFF)
                              : const Color(0xFFFFFFFF).withOpacity(0.5),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller1,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              "COC27".toUpperCase(),
              textScaleFactor: 2,
              style: GoogleFonts.montserrat(
                  height: 2,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Text(
              "50% OFF on all orders",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      height: 2,
                      fontWeight: FontWeight.bold,
                      color: kblackcolor.withOpacity(0.50))),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            RRecctButton2(
              onTap: () {
                print(w * 0.13);
              },
              h: h * 0.05,
              w: w * 0.8,
              radius: h * 0.02,
              buttonColor: kGreenColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Apply now ".toUpperCase(),
                      textScaleFactor: 1,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, color: kwhitecolor)),
                  SizedBox(
                    width: w * 0.04,
                  ),
                  Image.asset(
                    "assets/images/doublArrow.png",
                    scale: 0.8,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: h * 0.03),
              width: w,
              child: Stack(
                children: [
                  Container(
                    width: w,
                    margin: EdgeInsets.only(top: h * 0.04),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.05, left: w * 0.051),
                          child: Label(
                            text: "description",
                            color: korangecolor,
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.05, vertical: h * 0.005),
                            textStyle: GoogleFonts.montserrat(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: kwhitecolor),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.013,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                          child: RRectCard(
                              h: h * 0.2,
                              w: w,
                              color: kLightOrangeBgColor,
                              widget: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.09),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: h * 0.027,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                      
                                        children: [
                                          TextSpan(
                                        text: 'This pack is essential every 3000 km or 6 months whichever is earlier\n',
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            color: Colors.black),),
                                          TextSpan(
                                            text:
                                                '\nThis pack is essential every 3000 km or 6 months whichever is earlier\n',
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                                '\nThis pack is essential every 3000 km or 6 months whichever is earlier',
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                    const Center(
                                      child: Icon(Icons.keyboard_arrow_down),
                                    )
                                  ],
                                ),
                              ),
                              borderRadius: h * 0.02),
                        ),
                       SizedBox(height: h*0.03 ,)
                      ],
                    ),
                  ),
                  Center(
                    child: RRectCard(
                        h: h * 0.06,
                        w: w * 0.7,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Valid Till: 27th December",
                                style: GoogleFonts.montserrat(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        borderRadius: h * 0.01),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Row(
              children: [
                SizedBox(
                  width: w * 0.06,
                ),
                Label(
                  text: "terms",
                  color: kbluecolor,
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.05, vertical: h * 0.005),
                  textStyle: GoogleFonts.montserrat(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: kwhitecolor),
                ),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: h * 0.01, left: w * 0.09, right: w * 0.09),
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Who May Use the Services?',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 9,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                '\n\n\nWhen one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.\n\n\n\n\n',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '•Step 1:',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 8,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                ' You may use the Services only if you agree to form a binding contract with us and are not a person barred from receiving services under the laws of the applicable jurisdiction.\n',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '•Step 2:',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 8,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                ' Our Privacy Policy describes how we handle the information you provide to us when you use our Services.\n\n\n\n',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Privacy',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 8,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text:
                                '\n\n\nWhen one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.\n\n',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
