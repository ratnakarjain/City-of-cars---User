import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottomnavBar.dart';
import 'selectFuel.dart';

class SelectBrand extends StatefulWidget {
  const SelectBrand({Key? key}) : super(key: key);

  @override
  _SelectBrandState createState() => _SelectBrandState();
}

class _SelectBrandState extends State<SelectBrand> {
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();
  var h;
  var w;
  List carLogoList = [
    "BMW_logo.png",
    "Kia_logo.png",
    "Ford_Logo.png",
    "Kia_logo.png",
    "Ford_Logo.png",
    "BMW_logo.png",
    "Ford_Logo.png",
    "BMW_logo.png",
    "Kia_logo.png",
    "BMW_logo.png",
    "Kia_logo.png",
    "Ford_Logo.png",
  ];
  List cars = [
    {
      "name": "Polo",
      "image": "Uber1.png",
    },
    {
      "name": "Rapid",
      "image": "Uber2.png",
    },
    {
      "name": "Civic",
      "image": "Uber3.png",
    },
    {
      "name": "Civic",
      "image": "Uber4.png",
    },
    {
      "name": "Polo",
      "image": "Uber5.png",
    },
    {
      "name": "Polo",
      "image": "Uber1.png",
    },
    {
      "name": "Rapid",
      "image": "Uber2.png",
    },
    {
      "name": "Civic",
      "image": "Uber3.png",
    },
    {
      "name": "Civic",
      "image": "Uber4.png",
    },
  ];
  bool isSelected = false;
  int? item;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 22, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isSelected ? "Select Your Car" : "Select Your Brand",
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: kTextInputPlaceholderColor,
                )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => BottomNavBar(
                        index: 0,
                      ),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                },
                child: Text(
                  "Skip & Explore".toUpperCase(),
                  textScaleFactor: 0.6,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, color: kbluecolor),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(h * 0.1),
          child: 
          Container(
            height: h * 0.07,
            padding:
                EdgeInsets.only(left: w * 0.06, right: w * 0.06, top: h * 0.02),
            child: Material(
              color: kwhitecolor,
              // elevation: 8,
              shadowColor: kTextInputPlaceholderColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(h * 0.025),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: h * 0.01, left: w * 0.05),
                    hintText: "Search",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: ksearchTextColor.withOpacity(0.57),
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: korangecolor, width: 1.0),
                        borderRadius: BorderRadius.circular(h * 0.02)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: kTextInputPlaceholderColor, width: 1.0),
                        borderRadius: BorderRadius.circular(h * 0.02))),
              ),
            ),
          ),
          // Container(
          //     height: h*0.08,
          //     padding: EdgeInsets.only(
          //         left: w * 0.06, right: w * 0.06, top: 20),
          //     child: TextField(
          //       decoration: InputDecoration(
          //           hintText: "Search",
          //           hintStyle: GoogleFonts.montserrat(
          //             fontSize:15,
          //             fontWeight: FontWeight.bold,
          //             color: ksearchTextColor,


          //           ),
          //           suffixIcon: const Icon(
          //             Icons.search,

          //             color: korangecolor,
          //           ),
                    
          //           focusedBorder: OutlineInputBorder(
          //               borderSide:
          //                   const BorderSide(color: korangecolor, width: 1.0),
          //               borderRadius: BorderRadius.circular(h*0.04)),
          //           border: OutlineInputBorder(
          //               borderSide: const BorderSide(
          //                   color: kTextInputPlaceholderColor, width: 1.0),
          //               borderRadius: BorderRadius.circular(h*0.04))),
          //     ),
          //   ),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              isSelected
                  ? Padding(
                      padding: EdgeInsets.all(h * 0.03),
                      child: RRectCard(
                        h: h * 0.12,
                        w: h * 0.12,
                        borderRadius: 25,
                        color: kbluecolor,
                        widget: RRectCard(
                          h: h * 0.12,
                          w: h * 0.12,
                          borderRadius: 25,
                          color: kLightOrangeBgColor,
                          widget:
                              Image.asset("assets/images/${carLogoList[item!]}"),
                        ),
                      ))
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05, vertical: 50),
                      child: GridView.count(
                        shrinkWrap: true,
                        controller: _controller1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: List.generate(carLogoList.length, (index) {
                          return GestureDetector(
                              onTap: () {
                                bottumSheet();
                                item = index;
                                isSelected = true;
                                setState(() {});
                              },
                              child: RRectCard(
                                h: h * 0.18,
                                w: h * 0.18,
                                borderRadius: 30,
                                color: kLightOrangeBgColor,
                                widget: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/${carLogoList[index]}"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ]),
                              ));
                        }),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  bottumSheet() {
    showModalBottomSheet(
        context: context,
        elevation: 8,
        barrierColor: kblackcolor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(h * 0.03),
          topRight: Radius.circular(h * 0.03),
        )),
        builder: (context) {
          return Container(
            width: w,
            decoration: BoxDecoration(
                color: kwhitecolor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8,
                      spreadRadius: 5,
                      color: kblackcolor.withOpacity(0.2))
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(h * 0.03),
                  topRight: Radius.circular(h * 0.03),
                )),
            child: Column(
              children: [
                Text(
                  "Select Cars",
                  textScaleFactor: 1.3,
                  style: GoogleFonts.montserrat(
                      height: 2, fontWeight: FontWeight.w600),
                ),
                Text(
                  "269 shots",
                  textScaleFactor: 0.8,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: kblackcolor.withOpacity(0.6),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    controller: _controller2,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(cars.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectFuel(),
                              ));
                        },
                        child: RRectCard(
                          h: h * 0.18,
                          w: h * 0.18,
                          borderRadius: 30,
                          widget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/${cars[index]["image"]}"),
                                const SizedBox(
                                  height: 5,
                                ),
                                FittedBox(
                                  child: Text(
                                    cars[index]["name"],
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        }).whenComplete(() {
      item = null;
      isSelected = false;
      setState(() {});
    });
  }
}
