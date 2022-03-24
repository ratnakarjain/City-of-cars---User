import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              isSelected
                  ? Container()
                  : Text(
                      "Skip",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: kTextInputPlaceholderColor.withOpacity(0.5),
                      )),
                    ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(h * 0.1),
          child: Container(
            padding: EdgeInsets.only(left: w * 0.06, right: w * 0.06, top: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.montserrat(color: kGreenColor),
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: korangecolor, width: 1.0),
                      borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: kTextInputPlaceholderColor, width: 1.0),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            isSelected
                ? Padding(
                    padding: EdgeInsets.all(h * 0.03),
                    child: RRectCard(
                       h: h * 0.15,
                        w: h * 0.15,
                        borderRadius: 30,
                        color: kbluecolor,
                      widget: RRectCard(
                        h: h * 0.15,
                        w: h * 0.15,
                        borderRadius: 30,
                        color: kLightOrangeBgColor,
                        widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/${carLogoList[item!]}"),
                              const SizedBox(
                                height: 5,
                              ),
                            ]),
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
                        child:
                         RRectCard(
                  h: h * 0.18,
                  w: h * 0.18,
                  borderRadius: 30,
                  color: kLightOrangeBgColor,
                  widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/${carLogoList[index]}"),
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
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.05, vertical: 10),
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
                        child: 
                         RRectCard(
                            h: h * 0.18,
                            w: h * 0.18,
                            borderRadius: 30,
                            widget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/${cars[index]["image"]}"),
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
