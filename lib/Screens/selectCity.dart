import 'dart:io';

import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/functions.dart';
import 'bottomnavBar.dart';
import 'selectBrand.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key? key}) : super(key: key);

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  ScrollController _controller = ScrollController();
  var size;
  var pref = Prefernece.pref;
  var citydata;
  var searchdata;

  List cityList = [
    {"name": "Delhi", "images": "4.png"},
    {"name": "Gurgoan", "images": "2.png"},
    {"name": "Noida", "images": "3.png"},
    {"name": "Chandigarh", "images": "5.png"}
  ];
  bool loading = true;
  var h;
  final _search = TextEditingController();
  @override
  void initState() {

    getcities().then((value) {
      citydata = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    h = size.height;
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 22, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Your City",
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
          backgroundColor: kwhitecolor,
          elevation: 0,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   height: size.height*0.08,
                //   padding: EdgeInsets.only(
                //       left: size.width * 0.06, right: size.width * 0.06, top: 20),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         hintText: "Search",
                //         hintStyle: GoogleFonts.montserrat(
                //           fontSize:16,
                //           fontWeight: FontWeight.bold,
                //           color: ksearchTextColor,

                //         ),
                //         suffixIcon: const Icon(
                //           Icons.search,

                //           color: korangecolor,
                //         ),

                //         focusedBorder: OutlineInputBorder(
                //             borderSide:
                //                 const BorderSide(color: korangecolor, width: 1.0),
                //             borderRadius: BorderRadius.circular(size.height*0.04)),
                //         border: OutlineInputBorder(
                //             borderSide: const BorderSide(
                //                 color: kTextInputPlaceholderColor, width: 1.0),
                //             borderRadius: BorderRadius.circular(size.height*0.04))),
                //   ),
                // ),
                Container(
                  height: size.height * 0.11,
                  color: kwhitecolor,
                  padding: EdgeInsets.only(
                      left: size.width * 0.06,
                      right: size.width * 0.06,
                      bottom: size.width * 0.05,
                      top: size.height * 0.02),
                  child: Material(
                    color: kwhitecolor,
                    // elevation: 8,
                    shadowColor: kTextInputPlaceholderColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(size.height * 0.025),
                    child: TextFormField(
                      controller: _search,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: size.height * 0.01, left: size.width * 0.05),
                          hintText: "Search",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: ksearchTextColor.withOpacity(0.57),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              // searchCity(_search.text.toString());
                              FocusManager.instance.primaryFocus?.unfocus();
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.search,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: korangecolor, width: 1.0),
                              borderRadius:
                                  BorderRadius.circular(size.height * 0.02)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: kTextInputPlaceholderColor,
                                  width: 1.0),
                              borderRadius:
                                  BorderRadius.circular(size.height * 0.02))),
                    ),
                  ),
                ),
                // Visibility(
                //   visible: _search.text.isNotEmpty,
                //   child: const Center(child: Text("Your search cities"),),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.07, vertical: 50),
                  color: kLightOrangeBgColor,
                  child: Center(
                    child: FutureBuilder(
                        future: _search.text.isEmpty
                            ? getcities()
                            : searchCity(_search.text.toString()),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              print("===========++++++++++" +
                                  snapshot.hasData.toString());
                              print(snapshot.data);
                              if (snapshot.data.length == 0) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.25),
                                  child: Text(
                                    "Did not match",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: kTextInputPlaceholderColor,
                                    )),
                                  ),
                                );
                              }
                              return GridView.count(
                                controller: _controller,
                                shrinkWrap: true,
                                mainAxisSpacing: size.height * 0.02,
                                crossAxisSpacing: size.width * 0.02,
                                crossAxisCount: 2,
                                children: List.generate(snapshot.data.length,
                                    (index) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        CarsData.city =
                                            snapshot.data[index]["city"];
                                        CarsData.cityimage =
                                            snapshot.data[index]["image"];
                                        Ids.cityid =
                                            snapshot.data[index]["_id"];
                                        pref!.setString("cityId", Ids.cityid);
                                        print("=======" + Ids.cityid);
                                        print(CarsData.city);
                                        print(CarsData.cityimage);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SelectBrand(),
                                            ));
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        elevation: 8,
                                        shadowColor:
                                            Colors.grey.withOpacity(0.2),
                                        child: Container(
                                          height: size.height * 0.17,
                                          width: size.height * 0.17,
                                          padding: EdgeInsets.all(
                                              size.height * 0.008),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            size.height * 0.01),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: snapshot
                                                          .data[index]["image"]
                                                          .toString(),
                                                      placeholder:
                                                          (context, url) =>
                                                              Container(),
                                                      // loder,

                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                                  ),
                                                  // Image.network(
                                                  //     snapshot.data[index]["image"].toString()),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  snapshot.data[index]["city"],
                                                  style: GoogleFonts.montserrat(
                                                      textStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            if (snapshot.hasData) {
                              if (snapshot.data.length == 0) {
                                return Text(
                                  "Did not match",
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kTextInputPlaceholderColor,
                                  )),
                                );
                              }
                              return GridView.count(
                                controller: _controller,
                                shrinkWrap: true,
                                mainAxisSpacing: size.height * 0.02,
                                crossAxisSpacing: size.width * 0.02,
                                crossAxisCount: 2,
                                children: List.generate(snapshot.data.length,
                                    (index) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        CarsData.city =
                                            snapshot.data[index]["city"];
                                        CarsData.cityimage =
                                            snapshot.data[index]["image"];
                                        Ids.cityid =
                                            snapshot.data[index]["_id"];
                                        pref!.setString("CarId", Ids.carid);
                                        print(CarsData.city);
                                        print(CarsData.cityimage);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SelectBrand(),
                                            ));
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        elevation: 8,
                                        shadowColor:
                                            Colors.grey.withOpacity(0.2),
                                        child: Container(
                                          height: size.height * 0.17,
                                          width: size.height * 0.17,
                                          padding: EdgeInsets.all(
                                              size.height * 0.008),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            size.height * 0.01),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: snapshot
                                                          .data[index]["image"]
                                                          .toString(),
                                                      placeholder:
                                                          (context, url) =>
                                                              Container(),
                                                      // loder,

                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                                  ),
                                                  // Image.network(
                                                  //     snapshot.data[index]["image"].toString()),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  snapshot.data[index]["city"],
                                                  style: GoogleFonts.montserrat(
                                                      textStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }
                            return Expanded(child: Container(
                                height: h*0.7,
                                child:Padding(
                                  padding: Platform.isIOS? EdgeInsets.only(bottom:  100.0):EdgeInsets.only(bottom:  150.0),
                                  child: loder,
                                )));
                          }
                          return Expanded(child: Container(
                              height: h*0.7,
                              child:Padding(
                                padding: Platform.isIOS? EdgeInsets.only(bottom:  100.0):EdgeInsets.only(bottom:  150.0),
                                child: loder,
                              )));;
                          // print(snapshot.data.length);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
