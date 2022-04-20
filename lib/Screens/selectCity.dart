import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List cityList = [
    {"name": "Delhi", "images": "4.png"},
    {"name": "Gurgoan", "images": "2.png"},
    {"name": "Noida", "images": "3.png"},
    {"name": "Chandigarh", "images": "5.png"}
  ];
  List cities = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  cities = getcities();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 22, top: 20),
          child: Text(
            "Select Your City",
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: kTextInputPlaceholderColor,
            )),
          ),
        ),
        backgroundColor: Colors.transparent,
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
                height: size.height * 0.07,
                padding: EdgeInsets.only(
                    left: size.width * 0.06,
                    right: size.width * 0.06,
                    top: size.height * 0.02),
                child: Material(
                  color: kwhitecolor,
                  // elevation: 8,
                  shadowColor: kTextInputPlaceholderColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(size.height * 0.025),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: size.height * 0.01, left: size.width * 0.05),
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
                            borderSide: const BorderSide(
                                color: korangecolor, width: 1.0),
                            borderRadius:
                                BorderRadius.circular(size.height * 0.02)),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: kTextInputPlaceholderColor, width: 1.0),
                            borderRadius:
                                BorderRadius.circular(size.height * 0.02))),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.07, vertical: 50),
                color: kLightOrangeBgColor,
                child: FutureBuilder(
                    future: getcities(),
                    builder: (context, AsyncSnapshot snapshot) {
                      print(snapshot.data.length);
                      if (snapshot.hasData) {
                        return GridView.count(
                          controller: _controller,
                          shrinkWrap: true,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          children:
                              List.generate(snapshot.data.length, (index) {
                            return Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SelectBrand(),
                                      ));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  elevation: 8,
                                  shadowColor: Colors.grey.withOpacity(0.2),
                                  child: Container(
                                    height: size.height * 0.17,
                                    width: size.height * 0.17,
                                    padding:
                                        EdgeInsets.all(size.height * 0.008),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  "${snapshot.data[index]["images"]}",
                                              placeholder: (context, url) =>
                                                  const Center(child: CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                            // Image.network(
                                            //     "${snapshot.data[index]["images"]}"),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            snapshot.data[index]["city"],
                                            style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
