import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/Service%20Main/insidCategory.dart';
import 'package:cityofcars/Screens/Service%20Main/offers.dart';
import 'package:cityofcars/Screens/Service%20Main/productDetail.dart';
import 'package:cityofcars/Services/models/offersModel.dart';
import 'package:cityofcars/Services/models/plansModel.dart';
import 'package:cityofcars/Services/models/subcategory.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/functions.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Services/models/usercardetailsmodel.dart';
import '../bottomnavBar.dart';
import '../editProfile.dart';
import '../loginSignup.dart';
import '../messages.dart';
import '../sos.dart';

class Searchdata {
  static var cats;
  static List<PlanModel> plans = [];
  static List<SubcatModel> subcat = [];
}

bool recdata = false;
bool mostdata = false;

class ServiceMain extends StatefulWidget {
  static String message = "";
  const ServiceMain({Key? key}) : super(key: key);

  @override
  State<ServiceMain> createState() => _ServiceMainState();
}

class _ServiceMainState extends State<ServiceMain> {
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();
  var h;
  var w;
  List<PlanModel> pls1 = [];
  // List<PlanModel> pls2 = [];
  List cats1 = [];
  // List cats2 = [];
  bool show = false;
  List<PlanModel> mostpop = [];
  List<OffersModel> offerslist = [];
  List<PlanModel> recom = [];
  int currentPage = 0;
  List backimage = [
    "https://wallpaperaccess.com/full/33110.jpg",
    "https://wallpaperaccess.com/full/14444.jpg",
    "https://wallpaperaccess.com/full/33116.jpg",
    "https://wallpaperaccess.com/full/33118.jpg"
  ];
  bool showmost = false;
  bool showrec = false;

  bool saverec = false;
  bool savemost = false;
  List carServices = [
    {
      "services": "Periodic Services",
      "image": "2110.png",
      "type": "Brackes, AC + more"
    },
    {
      "services": "body shop",
      "image": "2113.png",
      "type": "Dent Paint, Detailling + more"
    },
    {
      "services": "Custom Services",
      "image": "2112.png",
      "type": "clutch, transmission + more"
    },
    {
      "services": "Tyres & Batteries",
      "image": "2111.png",
      "type": "Accessary + more"
    },
  ];
  List reccomendedPackes = [
    {"services": "Clutch", "image": "2114.png", "type": "Custom services"},
    {"services": "Suspension", "image": "2117.png", "type": "Custom services"},
    {"services": "Brakes", "image": "2118.png", "type": "Custom services"},
    {"services": "Clutch", "image": "2114.png", "type": "Custom services"},
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
  List images = [];
  bool loding1 = true;
  bool processing = true;
  bool catlod = false;
  TextEditingController search = TextEditingController();
  bool focussearch = false;
  start() async {}
  @override
  void initState() {
    // TODO: implement initState
    move();
    super.initState();
    // getusercarsdata(true);
    Ids.brandid = prefs!.getString("brandId").toString();
    Ids.carid = prefs!.getString("CarId").toString();
    Ids.cityid = prefs!.getString("cityId").toString();
    Ids.fuelid = prefs!.getString("fuelId").toString();
    print(Ids.fuelid);
    print(Ids.cityid);
    print(Ids.carid);
    print(Ids.brandid);
    getcategaries().then((value) {
      if (value != null) {
        cats1 = value;
        setState(() {
          catlod = true;
        });
      }
    });
    getrecmostPlans().then((value) {
      if (value != null) {
        pls1.addAll(value);
        setState(() {
          savemost = mostdata;
          saverec = recdata;
          print("+++++" + savemost.toString());
          print("++++" + saverec.toString());
        });
      }
    });

    getoffers().then((value) {
      if (value != null) {
        offerslist.addAll(value);
        setState(() {});
      }
    }).whenComplete(() {
      processing = false;
      setState(() {});
    });
    getcategoryBanner().then((value) {
      images.addAll(value);
      setState(() {});
    }).whenComplete(() {
      userexistensecheck();
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg3,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.18),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kTransparent,
          elevation: 0,
          foregroundColor: kwhitecolor,
          centerTitle: false,
          title: Container(
            // padding:
            //     EdgeInsets.symmetric(vertical: h * 0.005, horizontal: w * 0.03),
            // decoration: BoxDecoration(
            //     color: korangecolor,
            //     borderRadius: BorderRadius.circular(h * 0.02),
            //     border: Border.all(color: kbluecolor, width: 3)),
            child: Text(
              prefs!.getString("cityname") ?? "",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: korangecolor,
                      shadows: [
                    Shadow(
                      color: kwhitecolor,
                      blurRadius: 8,
                    )
                  ])),
            ),
          ),
          flexibleSpace: SizedBox(
            height: h * 0.25,
            child: Stack(
              children: [
                PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: images.length,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(images[index]),
                                  fit: BoxFit.contain)),
                        )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.map((url) {
                      int index = images.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? kdarkpurple
                              : ksubHading.withOpacity(0.32),
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
      body: processing
          ? loder
          : SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                  //  Padding(
                  //     padding: EdgeInsets.only(
                  //         left: w * 0.06, right: w * 0.06, top: 20),
                  //     child: Material(
                  //       color: kwhitecolor,
                  //       elevation: 8,
                  //       shadowColor: kTextInputPlaceholderColor.withOpacity(0.3),
                  //       borderRadius:  BorderRadius.circular(h*0.05),
                  //       child: TextField(
                  //         decoration: InputDecoration(
                  //             hintText: "Search",
                  //             hintStyle:
                  //                 GoogleFonts.montserrat(
                  //                 fontWeight: FontWeight.w600,
                  //                 color: kGreenColor),
                  //             suffixIcon: Icon(
                  //               Icons.search,
                  //             ),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderSide:
                  //                     BorderSide(color: korangecolor, width: 1.0),
                  //                 borderRadius: BorderRadius.circular(h*0.05)),
                  //             border: OutlineInputBorder(
                  //                 borderSide: BorderSide(
                  //                     color: kTextInputPlaceholderColor,
                  //                     width: 1.0),
                  //                 borderRadius: BorderRadius.circular(h*0.05))),
                  //       ),
                  //     ),
                  //   ),
                  Container(
                    height: h * 0.07,
                    padding: EdgeInsets.only(
                        left: w * 0.06, right: w * 0.06, top: h * 0.02),
                    child: Material(
                      color: kwhitecolor,
                      elevation: 8,
                      shadowColor: kTextInputPlaceholderColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(h * 0.05),
                      child: TextField(
                        controller: search,
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                        // focusNode: FocusNode(canRequestFocus: true),
                        onSubmitted: (value) {
                          if (search.text.isEmpty) {
                            getcategaries().then((value) {
                              if (value != null) {
                                cats1 = value;
                                setState(() {
                                  catlod = true;
                                });
                              }
                            });
                            getrecmostPlans().then((value) {
                              if (value != null) {
                                pls1 = value;
                                // pls1.addAll(value);
                                setState(() {
                                  savemost = mostdata;
                                  saverec = recdata;
                                  print("+++++" + savemost.toString());
                                  print("++++" + saverec.toString());
                                });
                              }
                            });
                            return;
                          }
                          if (value.isEmpty) {
                            getcategaries().then((value) {
                              if (value != null) {
                                cats1 = value;
                                setState(() {
                                  catlod = true;
                                });
                              }
                            });
                            getrecmostPlans().then((value) {
                              if (value != null) {
                                pls1 = value;
                                // pls1.addAll(value);
                                setState(() {
                                  savemost = mostdata;
                                  saverec = recdata;
                                  print("+++++" + savemost.toString());
                                  print("++++" + saverec.toString());
                                });
                              }
                            });
                            recdata = saverec;
                            mostdata = savemost;
                            return;
                          }
                          if (value.isNotEmpty) {
                            show = false;
                            searchGloble(search.text).then((value) {
                              print("done");
                              if (value) {
                                show = true;
                                print("condition");
                                pls1.clear();
                                cats1.clear();
                                pls1.addAll(Searchdata.plans);
                                cats1.addAll(Searchdata.cats);

                                // pls=value.plans;

                                setState(() {
                                  // if (pls1.isEmpty) {
                                  //   setState(() {});
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(const SnackBar(
                                  //     content: Text("No Plans found"),
                                  //   ));
                                  // }
                                  // if (cats1.isEmpty) {
                                  //   setState(() {});
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(const SnackBar(
                                  //     content:
                                  //         Text("No Category found"),
                                  //   ));
                                  // }
                                  if (cats1.isEmpty && pls1.isEmpty) {
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(const SnackBar(
                                    //   content: Text("No Data found"),
                                    // ));
                                  }
                                });
                              }
                            });
                          }

                          setState(() {});
                          if (value == " ") {
                            search.clear();
                          }

                          print("changeqetyu");
                        },
                        onChanged: (value) {
                          if (search.text.isEmpty) {
                            getcategaries().then((value) {
                              if (value != null) {
                                cats1 = value;
                                setState(() {
                                  catlod = true;
                                });
                              }
                            });
                            getrecmostPlans().then((value) {
                              if (value != null) {
                                // pls1.addAll(value);
                                pls1 = value;
                                setState(() {
                                  savemost = mostdata;
                                  saverec = recdata;
                                  print("+++++" + savemost.toString());
                                  print("++++" + saverec.toString());
                                });
                              }
                            });
                            return;
                          }
                          if (value.isEmpty) {
                            getcategaries().then((value) {
                              if (value != null) {
                                cats1 = value;
                                setState(() {
                                  catlod = true;
                                });
                              }
                            });
                            getrecmostPlans().then((value) {
                              if (value != null) {
                                pls1 = value;
                                // pls1.addAll(value);
                                setState(() {
                                  savemost = mostdata;
                                  saverec = recdata;
                                  print("+++++" + savemost.toString());
                                  print("++++" + saverec.toString());
                                });
                              }
                            });
                            recdata = saverec;
                            mostdata = savemost;
                            return;
                          }
                          if (value.isNotEmpty) {
                            show = false;
                            searchGloble(search.text).then((value) {
                              print("done");
                              if (value) {
                                show = true;
                                print("condition");
                                pls1.clear();
                                cats1.clear();
                                pls1.addAll(Searchdata.plans);
                                cats1.addAll(Searchdata.cats);

                                // pls=value.plans;

                                setState(() {
                                  // if (pls1.isEmpty) {
                                  //   setState(() {});
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(const SnackBar(
                                  //     content: Text("No Plans found"),
                                  //   ));
                                  // }
                                  // if (cats1.isEmpty) {
                                  //   setState(() {});
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(const SnackBar(
                                  //     content:
                                  //         Text("No Category found"),
                                  //   ));
                                  // }
                                  if (cats1.isEmpty && pls1.isEmpty) {
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(const SnackBar(
                                    //   content: Text("No Data found"),
                                    // ));
                                  }
                                });
                              }
                            });
                          }

                          setState(() {});
                          if (value == " ") {
                            search.clear();
                          }

                          print("changeqetyu");
                        },

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
                              borderRadius: BorderRadius.circular(h * 0.02),
                              onTap: search.text.isEmpty
                                  ? () {
                                      show = false;
                                      print("dvjsbvei");
                                      setState(() {
                                        FocusScope.of(context).unfocus();
                                      });
                                    }
                                  : () {
                                      print("qwertyui");
                                      searchGloble(search.text).then((value) {
                                        print("done");
                                        if (value) {
                                          show = true;
                                          print("condition");
                                          pls1.clear();
                                          cats1.clear();
                                          pls1.addAll(Searchdata.plans);
                                          cats1.addAll(Searchdata.cats);

                                          // pls=value.plans;

                                          setState(() {
                                            FocusScope.of(context).unfocus();
                                            // if (pls1.isEmpty) {
                                            //   setState(() {});
                                            //   ScaffoldMessenger.of(context)
                                            //       .showSnackBar(const SnackBar(
                                            //     content: Text("No Plans found"),
                                            //   ));
                                            // }
                                            // if (cats1.isEmpty) {
                                            //   setState(() {});
                                            //   ScaffoldMessenger.of(context)
                                            //       .showSnackBar(const SnackBar(
                                            //     content:
                                            //         Text("No Category found"),
                                            //   ));
                                            // }
                                            if (cats1.isEmpty && pls1.isEmpty) {
                                              // ScaffoldMessenger.of(context)
                                              //     .showSnackBar(const SnackBar(
                                              //   content: Text("No Data found"),
                                              // ));
                                            }
                                          });
                                        }
                                      });
                                    },
                              child: const Icon(
                                Icons.search,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: korangecolor, width: 1.0),
                                borderRadius: BorderRadius.circular(h * 0.05)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: kTextInputPlaceholderColor,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(h * 0.05))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Visibility(
                    // visible: showmost,
                    visible: search.text.isNotEmpty && pls1.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Label(
                          color: kbluecolor,
                          text: "Plans",
                          textStyle: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kwhitecolor),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        SizedBox(
                          height: h * 0.18,
                          child: ListView.builder(
                            controller: _controller2,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.01, horizontal: h * 0.025),
                            itemCount: pls1.length,
                            itemBuilder: (context, index) {
                              PlanModel model = PlanModel();

                              model = pls1[index];
                              print("====" + model.isMost);
                              return GestureDetector(
                                onTap: () {
                                  print("Cat " +
                                      model.categoryId.toString() +
                                      "^^");
                                  Ids.categoryid = model.categoryId.toString();
                                  Ids.subcategoryid = model.subcatid.toString();
                                  Ids.planid = model.planid.toString();
                                  print("===" + Ids.categoryid);
                                  print("===" + Ids.subcategoryid);
                                  print("===" + Ids.planid);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                              planDetails: model)));
                                },
                                child: RRectCard(
                                  h: h * 0.1,
                                  w: w * 0.25,
                                  borderRadius: 15,
                                  widget: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          model.planimage,
                                          height: h * 0.04,
                                        ),
                                        // Image.asset(
                                        //     "assets/images/${reccomendedPackes[0]["image"]}"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        FittedBox(
                                          child: Text(
                                            model.packs.first.planName,
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
                                              model.packs.first.subPlanName,
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
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: cats1.isNotEmpty,
                    child: GridView.count(
                      // physics:  const ScrollPhysics(),
                      // physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      controller: _controller2,
                      padding: EdgeInsets.symmetric(
                          vertical: h * 0.015, horizontal: h * 0.025),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(cats1.length, (index) {
                        // print(cats1.length);
                        var data = cats1;

                        return GestureDetector(
                          onTap: () {
                            print(data[index]["_id"].toString());
                            Ids.categoryid = data[index]["_id"].toString();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InsideCategory(
                                          id: data[index]["_id"].toString(),
                                        )));
                          },
                          child: RRectCard(
                            h: h * 0.20,
                            w: h * 0.18,
                            borderRadius: 10,
                            widget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          // vertical: h * 0.02,
                                          top: h * 0.04,
                                          left: w * 0.06,
                                          right: w * 0.06),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              data[index]["image"].toString(),
                                          placeholder: (context, url) =>
                                              Container(),
                                          errorWidget: (context, url, error) =>
                                              Container()
                                          // Image.network(
                                          //     "https://i.gifer.com/DKke.gif"),
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.01),
                                    child: Text(
                                      data[index]["title"] == null ||
                                              data[index]["title"] == ""
                                          ? ""
                                          : "${data[index]["title"]}"
                                              .toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                          fontSize: 11),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.005,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.01),
                                    child: Text(
                                      data[index]["discreption"] == null ||
                                              data[index]["discreption"] == ""
                                          ? ""
                                          : "${data[index]["discreption"]}"
                                              .toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          height: 1,
                                          fontSize: 9),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.015,
                                  ),
                                ]),
                          ),
                        );
                      }),
                    ),
                  ),
                  // FutureBuilder(
                  //   future: getcategaries().whenComplete(() {
                  //     loding1 = false;
                  //   }),
                  //   builder: (context, AsyncSnapshot snapshot) {
                  //     if (loding1) {
                  //       return loder;
                  //     } else {
                  //       return snapshot.hasData
                  //           ? GridView.count(
                  //               // physics:  const ScrollPhysics(),
                  //               // physics: const NeverScrollableScrollPhysics(),
                  //               shrinkWrap: true,
                  //               controller: _controller2,
                  //               padding: EdgeInsets.symmetric(
                  //                   vertical: h * 0.015, horizontal: h * 0.025),
                  //               crossAxisCount: 2,
                  //               crossAxisSpacing: 10,
                  //               mainAxisSpacing: 10,
                  //               children:
                  //                   List.generate(snapshot.data.length, (index) {
                  //                 print(snapshot.data.length);
                  //                 return GestureDetector(
                  //                   onTap: () {
                  //                     print(snapshot.data[index]["_id"].toString());
                  //                     Ids.categoryid =
                  //                         snapshot.data[index]["_id"].toString();
                  //                     Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                             builder: (context) => InsideCategory(
                  //                                   id: snapshot.data[index]["_id"]
                  //                                       .toString(),
                  //                                 )));
                  //                   },
                  //                   child: RRectCard(
                  //                     h: h * 0.20,
                  //                     w: h * 0.18,
                  //                     borderRadius: 10,
                  //                     widget: Column(
                  //                         mainAxisAlignment: MainAxisAlignment.center,
                  //                         children: [
                  //                           Expanded(
                  //                             child: Padding(
                  //                               padding: EdgeInsets.only(
                  //                                   // vertical: h * 0.02,
                  //                                   top: h * 0.04,
                  //                                   left: w * 0.06,
                  //                                   right: w * 0.06),
                  //                               child: CachedNetworkImage(
                  //                                   fit: BoxFit.fill,
                  //                                   imageUrl: snapshot.data[index]
                  //                                           ["image"]
                  //                                       .toString(),
                  //                                   placeholder: (context, url) =>
                  //                                       Container(),
                  //                                   errorWidget:
                  //                                       (context, url, error) =>
                  //                                           Container()
                  //                                   // Image.network(
                  //                                   //     "https://i.gifer.com/DKke.gif"),
                  //                                   ),
                  //                             ),
                  //                           ),
                  //                           SizedBox(
                  //                             height: h * 0.005,
                  //                           ),
                  //                           FittedBox(
                  //                             child: Text(
                  //                               snapshot.data[index]["title"] ==
                  //                                           null ||
                  //                                       snapshot.data[index]
                  //                                               ["title"] ==
                  //                                           ""
                  //                                   ? ""
                  //                                   : "${snapshot.data[index]["title"]}"
                  //                                       .toUpperCase(),
                  //                               style: GoogleFonts.montserrat(
                  //                                   fontWeight: FontWeight.w500,
                  //                                   height: 3,
                  //                                   fontSize: 11),
                  //                             ),
                  //                           ),
                  //                           FittedBox(
                  //                             child: Text(
                  //                               snapshot.data[index]["discreption"] ==
                  //                                           null ||
                  //                                       snapshot.data[index]
                  //                                               ["discreption"] ==
                  //                                           ""
                  //                                   ? ""
                  //                                   : "${snapshot.data[index]["discreption"]}"
                  //                                       .toUpperCase(),
                  //                               textAlign: TextAlign.center,
                  //                               style: GoogleFonts.montserrat(
                  //                                   fontWeight: FontWeight.w400,
                  //                                   height: 1,
                  //                                   fontSize: 9),
                  //                             ),
                  //                           ),
                  //                           SizedBox(
                  //                             height: h * 0.015,
                  //                           ),
                  //                         ]),
                  //                   ),
                  //                 );
                  //               }),
                  //             )
                  //           : Container();
                  //     }
                  //   },
                  // ),

                  SizedBox(
                    height: h * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.06,
                      ),
                      Text(
                        "Not sure about the problem? ",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kTextInputPlaceholderColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Sos()));
                        },
                        child: Text(
                          "Click here",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: kbluecolor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Visibility(
                    // visible: showmost,
                    visible: mostdata && pls1.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Label(
                          color: kbluecolor,
                          text: "most populer packs",
                          textStyle: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kwhitecolor),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        SizedBox(
                          height: h * 0.18,
                          child: ListView.builder(
                            controller: _controller2,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.01, horizontal: h * 0.025),
                            itemCount: pls1.length,
                            itemBuilder: (context, index) {
                              PlanModel model = PlanModel();

                              model = pls1[index];
                              print("====" + model.isMost);
                              return Visibility(
                                visible: model.isMost.toString() == "true",
                                child: GestureDetector(
                                  onTap: () {
                                    print("Cat " +
                                        model.categoryId.toString() +
                                        "^^");
                                    Ids.categoryid =
                                        model.categoryId.toString();
                                    Ids.subcategoryid =
                                        model.subcatid.toString();
                                    Ids.planid = model.planid.toString();
                                    print("===" + Ids.categoryid);
                                    print("===" + Ids.subcategoryid);
                                    print("===" + Ids.planid);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(
                                                    planDetails: model)));
                                  },
                                  child: RRectCard(
                                    h: h * 0.1,
                                    w: w * 0.25,
                                    borderRadius: 15,
                                    widget: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            model.planimage,
                                            height: h * 0.04,
                                          ),
                                          // Image.asset(
                                          //     "assets/images/${reccomendedPackes[0]["image"]}"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          FittedBox(
                                            child: Text(
                                              model.packs.first.planName,
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
                                                model.packs.first.subPlanName,
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
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // FutureBuilder(
                        //   future: getrecmostPlans().whenComplete(() {
                        //     showmost = true;
                        //   }),
                        //   builder: (context, AsyncSnapshot snapshot) {
                        //     if (snapshot.connectionState ==
                        //         ConnectionState.done) {
                        //       // mostpop.addAll(snapshot.data);
                        //       if (snapshot.hasData) {
                        //         return ListView.builder(
                        //           controller: _controller2,
                        //           physics: const BouncingScrollPhysics(),
                        //           scrollDirection: Axis.horizontal,
                        //           padding: EdgeInsets.symmetric(
                        //               vertical: h * 0.01,
                        //               horizontal: h * 0.025),
                        //           itemCount: snapshot.data.length,
                        //           itemBuilder: (context, index) {
                        //             PlanModel model = PlanModel();
                        //             model = snapshot.data[index];
                        //             return Visibility(
                        //               visible: model.isMost == "true",
                        //               child: GestureDetector(
                        //                 onTap: () {
                        //                   print("Cat " +
                        //                       model.categoryId.toString() +
                        //                       "^^");
                        //                   Ids.categoryid =
                        //                       model.categoryId.toString();
                        //                   Ids.subcategoryid =
                        //                       model.subcatid.toString();
                        //                   Ids.planid =
                        //                       model.planid.toString();
                        //                   print("===" + Ids.categoryid);
                        //                   print("===" + Ids.subcategoryid);
                        //                   print("===" + Ids.planid);
                        //                   Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                           builder: (context) =>
                        //                               ProductDetails(
                        //                                   planDetails:
                        //                                       model)));
                        //                 },
                        //                 child: RRectCard(
                        //                   h: h * 0.1,
                        //                   w: w * 0.25,
                        //                   borderRadius: 15,
                        //                   widget: Column(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.center,
                        //                       children: [
                        //                         Image.network(
                        //                           model.planimage,
                        //                           height: h * 0.04,
                        //                         ),
                        //                         // Image.asset(
                        //                         //     "assets/images/${reccomendedPackes[0]["image"]}"),
                        //                         const SizedBox(
                        //                           height: 5,
                        //                         ),
                        //                         FittedBox(
                        //                           child: Text(
                        //                             model.packs.first
                        //                                 .planName,
                        //                             style: GoogleFonts
                        //                                 .montserrat(
                        //                               fontWeight:
                        //                                   FontWeight.w600,
                        //                               height: 2,
                        //                             ),
                        //                           ),
                        //                         ),
                        //                         Padding(
                        //                           padding:
                        //                               EdgeInsets.symmetric(
                        //                                   horizontal:
                        //                                       h * 0.01),
                        //                           child: FittedBox(
                        //                             child: Text(
                        //                               model.packs.first
                        //                                   .subPlanName,
                        //                               textScaleFactor: 0.6,
                        //                               style: GoogleFonts
                        //                                   .montserrat(
                        //                                 fontWeight:
                        //                                     FontWeight.w600,
                        //                                 color:
                        //                                     kTextInputPlaceholderColor
                        //                                         .withOpacity(
                        //                                             0.6),
                        //                                 height: 2,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         )
                        //                       ]),
                        //                 ),
                        //               ),
                        //             );
                        //           },
                        //         );
                        //       }
                        //       return const Center(
                        //           child: Text("No Data Found"));
                        //     }
                        //     if (snapshot.connectionState ==
                        //         ConnectionState.waiting) {
                        //       if (snapshot.hasData) {
                        //         return ListView.builder(
                        //           controller: _controller2,
                        //           physics: const BouncingScrollPhysics(),
                        //           scrollDirection: Axis.horizontal,
                        //           padding: EdgeInsets.symmetric(
                        //               vertical: h * 0.01,
                        //               horizontal: h * 0.025),
                        //           itemCount: snapshot.data.length,
                        //           itemBuilder: (context, index) {
                        //             PlanModel model = PlanModel();
                        //             model = snapshot.data[index];
                        //             return Visibility(
                        //               visible: model.isMost == "true",
                        //               child: GestureDetector(
                        //                 onTap: () {
                        //                   print("Cat " +
                        //                       model.categoryId.toString() +
                        //                       "^^");
                        //                   Ids.categoryid =
                        //                       model.categoryId.toString();
                        //                   Ids.subcategoryid =
                        //                       model.subcatid.toString();
                        //                   Ids.planid =
                        //                       model.planid.toString();
                        //                   Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                           builder: (context) =>
                        //                               ProductDetails(
                        //                                   planDetails:
                        //                                       model)));
                        //                 },
                        //                 child: RRectCard(
                        //                   h: h * 0.1,
                        //                   w: w * 0.25,
                        //                   borderRadius: 15,
                        //                   widget: Column(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.center,
                        //                       children: [
                        //                         Image.network(
                        //                           model.planimage,
                        //                           height: h * 0.04,
                        //                         ),
                        //                         // Image.asset(
                        //                         //     "assets/images/${reccomendedPackes[0]["image"]}"),
                        //                         const SizedBox(
                        //                           height: 5,
                        //                         ),
                        //                         FittedBox(
                        //                           child: Text(
                        //                             model.packs.first
                        //                                 .planName,
                        //                             style: GoogleFonts
                        //                                 .montserrat(
                        //                               fontWeight:
                        //                                   FontWeight.w600,
                        //                               height: 2,
                        //                             ),
                        //                           ),
                        //                         ),
                        //                         Padding(
                        //                           padding:
                        //                               EdgeInsets.symmetric(
                        //                                   horizontal:
                        //                                       h * 0.01),
                        //                           child: FittedBox(
                        //                             child: Text(
                        //                               model.packs.first
                        //                                   .subPlanName,
                        //                               textScaleFactor: 0.6,
                        //                               style: GoogleFonts
                        //                                   .montserrat(
                        //                                 fontWeight:
                        //                                     FontWeight.w600,
                        //                                 color:
                        //                                     kTextInputPlaceholderColor
                        //                                         .withOpacity(
                        //                                             0.6),
                        //                                 height: 2,
                        //                               ),
                        //                             ),
                        //                           ),
                        //                         )
                        //                       ]),
                        //                 ),
                        //               ),
                        //             );
                        //           },
                        //         );
                        //       }
                        //       return loder;
                        //     }
                        //     return loder;
                        //   },
                        // )),
                        SizedBox(
                          height: h * 0.01,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: recdata && pls1.isNotEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Label(
                          color: korangecolor,
                          text: "recommended",
                          textStyle: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kwhitecolor),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Container(
                            height: h * 0.18,
                            child: ListView.builder(
                              controller: _controller2,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.01, horizontal: h * 0.025),
                              itemCount: pls1.length,
                              itemBuilder: (context, index) {
                                PlanModel model = PlanModel();
                                model = pls1[index];
                                print("====" + model.isrec.toString());
                                return Visibility(
                                  visible: model.isrec == "true",
                                  child: GestureDetector(
                                    onTap: () {
                                      print("Cat " +
                                          model.categoryId.toString() +
                                          "^^");
                                      Ids.categoryid =
                                          model.categoryId.toString();
                                      Ids.subcategoryid =
                                          model.subcatid.toString();
                                      Ids.planid = model.planid.toString();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                      planDetails: model)));
                                    },
                                    child: RRectCard(
                                      h: h * 0.1,
                                      w: w * 0.25,
                                      borderRadius: 15,
                                      widget: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              model.planimage,
                                              height: h * 0.04,
                                            ),
                                            // Image.asset(
                                            //     "assets/images/${reccomendedPackes[0]["image"]}"),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            FittedBox(
                                              child: Text(
                                                model.packs.first.planName,
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
                                                  model.packs.first.subPlanName,
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
                                    ),
                                  ),
                                );
                              },
                            )),
                      ],
                    ),
                  ),

                  // FutureBuilder(
                  //   future: getrecmostPlans(),
                  //   builder: (context, AsyncSnapshot snapshot) {
                  //     if (snapshot.connectionState ==
                  //         ConnectionState.done) {
                  //       // mostpop.addAll(snapshot.data);
                  //       if (snapshot.hasData) {
                  //         return ListView.builder(
                  //           controller: _controller2,
                  //           physics: const BouncingScrollPhysics(),
                  //           scrollDirection: Axis.horizontal,
                  //           padding: EdgeInsets.symmetric(
                  //               vertical: h * 0.01, horizontal: h * 0.025),
                  //           itemCount: snapshot.data.length,
                  //           itemBuilder: (context, index) {
                  //             PlanModel model = PlanModel();
                  //             model = snapshot.data[index];
                  //             return Visibility(
                  //               visible: model.isrec == "true",
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   print("Cat " +
                  //                       model.categoryId.toString() +
                  //                       "^^");
                  //                   Ids.categoryid =
                  //                       model.categoryId.toString();
                  //                   Ids.subcategoryid =
                  //                       model.subcatid.toString();
                  //                   Ids.planid = model.planid.toString();
                  //                   Navigator.push(
                  //                       context,
                  //                       MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               ProductDetails(
                  //                                   planDetails: model)));
                  //                 },
                  //                 child: RRectCard(
                  //                   h: h * 0.1,
                  //                   w: w * 0.25,
                  //                   borderRadius: 15,
                  //                   widget: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       children: [
                  //                         Image.network(
                  //                           model.planimage,
                  //                           height: h * 0.04,
                  //                         ),
                  //                         // Image.asset(
                  //                         //     "assets/images/${reccomendedPackes[0]["image"]}"),
                  //                         const SizedBox(
                  //                           height: 5,
                  //                         ),
                  //                         FittedBox(
                  //                           child: Text(
                  //                             model.packs.first.planName,
                  //                             style: GoogleFonts.montserrat(
                  //                               fontWeight: FontWeight.w600,
                  //                               height: 2,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         Padding(
                  //                           padding: EdgeInsets.symmetric(
                  //                               horizontal: h * 0.01),
                  //                           child: FittedBox(
                  //                             child: Text(
                  //                               model.packs.first
                  //                                   .subPlanName,
                  //                               textScaleFactor: 0.6,
                  //                               style:
                  //                                   GoogleFonts.montserrat(
                  //                                 fontWeight:
                  //                                     FontWeight.w600,
                  //                                 color:
                  //                                     kTextInputPlaceholderColor
                  //                                         .withOpacity(0.6),
                  //                                 height: 2,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         )
                  //                       ]),
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       }
                  //       return const Center(child: Text("No Data Found"));
                  //     }
                  //     if (snapshot.connectionState ==
                  //         ConnectionState.waiting) {
                  //       if (snapshot.hasData) {
                  //         return ListView.builder(
                  //           controller: _controller2,
                  //           physics: const BouncingScrollPhysics(),
                  //           scrollDirection: Axis.horizontal,
                  //           padding: EdgeInsets.symmetric(
                  //               vertical: h * 0.01, horizontal: h * 0.025),
                  //           itemCount: snapshot.data.length,
                  //           itemBuilder: (context, index) {
                  //             PlanModel model = PlanModel();
                  //             model = snapshot.data[index];
                  //             return Visibility(
                  //               visible: model.isrec == "true",
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   print("Cat " +
                  //                       model.categoryId.toString() +
                  //                       "^^");
                  //                   Ids.categoryid =
                  //                       model.categoryId.toString();
                  //                   Ids.subcategoryid =
                  //                       model.subcatid.toString();
                  //                   Ids.planid = model.planid.toString();
                  //                   Navigator.push(
                  //                       context,
                  //                       MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               ProductDetails(
                  //                                   planDetails: model)));
                  //                 },
                  //                 child: RRectCard(
                  //                   h: h * 0.1,
                  //                   w: w * 0.25,
                  //                   borderRadius: 15,
                  //                   widget: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       children: [
                  //                         Image.network(
                  //                           model.planimage,
                  //                           height: h * 0.04,
                  //                         ),
                  //                         // Image.asset(
                  //                         //     "assets/images/${reccomendedPackes[0]["image"]}"),
                  //                         const SizedBox(
                  //                           height: 5,
                  //                         ),
                  //                         FittedBox(
                  //                           child: Text(
                  //                             model.packs.first.planName,
                  //                             style: GoogleFonts.montserrat(
                  //                               fontWeight: FontWeight.w600,
                  //                               height: 2,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         Padding(
                  //                           padding: EdgeInsets.symmetric(
                  //                               horizontal: h * 0.01),
                  //                           child: FittedBox(
                  //                             child: Text(
                  //                               model.packs.first
                  //                                   .subPlanName,
                  //                               textScaleFactor: 0.6,
                  //                               style:
                  //                                   GoogleFonts.montserrat(
                  //                                 fontWeight:
                  //                                     FontWeight.w600,
                  //                                 color:
                  //                                     kTextInputPlaceholderColor
                  //                                         .withOpacity(0.6),
                  //                                 height: 2,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         )
                  //                       ]),
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       }
                  //       return loder;
                  //     }
                  //     return loder;
                  //   },
                  // )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      makePhoneCall("9999955555");
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/Call US.svg",
                          height: h * 0.03,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Call us ",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: kbluecolor,
                                height: 2,
                              ),
                              children: [
                                TextSpan(
                                  text: "at",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: kTextInputPlaceholderColor,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: " 99999",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: kbluecolor,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: "55555",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: kGreenColor,
                                    height: 2,
                                  ),
                                ),
                                TextSpan(
                                  text: "?",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: kTextInputPlaceholderColor,
                                    height: 2,
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                  Label(
                    color: kbluecolor,
                    text: "offers & discounts",
                    textStyle: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: kwhitecolor),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                  Container(
                    height: h * 0.2,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                          horizontal: h * 0.023, vertical: h * 0.01),
                      itemCount: offerslist.length,
                      itemBuilder: (context, index) {
                        return Visibility(
                          visible: offerslist[index].status!,
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const Offers()));
                              show_offer_des(
                                  offerslist[index].des.toString(),
                                  offerslist[index].discount.toString(),
                                  offerslist[index].heading.toString());
                            },
                            child: RRectCard(
                              h: h * 0.1,
                              w: w * 0.28,
                              borderRadius: 15,
                              widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      offerslist[index].image.toString(),
                                      height: h * 0.03,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        offerslist[index].discount.toString(),
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
                                          offerslist[index].heading.toString(),
                                          textScaleFactor: 0.6,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            color: kTextInputPlaceholderColor
                                                .withOpacity(0.6),
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                ],
              ),
            ),
    );
  }

  show_offer_des(String des, String offer, String heading) {
    showModalBottomSheet(
        useRootNavigator: true,
        // backgroundColor: kTransparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(h * 0.03),
                topRight: Radius.circular(h * 0.03))),
        context: context,
        builder: (context) {
          return Container(
              // height: h * 0.4,
              color: kwhitecolor,
              // constraints: BoxConstraints(
              //   minHeight: h*0.3
              // ),
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.05, vertical: h * 0.01),
              margin: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Text(
                      offer,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, height: 1, fontSize: 12),
                    ),
                    Text(
                      heading,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, height: 2, fontSize: 12),
                    ),
                    const Divider(
                      color: Colors.blueGrey,
                    ),
                    Text(
                      des,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, height: 1, fontSize: 12),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    )
                  ],
                ),
              ));
        }).whenComplete(() {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      FocusManager.instance.primaryFocus!.unfocus();
      setState(() {});
    });
  }

  move() {
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      print("move start");
      if (message != null) {
        if (message.data.isNotEmpty) {
          print("message is not empty");

          var type = message.data["type"];
          switch (type.toString().toLowerCase()) {
            case "editprofile":
              print("editprofile");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const EditProfile())));
              break;
            case "approvel":
              print("approvel");
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => BottomNavBar(
                    index: 2,
                  ),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );
              break;
            case "conversation":
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Messages())));

              break;
            case "presets":
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => (BottomNavBar(
                            index: 2,
                          )))));
              break;
            case "orderassign":
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => (BottomNavBar(
                            index: 1,
                          )))));

              break;
            case "support":
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Messages())));

              break;
            case "order":
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => BottomNavBar(
                    index: 2,
                  ),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );
              break;
            case "otp":
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Messages())));

              break;

            case "blogs":
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => BottomNavBar(
                    index: 1,
                  ),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );

              break;
            case "":
              break;
          }
        }
      }
    });
  }

  userexistensecheck() {
    if (ServiceMain.message == "Invalid Token") {
      Prefernece.pref!.clear();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Your account has been deleted.")));
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => LoginSignUp(isSignIn: false)),
        (route) => false, //if you want to disable back feature set to false
      );
    }
  }
}
