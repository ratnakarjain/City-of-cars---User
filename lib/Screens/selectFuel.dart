import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/glance.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/servies.dart';
import 'Service Main/serviceMain.dart';
import 'bottomnavBar.dart';
import 'profile.dart';

class SelectFuel extends StatefulWidget {
  const SelectFuel({Key? key}) : super(key: key);

  @override
  State<SelectFuel> createState() => _SelectFuelState();
}

class _SelectFuelState extends State<SelectFuel> {
  ScrollController _controller = ScrollController();
  var h;
  var w;
  bool loading = true;

  List fueltype = [
    {"image": "Diesel.png", "type": "Diesel"},
    {"image": "Petrol.png", "type": "Petrol"},
    {"image": "EV.png", "type": "EV"}
  ];
  bool fuelselcting = false;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        centerTitle: false,
        foregroundColor: kTextInputPlaceholderColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Fuel",
              textScaleFactor: 1.1,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(h * 0.05),
          child: Container(),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: h * 0.02,
          ),
          RRectCard(
            h: h * 0.12,
            w: h * 0.12,
            borderRadius: 30,
            color: kbluecolor,
            widget: RRectCard(
              h: h * 0.12,
              w: h * 0.12,
              borderRadius: 25,
              padding: EdgeInsets.all(h * 0.012),
              color: kwhitecolor,
              widget: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: CarsData.brandimage.toString(),
                placeholder: (context, url) => loder,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Expanded(
            child: Container(
              width: w,
              decoration: BoxDecoration(
                  color: kwhitecolor.withOpacity(0.85),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(h * 0.05),
                    topRight: Radius.circular(h * 0.05),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, -5),
                        blurRadius: 5,
                        spreadRadius: 3,
                        color: kblackcolor.withOpacity(0.1))
                  ]),
              child: Column(
                children: [
                  Text(
                    // "Selected Cars",
                    "Selected Fuel",
                    textScaleFactor: 1.1,
                    style: GoogleFonts.montserrat(
                        height: 2, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  RRectCard(
                    borderRadius: 30,
                    h: h * 0.12,
                    w: h * 0.12,
                    color: korangecolor,
                    widget: RRectCard(
                      borderRadius: 25,
                      h: h * 0.12,
                      w: h * 0.12,
                      padding: EdgeInsets.all(h * 0.01),
                      widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h * 0.005,
                            ),
                            Expanded(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: CarsData.fuelimage.toString(),
                                placeholder: (context, url) => loder,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                              child: Text(
                                CarsData.fuel,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Flexible(
                    child: Container(
                      width: w,
                      // height: h * 0.4,
                      decoration: BoxDecoration(
                          color: kwhitecolor.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(h * 0.05),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 5,
                                color: kblackcolor.withOpacity(0.1))
                          ]),
                      margin: EdgeInsets.only(bottom: h * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Car",
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
                          Expanded(
                            child: FutureBuilder(
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
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.data != null) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.05, vertical: 10),
                                        child: GridView.count(
                                          shrinkWrap: true,
                                          controller: _controller,
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          children: List.generate(
                                              snapshot.data.length, (index) {
                                            // abc.SetTotalPrice(
                                            //   snapshot.data.length
                                            // );
                                            // shots = snapshot.data.length;
                                            return GestureDetector(
                                              onTap: () async {
                                                // if (chack(snapshot.data[index]["_id"])) {\
                                                setState(() {
                                                  fuelselcting = true;
                                                });
                                                CarsData.name = snapshot
                                                    .data[index]["cars"];
                                                CarsData.carimage = snapshot
                                                    .data[index]["image"];
                                                Ids.carid =
                                                    snapshot.data[index]["_id"];
                                                prefs!.setString(
                                                    "CarId", Ids.carid);
                                                print(CarsData.brand);
                                                print(CarsData.brandimage);
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           const SelectFuel(),
                                                //     ));
                                                await addusercitycardata()
                                                    .then((value) {
                                                  if (value != "Error") {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Glance(),
                                                        )).whenComplete(() {
                                                      fuelselcting = false;
                                                      setState(() {});
                                                    });
                                                  }
                                                });
                                                setState(() {
                                                  fuelselcting = false;
                                                });

                                                setState(() {});
                                                // }
                                              },
                                              child: RRectCard(
                                                // color: kbg2,
                                                h: h * 0.18,
                                                w: h * 0.18,
                                                borderRadius: 30,
                                                widget: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: h * 0.005,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: snapshot
                                                                    .data[index]
                                                                ["image"],
                                                            placeholder:
                                                                (context,
                                                                        url) =>
                                                                    // loder,
                                                                    Container(),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Icon(Icons
                                                                    .error),
                                                          ),
                                                        ),
                                                        // Image.network(
                                                        //     "${snapshot.data[index]["image"]}"),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          snapshot.data[index]
                                                              ["cars"],
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
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
                            ),
                          )
                          // Text(
                          //   "Select Fuel",
                          //   textScaleFactor: 1.1,
                          //   style: GoogleFonts.montserrat(
                          //       height: 2, fontWeight: FontWeight.w600),
                          // ),
                          // Expanded(
                          //   child: FutureBuilder(
                          //     future: getfuel().whenComplete(() {
                          //       loading = false;
                          //     }),
                          //     initialData: loder,
                          //     builder:
                          //         (BuildContext context, AsyncSnapshot snapshot) {
                          //       if (loading) {
                          //         return loder;
                          //       } else {
                          //         print(snapshot.data.length);
                          //         return GridView.count(
                          //           shrinkWrap: true,
                          //           controller: _controller,
                          //           scrollDirection: Axis.vertical,
                          //           crossAxisCount: 3,
                          //           children: List.generate(snapshot.data.length,
                          //               (index) {
                          //             return Center(
                          //               child: GestureDetector(
                          //                 onTap: fuelselcting
                          //                     ? () {
                          //                         print("tap");
                          //                       }
                          //                     : () {
                          //                         fuelselcting = true;
                          //                         setState(() {});
                          //                         CarsData.fuel =
                          //                             snapshot.data[index]["fuel"];
                          //                         CarsData.fuelimage =
                          //                             snapshot.data[index]["image"];
                          //                         Ids.fuelid =
                          //                             snapshot.data[index]["_id"];
                          //                         prefs!.setString(
                          //                             "fuelId", Ids.fuelid);
                          //                         addusercitycardata()
                          //                             .then((value) {
                          //                           value != "Error"
                          //                               ? Navigator.push(
                          //                                   context,
                          //                                   MaterialPageRoute(
                          //                                     builder: (context) =>
                          //                                         const Glance(),
                          //                                   )).whenComplete(() {
                          //                                   fuelselcting = false;
                          //                                   setState(() {});
                          //                                 })
                          //                               : ScaffoldMessenger.of(
                          //                                       context)
                          //                                   .showSnackBar(
                          //                                       const SnackBar(
                          //                                   content: Text("Error"),
                          //                                 ));
                          //                         }).whenComplete(() {
                          //                           fuelselcting = false;
                          //                           setState(() {});
                          //                         });
                          //                       },
                          //                 child: RRectCard(
                          //                   h: h * 0.12,
                          //                   w: h * 0.12,
                          //                   borderRadius: 30,
                          //                   padding: EdgeInsets.all(h * 0.01),
                          //                   widget: Column(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment.center,
                          //                       children: [
                          //                         Expanded(
                          //                           child: CachedNetworkImage(
                          //                             fit: BoxFit.fill,
                          //                             imageUrl: snapshot.data[index]
                          //                                     ["image"] ??
                          //                                 "",
                          //                             placeholder: (context, url) =>
                          //                                 Container(),
                          //                             errorWidget: (context, url,
                          //                                     error) =>
                          //                                 const Icon(Icons.error),
                          //                           ),
                          //                         ),
                          //                         // Image.asset(
                          //                         //     "assets/images/${fueltype[index]["image"]}"),
                          //                         const SizedBox(
                          //                           height: 5,
                          //                         ),
                          //                         FittedBox(
                          //                           child: Text(
                          //                             "${snapshot.data[index]["fuel"]}",
                          //                             style: GoogleFonts.montserrat(
                          //                               fontWeight: FontWeight.w600,
                          //                               height: 1.5,
                          //                             ),
                          //                           ),
                          //                         )
                          //                       ]),
                          //                 ),
                          //               ),
                          //             );
                          //           }),
                          //         );
                          //         ;
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
