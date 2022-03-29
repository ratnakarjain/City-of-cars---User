import 'package:cityofcars/Screens/Service%20Main/cart.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/Buttons/button.dart';
import '../../Utils/constants.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
            "Periodic Services",
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.06, vertical: h * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Basic",
                        textScaleFactor: 1.5,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      Text(
                        "Service Pack",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kblackcolor.withOpacity(0.50))),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹2700",
                        textScaleFactor: 1.7,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      Text(
                        "Inclusive of texes",
                        textScaleFactor: 0.9,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: kblackcolor.withOpacity(0.50))),
                      ),
                    ],
                  )
                ],
              ),
            ),
            RRecctButton2(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart(),));
              },
              h: h * 0.05,
              w: w * 0.8,
              radius: h * 0.02,
              buttonColor: kGreenColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Book now ".toUpperCase(),
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
                              h: h * 0.1,
                              w: w,
                              color: kLightOrangeBgColor,
                              widget: Column(
                                children: [
                                  SizedBox(
                                    height: h * 0.027,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.09),
                                    child: Text(
                                      "This pack is essential every 3000 km or 6 months whichever is earlier",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        height: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Icon(Icons.keyboard_arrow_down),
                                  )
                                ],
                              ),
                              borderRadius: h * 0.02),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.032, left: w * 0.051),
                          child: Label(
                            text: "includes",
                            color: kbluecolor,
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.05, vertical: h * 0.005),
                            textStyle: GoogleFonts.montserrat(
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                color: kwhitecolor),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.0271,
                              left: w * 0.15,
                              right: w * 0.15,
                              bottom: h * 0.035),
                          child: RRectCard(
                            borderRadius: h * 0.01,
                            color: kLightOrangeBgColor,
                            h: h * 0.21,
                            w: w * 0.8,
                            widget: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.05, vertical: h * 0.03),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              "assets/images/EngineOil.png",height: h*0.03,),
                                          Text(
                                            "Engine Oil",
                                            textAlign: TextAlign.center,
                                            textScaleFactor: 0.7,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    kTextInputPlaceholderColor
                                                        .withOpacity(0.6)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              "assets/images/oifilter.png",height: h*0.03,),
                                          Text(
                                            "Oil Filter",
                                            textAlign: TextAlign.center,
                                            textScaleFactor: 0.7,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    kTextInputPlaceholderColor
                                                        .withOpacity(0.6)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset("assets/images/wind.png",height: h*0.03,),
                                          Text(
                                            "Air Filter",
                                            textScaleFactor: 0.7,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    kTextInputPlaceholderColor
                                                        .withOpacity(0.6)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  const Divider(
                                    color: Colors.blueGrey,
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              "assets/images/cabin_filter.png",height: h*0.03,),
                                          Text(
                                            "Cabin filter",
                                            textScaleFactor: 0.7,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    kTextInputPlaceholderColor
                                                        .withOpacity(0.6)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                              "assets/images/clutch_overhaul.png",height: h*0.03,),
                                          Text(
                                            "Clutch \noverhaul",
                                            textScaleFactor: 0.7,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    kTextInputPlaceholderColor
                                                        .withOpacity(0.6)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Image.asset(
                                              "assets/images/break_overhaul.png",height: h*0.03,),
                                          Text(
                                            "Breake \noverhaul",
                                            textScaleFactor: 0.7,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    kTextInputPlaceholderColor
                                                        .withOpacity(0.6)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
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
                            Text("Takes 4 hrs",
                                style: GoogleFonts.montserrat(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text("Every 3 months",
                                style: GoogleFonts.montserrat(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text("Rate Card",
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
              margin: EdgeInsets.only(top: h * 0.01,left: w*0.09,right: w*0.09),
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
                          fontWeight: FontWeight.w700, fontSize: 9,
                          color: Colors.black
                          ),
                        children: [
                          TextSpan(
                              text: '\n\n\nWhen one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.\n\n\n\n\n',
                              style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 8,
                          color: Colors.black
                          ),),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '•Step 1:',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 8,
                          color: Colors.black
                          ),
                        children: [
                          TextSpan(
                              text: ' You may use the Services only if you agree to form a binding contract with us and are not a person barred from receiving services under the laws of the applicable jurisdiction.\n',
                              style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 8,
                          color: Colors.black
                          ),),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '•Step 2:',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 8,
                          color: Colors.black
                          ),
                        children: [
                          TextSpan(
                              text: ' Our Privacy Policy describes how we handle the information you provide to us when you use our Services.\n\n\n\n',
                              style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 8,
                          color: Colors.black
                          ),),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Privacy',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 8,
                          color: Colors.black
                          ),
                        children: [
                          TextSpan(
                              text: '\n\n\nWhen one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.\n\n',
                              style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 8,
                          color: Colors.black
                          ),),
                        ],
                      ),
                    )
                  ]),
            ),
            SizedBox(height: h*0.02,)
          ],
        ),
      ),
    );
  }
}