import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/Service%20Main/insidCategory.dart';
import 'package:cityofcars/Screens/Service%20Main/offers.dart';
import 'package:cityofcars/Screens/Service%20Main/productDetail.dart';
import 'package:cityofcars/Services/models/plansModel.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceMain extends StatefulWidget {
  const ServiceMain({Key? key}) : super(key: key);

  @override
  State<ServiceMain> createState() => _ServiceMainState();
}

class _ServiceMainState extends State<ServiceMain> {
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();
  var h;
  var w;
  List<PlanModel> mostpop = [];
  
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Ids.brandid= prefs!.getString("brandId").toString();
    Ids.carid= prefs!.getString("CarId").toString();
    Ids.cityid= prefs!.getString("cityId").toString();
    Ids.fuelid= prefs!.getString("fuelId").toString();
    print(Ids.fuelid);
    print(Ids.cityid);
    print(Ids.carid);
    print(Ids.brandid);
    getcategoryBanner().then((value) {
      images.addAll(value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.18),
        child: AppBar(
          backgroundColor: kTransparent,
          elevation: 0,
          foregroundColor: kwhitecolor,
          centerTitle: false,
          title: Text(
            "Delhi",
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
                    itemCount:
                        images.isEmpty ? backimage.length : images.length,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    images.isNotEmpty
                                        ? images[index]
                                        : backimage[index],
                                  ),
                                  fit: BoxFit.cover)),
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
      body: SingleChildScrollView(
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
                          borderRadius: BorderRadius.circular(h * 0.05)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: kTextInputPlaceholderColor, width: 1.0),
                          borderRadius: BorderRadius.circular(h * 0.05))),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.015,
            ),
            FutureBuilder(
              future: getcategaries().whenComplete(() {
                loding1 = false;
              }),
              builder: (context, AsyncSnapshot snapshot) {
                if (loding1) {
                  return loder;
                } else {
                  return snapshot.hasData
                      ? GridView.count(
                          // physics:  const ScrollPhysics(),
                          // physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          controller: _controller2,
                          padding: EdgeInsets.symmetric(
                              vertical: h * 0.015, horizontal: h * 0.025),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children:
                              List.generate(snapshot.data.length, (index) {
                            print(snapshot.data.length);
                            return GestureDetector(
                              onTap: () {
                                print(snapshot.data[index]["_id"].toString());
                                Ids.categoryid =
                                    snapshot.data[index]["_id"].toString();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InsideCategory(
                                              id: snapshot.data[index]["_id"]
                                                  .toString(),
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
                                              left: w * 0.06,right: w * 0.06),
                                          child: CachedNetworkImage(
                                              fit: BoxFit.fill,
                                              imageUrl: snapshot.data[index]
                                                      ["image"]
                                                  .toString(),
                                              placeholder: (context, url) =>
                                                  loder,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container()
                                              // Image.network(
                                              //     "https://i.gifer.com/DKke.gif"),
                                              ),
                                        ),
                                      ),
                                       SizedBox(
                                        height: h*0.005,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          snapshot.data[index]["title"] ==
                                                      null ||
                                                  snapshot.data[index]
                                                          ["title"] ==
                                                      ""
                                              ? ""
                                              : "${snapshot.data[index]["title"]}"
                                                  .toUpperCase(),
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              height: 3,
                                              fontSize: 11),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          snapshot.data[index]["discreption"] ==
                                                      null ||
                                                  snapshot.data[index]
                                                          ["discreption"] ==
                                                      ""
                                              ? ""
                                              : "${snapshot.data[index]["discreption"]}"
                                                  .toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w400,
                                              height: 1,
                                              fontSize: 9),
                                        ),
                                      ),
                                       SizedBox(
                                        height: h*0.015,
                                      ),
                                    ]),
                              ),
                            );
                          }),
                        )
                      : Container();
                }
              },
            ),

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
                Text(
                  "Click here",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: kbluecolor,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Visibility(
              // visible: showmost,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    color: kbluecolor,
                    text: "most populer packs",
                    textStyle: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: kwhitecolor),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                      height: h * 0.18,
                      child: FutureBuilder(
                        future: getrecmostPlans().whenComplete(() {
                          showmost=true;
                        }),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            // mostpop.addAll(snapshot.data);
                            if (snapshot.hasData) {
                              return ListView.builder(
                                controller: _controller2,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.01, horizontal: h * 0.025),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  PlanModel model = PlanModel();
                                  model= snapshot.data[index];
                                  return Visibility(
                                    visible: model.isMost=="true",
                                    child: GestureDetector(
                                      onTap: () {
                                        print("Cat "+model.categoryId.toString()+"^^");
                                        Ids.categoryid = model.categoryId.toString();
                                        Ids.subcategoryid = model.subcatid.toString();
                                        Ids.planid = model.planid.toString();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ProductDetails(
                                                      planDetails:
                                                          model
                                                    )));
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
                                                height: h*0.04,
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
                              );
                            }
                            return const Center(child: Text("No Data Found"));
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                controller: _controller2,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.01, horizontal: h * 0.025),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  PlanModel model = PlanModel();
                                  model= snapshot.data[index];
                                  return Visibility(
                                    visible: model.isMost=="true",
                                    child: GestureDetector(
                                      onTap: () {
                                        print("Cat "+model.categoryId.toString()+"^^");
                                        Ids.categoryid = model.categoryId.toString();
                                        Ids.subcategoryid = model.subcatid.toString();
                                        Ids.planid = model.planid.toString();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ProductDetails(
                                                      planDetails:
                                                          model
                                                    )));
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
                                                height: h*0.04,
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
                              );
                            }
                            return loder;
                          }
                          return loder;
                        },
                      )),
                  SizedBox(
                    height: h * 0.01,
                  ),
                ],
              ),
            ),
            Label(
              color: korangecolor,
              text: "recommended packs",
              textStyle: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: kwhitecolor),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Container(
                height: h * 0.18,
                child: FutureBuilder(
                  future: getrecmostPlans(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // mostpop.addAll(snapshot.data);
                      if (snapshot.hasData) {
                        return ListView.builder(
                                controller: _controller2,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.01, horizontal: h * 0.025),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  PlanModel model = PlanModel();
                                  model= snapshot.data[index];
                                  return Visibility(
                                    visible: model.isrec=="true",
                                    child: GestureDetector(
                                      onTap: () {
                                        print("Cat "+model.categoryId.toString()+"^^");
                                        Ids.categoryid = model.categoryId.toString();
                                        Ids.subcategoryid = model.subcatid.toString();
                                        Ids.planid = model.planid.toString();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ProductDetails(
                                                      planDetails:
                                                          model
                                                    )));
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
                                                height: h*0.04,
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
                              );
                      }
                      return const Center(child: Text("No Data Found"));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                                controller: _controller2,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.01, horizontal: h * 0.025),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  PlanModel model = PlanModel();
                                  model= snapshot.data[index];
                                  return Visibility(
                                    visible: model.isrec=="true",
                                    child: GestureDetector(
                                      onTap: () {
                                        print("Cat "+model.categoryId.toString()+"^^");
                                        Ids.categoryid = model.categoryId.toString();
                                        Ids.subcategoryid = model.subcatid.toString();
                                        Ids.planid = model.planid.toString();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ProductDetails(
                                                      planDetails:
                                                          model
                                                    )));
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
                                                height: h*0.04,
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
                              );
                      }
                      return loder;
                    }
                    return loder;
                  },
                )),
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
                  Image.asset(
                    "assets/images/call.png",
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
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                    horizontal: h * 0.023, vertical: h * 0.01),
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Offers()));
                    },
                    child: RRectCard(
                      h: h * 0.1,
                      w: w * 0.28,
                      borderRadius: 15,
                      widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                              padding:
                                  EdgeInsets.symmetric(horizontal: h * 0.01),
                              child: FittedBox(
                                child: Text(
                                  offers[index]["card"],
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
}
