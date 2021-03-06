import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/glance.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/servies.dart';
import 'Service Main/serviceMain.dart';
import 'bottomnavBar.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: h * 0.0,
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
              padding: EdgeInsets.all(h * 0.01),
              color: kwhitecolor,
              widget: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: CarsData.brandimage.toString(),
                placeholder: (context, url) => loder,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            width: w,
            decoration: BoxDecoration(
                color: kwhitecolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(h * 0.05),
                  topRight: Radius.circular(h * 0.05),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -5),
                      blurRadius: 5,
                      spreadRadius: 3,
                      color: kblackcolor.withOpacity(0.1))
                ]),
            child: Column(
              children: [
                Text(
                  "Selected Cars",
                  textScaleFactor: 1.1,
                  style: GoogleFonts.montserrat(
                      height: 2, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: h * 0.05,
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
                          Expanded(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: CarsData.carimage.toString(),
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
                              CarsData.name,
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
                  height: h * 0.05,
                ),
                Container(
                  width: w,
                  height: h * 0.28,
                  decoration: BoxDecoration(
                      color: kwhitecolor,
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
                        "Select Fuel",
                        textScaleFactor: 1.1,
                        style: GoogleFonts.montserrat(
                            height: 2, fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: getfuel().whenComplete(() {
                            loading = false;
                          }),
                          initialData: loder,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (loading) {
                              return loder;
                            } else {
                              print(snapshot.data.length);
                              return GridView.count(
                                shrinkWrap: true,
                                controller: _controller,
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 3,
                                children: List.generate(snapshot.data.length,
                                    (index) {
                                  return Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        CarsData.fuel =
                                            snapshot.data[index]["fuel"];
                                        CarsData.fuelimage =
                                            snapshot.data[index]["image"];
                                        Ids.fuelid =
                                            snapshot.data[index]["_id"];
                                        prefs!.setString("fuelId", Ids.fuelid);
                                        addusercitycardata().then((value) {
                                          value != "Error"
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Glance(),
                                                  ))
                                              : ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                  content: Text("Error"),
                                                ));
                                        });
                                      },
                                      child: RRectCard(
                                        h: h * 0.12,
                                        w: h * 0.12,
                                        borderRadius: 30,
                                        padding: EdgeInsets.all(h * 0.01),
                                        widget: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.fill,
                                                  imageUrl: snapshot.data[index]
                                                          ["image"] ??
                                                      "",
                                                  placeholder: (context, url) =>
                                                      Container(),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                              // Image.asset(
                                              //     "assets/images/${fueltype[index]["image"]}"),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  "${snapshot.data[index]["fuel"]}",
                                                  style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  );
                                }),
                              );
                              ;
                            }
                          },
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
