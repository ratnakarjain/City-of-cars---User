import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Services/servies.dart';
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
  bool loading = true;
  bool brandsloading = true;
  int? item;
  String selctedImage = "";
  int? shots;
  final _brand = TextEditingController();
  @override
  void initState() {
    super.initState();
    // shots= 0;
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // var abc = Provider.of<Shots>(context, listen: true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kbg3,
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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushAndRemoveUntil<dynamic>(
              //       context,
              //       MaterialPageRoute<dynamic>(
              //         builder: (BuildContext context) => BottomNavBar(
              //           index: 0,
              //         ),
              //       ),
              //       (route) =>
              //           false, //if you want to disable back feature set to false
              //     );
              //   },
              //   child: Text(
              //     "Skip & Explore".toUpperCase(),
              //     textScaleFactor: 0.6,
              //     style: GoogleFonts.montserrat(
              //         fontWeight: FontWeight.w600, color: kbluecolor),
              //   ),
              // ),
            ],
          ),
        ),
        backgroundColor: kwhitecolor,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(h * 0.1),
          child: Container(
            height: h * 0.07,
            margin: EdgeInsets.only(bottom: h * 0.025),
            padding:
                EdgeInsets.only(left: w * 0.06, right: w * 0.06, top: h * 0.02),
            child: Material(
              color: kwhitecolor,
              // elevation: 8,
              shadowColor: kTextInputPlaceholderColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(h * 0.025),
              child: TextField(
                controller: _brand,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: h * 0.01, left: w * 0.05),
                    hintText: "Search",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: ksearchTextColor.withOpacity(0.57),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        brandsloading = true;
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.search,
                      ),
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
      body:
          //  isLoading
          //     ? const Align(
          //         alignment: Alignment.center,
          //         child: loder)
          //     :
          Stack(
        children: [
          Container(
            height: h,
            width: w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Visibility(
                  //   visible: _brand.text.isNotEmpty,
                  //   child: const Center(child: Text("Your search cities"),),
                  // ),
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
                              color: kwhitecolor,
                              padding: EdgeInsets.all(h * 0.01),
                              widget: Container(
                                height: h * 0.1,
                                width: h * 0.1,

                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(h * 0.015),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          selctedImage.toString(),
                                        ),
                                        fit: BoxFit.fill)),
                                // child: Image.network(
                                //   snapshot.data[index]["image"]
                                //       .toString(),
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                            ),
                          ))
                      : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.05, vertical: 50),
                          child: Center(
                            child: FutureBuilder(
                              future: _brand.text.isEmpty
                                  ? getBrandss().whenComplete(() {
                                      print("=======================get");
                                      brandsloading = false;
                                    })
                                  : searchBrand(_brand.text.toString())
                                      .whenComplete(() {
                                      print("=======================search");
                                      brandsloading = false;
                                    }),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (brandsloading) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: h * 0.25),
                                    child: loder,
                                  );
                                  // Expanded(child: Container(
                                  //   height: h*0.7,
                                  //   child:Padding(
                                  //     padding: Platform.isIOS? EdgeInsets.only(bottom:  100.0):EdgeInsets.only(bottom:  150.0),
                                  //     child: loder,
                                  //   )));
                                } else {
                                  if (snapshot.hasError) {
                                    return const Center(
                                      child: Icon(Icons.error),
                                    );
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
                                        shrinkWrap: true,
                                        controller: _controller1,
                                        crossAxisCount: 3,
                                        crossAxisSpacing: h * 0.01,
                                        mainAxisSpacing: h * 0.01,
                                        padding:
                                            EdgeInsets.only(bottom: h * 0.02),
                                        children: List.generate(
                                            snapshot.data.length, (index) {
                                          return GestureDetector(
                                              onTap: () {
                                                CarsData.brand = snapshot
                                                    .data[index]["brands"];
                                                CarsData.brandimage = snapshot
                                                    .data[index]["image"];
                                                Ids.brandid =
                                                    snapshot.data[index]["_id"];
                                                print(CarsData.brand);
                                                print(CarsData.brandimage);
                                                bottumSheet();
                                                item = index;
                                                isSelected = true;
                                                selctedImage = snapshot
                                                    .data[index]["image"];
                                                print(selctedImage);
                                                setState(() {});
                                              },
                                              child: RRectCard(
                                                h: h * 0.18,
                                                w: h * 0.18,
                                                borderRadius: 30,
                                                padding:
                                                    EdgeInsets.all(h * 0.015),
                                                color: kwhitecolor,
                                                widget: Container(
                                                  height: h * 0.1,
                                                  width: h * 0.1,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              h * 0.015),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            snapshot.data[index]
                                                                    ["image"]
                                                                .toString(),
                                                          ),
                                                          fit: BoxFit.fill)),
                                                  // child: Image.network(
                                                  //   snapshot.data[index]["image"]
                                                  //       .toString(),
                                                  //   fit: BoxFit.fill,
                                                  // ),
                                                ),
                                              ));
                                        }),
                                      );
                                    }
                                    return Padding(
                                      padding: EdgeInsets.only(top: h * 0.25),
                                      child: loder,
                                    );
                                    ;
                                    // Expanded(child: Container(
                                    // height: h,
                                    // child:Padding(
                                    //   padding: Platform.isIOS? EdgeInsets.only(bottom:  100.0):EdgeInsets.only(bottom:  150.0),
                                    //   child: loder,
                                    // )));
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
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
                                      shrinkWrap: true,
                                      controller: _controller1,
                                      crossAxisCount: 3,
                                      crossAxisSpacing: h * 0.01,
                                      mainAxisSpacing: h * 0.01,
                                      padding:
                                          EdgeInsets.only(bottom: h * 0.02),
                                      children: List.generate(
                                          snapshot.data.length, (index) {
                                        return GestureDetector(
                                            onTap: () {
                                              CarsData.brand = snapshot
                                                  .data[index]["brands"];
                                              CarsData.brandimage =
                                                  snapshot.data[index]["image"];
                                              Ids.brandid =
                                                  snapshot.data[index]["_id"];
                                              prefs!.setString(
                                                  "brandId", Ids.brandid);
                                              print(CarsData.brand);
                                              print(CarsData.brandimage);
                                              bottumSheet();
                                              item = index;
                                              isSelected = true;
                                              selctedImage =
                                                  snapshot.data[index]["image"];
                                              print(selctedImage);
                                              setState(() {});
                                            },
                                            child: RRectCard(
                                              h: h * 0.18,
                                              w: h * 0.18,
                                              borderRadius: 30,
                                              padding:
                                                  EdgeInsets.all(h * 0.015),
                                              color: kwhitecolor,
                                              widget: Container(
                                                height: h * 0.1,
                                                width: h * 0.1,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            h * 0.015),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          snapshot.data[index]
                                                                  ["image"]
                                                              .toString(),
                                                        ),
                                                        fit: BoxFit.fill)),
                                                // child: Image.network(
                                                //   snapshot.data[index]["image"]
                                                //       .toString(),
                                                //   fit: BoxFit.fill,
                                                // ),
                                              ),
                                            ));
                                      }),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsets.only(top: h * 0.25),
                                      child: loder,
                                    );
                                    
                                    //  Expanded(child: Container(
                                    // height: h*0.7,
                                    // child:Padding(
                                    //   padding: Platform.isIOS? EdgeInsets.only(bottom:  100.0):EdgeInsets.only(bottom:  150.0),
                                    //   child: loder,
                                    // )));
                                  }
                                }
                              },
                            ),
                          )),
                ],
              ),
            ),
          ),
          // Visibility(
          //   visible: brandsloading,
          //   child: loder)
        ],
      ),
    );
  }

  bottumSheet() {
    // var abc = Provider.of<Shots>(context, listen: true);
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Select Cars",
                    textScaleFactor: 1.3,
                    style: GoogleFonts.montserrat(
                        height: 2, fontWeight: FontWeight.w600),
                  ),
                  // Text(
                  //   "245 shots",
                  //   textScaleFactor: 0.8,
                  //   style: GoogleFonts.montserrat(
                  //     fontWeight: FontWeight.w600,
                  //     height: 1.5,
                  //     color: kblackcolor.withOpacity(0.6),
                  //   ),
                  // ),
                  FutureBuilder(
                    future: getCarData().whenComplete(() {
                      loading = false;
                    }),
                    initialData: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    builder: (context, AsyncSnapshot snapshot) {
                      // print(snapshot.data.length);
                      if (loading) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: loder,
                        );
                      } else {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Icon(Icons.error),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return loder;
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data != null) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.05, vertical: 10),
                              child: GridView.count(
                                shrinkWrap: true,
                                controller: _controller2,
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children: List.generate(snapshot.data.length,
                                    (index) {
                                  // abc.SetTotalPrice(
                                  //   snapshot.data.length
                                  // );
                                  shots = snapshot.data.length;
                                  return GestureDetector(
                                    onTap: () {
                                      CarsData.name =
                                          snapshot.data[index]["cars"];
                                      CarsData.carimage =
                                          snapshot.data[index]["image"];
                                      Ids.carid = snapshot.data[index]["_id"];
                                      prefs!.setString("CarId", Ids.carid);
                                      print(CarsData.brand);
                                      print(CarsData.brandimage);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SelectFuel(),
                                          ));
                                      setState(() {});
                                    },
                                    child: RRectCard(
                                      h: h * 0.18,
                                      w: h * 0.18,
                                      borderRadius: 30,
                                      widget: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: CachedNetworkImage(
                                                imageUrl: snapshot.data[index]
                                                    ["image"],
                                                placeholder: (context, url) =>
                                                    // loder,
                                                    Container(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                              // Image.network(
                                              //     "${snapshot.data[index]["image"]}"),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                snapshot.data[index]["cars"],
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.5,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: h * 0.01,
                                            )
                                          ]),
                                    ),
                                  );
                                }),
                              ),
                            );
                          } else {
                            return loder;
                          }
                        }
                        return loder;
                      }
                    },
                  )
                ],
              ),
            ),
          );
        }).whenComplete(() {
      item = null;
      isSelected = false;
      setState(() {});
    });
  }
}

class Shots extends ChangeNotifier {
  int shots = 0;

  getTotalPrice() {
    return shots;
  }

  SetTotalPrice(int _value) {
    shots = _value;
    notifyListeners();
  }
}
