import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceMain extends StatefulWidget {
  const ServiceMain({Key? key}) : super(key: key);

  @override
  State<ServiceMain> createState() => _ServiceMainState();
}

class _ServiceMainState extends State<ServiceMain> {
  ScrollController _controller1 = new ScrollController();
  ScrollController _controller2 = new ScrollController();
  var h;
  var w;
  int currentPage = 0;
  List backimage = [
    "https://wallpaperaccess.com/full/33110.jpg",
    "https://wallpaperaccess.com/full/14444.jpg",
    "https://wallpaperaccess.com/full/33116.jpg",
    "https://wallpaperaccess.com/full/33118.jpg"
  ];

  List carServices = [
    {
      "services": "Periodic Services",
      "image": "2110.png",
      "type": "custom services"
    },
    {
      "services": "Dent Paint Detailling",
      "image": "2113.png",
      "type": "custom services"
    },
    {
      "services": "Custom Services",
      "image": "2112.png",
      "type": "custom services"
    },
    {
      "services": "Tyres Batteries",
      "image": "2111.png",
      "type": "custom services"
    },
  ];
  List reccomendedPackes = [
    {"services": "clutch", "image": "2114.png", "type": "custom services"},
    {"services": "suspension", "image": "2117.png", "type": "custom services"},
    {"services": "brakes", "image": "2118.png", "type": "custom services"},
    {"services": "clutch", "image": "2114.png", "type": "custom services"},
  ];
  List offers = [
    {
      "offer": "50% off",
      "image": "Offers.png",
      "card": "using ICICI cradit card"
    },
    {
      "offer": "50% off",
      "image": "Offers.png",
      "card": "using CityBank cradit card"
    },
    {
      "offer": "27% off",
      "image": "Offers.png",
      "card": "using HDFC cradit card"
    },
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h*0.18),
        child: AppBar(
          backgroundColor: kTransparent,
          elevation: 0,
          foregroundColor: kwhitecolor,
          title: Text(
            "Delhi",
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: kwhitecolor)),
          ),
          flexibleSpace: Container(
              height: h*0.25,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   height: h*0.2,
          //   child: Stack(
          //     children: [
          //       PageView.builder(
          //           onPageChanged: (value) {
          //             setState(() {
          //               currentPage = value;
          //             });
          //           },
          //           itemCount: backimage.length,
          //           itemBuilder: (context, index) => Container(
          //                 decoration: BoxDecoration(
          //                     image: DecorationImage(
          //                         image: NetworkImage(
          //                           backimage[index],
          //                         ),
          //                         fit: BoxFit.cover)),
          //               )),
          //       Positioned(
          //         bottom: 0,
          //         left: 0,
          //         right: 0,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: backimage.map((url) {
          //             int index = backimage.indexOf(url);
          //             return Container(
          //               width: 8.0,
          //               height: 8.0,
          //               margin: const EdgeInsets.symmetric(
          //                   vertical: 10.0, horizontal: 2.0),
          //               decoration: BoxDecoration(
          //                 shape: BoxShape.circle,
          //                 color: currentPage == index
          //                     ? const Color(0xFFFFFFFF)
          //                     : const Color(0xFFFFFFFF).withOpacity(0.5),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
         Padding(
            padding: EdgeInsets.only(
                left: w * 0.06, right: w * 0.06, top: 20),
            child: Material(
              color: kwhitecolor,
              elevation: 8,
              shadowColor: kTextInputPlaceholderColor.withOpacity(0.3),
              borderRadius:  BorderRadius.circular(h*0.05),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle:
                        GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: kGreenColor),
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: korangecolor, width: 1.0),
                        borderRadius: BorderRadius.circular(h*0.05)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextInputPlaceholderColor,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(h*0.05))),
              ),
            ),
          ),
          SizedBox(
            height: h*0.015,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _controller2,
                
                physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        controller: _controller1,
                        padding: EdgeInsets.symmetric(
                            vertical: h * 0.015, horizontal: h * 0.01),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children:
                            List.generate(carServices.length, (index) {
                          return RRectCard(
                            h: h * 0.18,
                            w: h * 0.18,
                            borderRadius: 10,
                            widget: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "assets/images/${carServices[index]["image"]}"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      carServices[index]["services"],
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          height: 3,
                                          fontSize: 11),
                                    ),
                                  )
                                ]),
                          );
                        }),
                      ),
                      Label(
                        color: kbluecolor,
                        text: "most populer packs",
                        textStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kwhitecolor),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                      ),
                      Container(
                        height: h * 0.18,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(h * 0.01),
                          itemCount: carServices.length,
                          itemBuilder: (context, index) {
                            return RRectCard(
                              h: h * 0.1,
                              w: w * 0.25,
                              borderRadius: 15,
                              widget: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/images/${reccomendedPackes[index]["image"]}"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        reccomendedPackes[index]["services"],
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          height: 2,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: h * 0.01),
                                      child: FittedBox(
                                        child: Text(
                                          reccomendedPackes[index]["type"],
                                          textScaleFactor: 0.6,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                kTextInputPlaceholderColor
                                                    .withOpacity(0.6),
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            );
                          },
                        ),
                      ),
                      Label(
                        color: korangecolor,
                        text: "recommended packs",
                        textStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kwhitecolor),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                      ),
                      Container(
                        height: h * 0.18,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(h * 0.01),
                          itemCount: carServices.length,
                          itemBuilder: (context, index) {
                            return RRectCard(
                              h: h * 0.1,
                              w: w * 0.25,
                              borderRadius: 15,
                              widget: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/images/${reccomendedPackes[index]["image"]}"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        reccomendedPackes[index]["services"],
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          height: 2,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: h * 0.01),
                                      child: FittedBox(
                                        child: Text(
                                          reccomendedPackes[index]["type"],
                                          textScaleFactor: 0.6,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                kTextInputPlaceholderColor
                                                    .withOpacity(0.6),
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            );
                          },
                        ),
                      ),
                      Label(
                        color: kbluecolor,
                        text: "offers & discounts",
                        textStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kwhitecolor),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                      ),
                      Container(
                        height: h * 0.18,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                              horizontal: h * 0.023, vertical: h * 0.01),
                          itemCount: offers.length,
                          itemBuilder: (context, index) {
                            return RRectCard(
                              h: h * 0.1,
                              w: w * 0.28,
                              borderRadius: 15,
                              widget: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/images/${offers[index]["image"]}"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        offers[index]["offer"],
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          height: 2,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: h * 0.01),
                                      child: FittedBox(
                                        child: Text(
                                          offers[index]["card"],
                                          textScaleFactor: 0.6,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                kTextInputPlaceholderColor
                                                    .withOpacity(0.6),
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
