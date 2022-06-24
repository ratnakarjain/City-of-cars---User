import 'dart:io';

import 'package:cityofcars/Screens/Service%20Main/InsidCategoryTabViw/common_services.dart';
import 'package:cityofcars/Screens/Service%20Main/productDetail.dart';
import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Services/models/subcategory.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

import '../../Services/models/plansModel.dart';

class InsideCategory extends StatefulWidget {
  String id;
  InsideCategory({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<InsideCategory> createState() => _InsideCategoryState();
}

class _InsideCategoryState extends State<InsideCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _controller1 = new ScrollController();
  ScrollController _controller2 = new ScrollController();
  var h;
  var w;
  var contexte;
  int currentPage = 0;
  bool isLoading = false;
  String _id = "";
  PageController _pageController = PageController();
  List backimage = [
    "https://wallpaperaccess.com/full/33110.jpg",
    "https://wallpaperaccess.com/full/14444.jpg",
    "https://wallpaperaccess.com/full/33116.jpg",
    "https://wallpaperaccess.com/full/33118.jpg"
  ];
  List reccomendedPackes = [
    {"services": "Clutch", "image": "2114.png", "type": "Custom services"},
    {"services": "Suspension", "image": "2117.png", "type": "Custom services"},
    {"services": "Brakes", "image": "2118.png", "type": "Custom services"},
    {"services": "Clutch", "image": "2114.png", "type": "Custom services"},
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
  List recent = [
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
  List bodyType = [
    "common services",
    "brakes",
    "details",
    "suspension",
  ];
  List whichBodyType = [];
  final itemKey1 = GlobalKey();
  final itemKey2 = GlobalKey();
  final itemKey3 = GlobalKey();
  final itemKey4 = GlobalKey();
  final _scrollkey = GlobalKey();
  TextEditingController search1 = TextEditingController();
  List keys = [];
  // Subcategory? subcategory;
  // List<Data> subdata = [];
  ScrollController _scrollController = ScrollController();
  List<SubcatModel> service = [];
  List images = [];
  @override
  void initState() {
    // TODO: implement initState
    //   _scrollController = ScrollController()..addListener(() {
    //   _tabController.index=(_scrollController.offset)~/(100*30);
    //     print(_tabController.index);
    //     setState(() {

    //     });
    // });_
    _id = widget.id;

    fecthdata(false);

    _scrollController.addListener(() {
      check();
    });
    getsubcatbanner().then((value) {
      images.addAll(value);
      setState(() {});
    });
    super.initState();
    // keys.add(itemKey1);
    // keys.add(itemKey2);
    // keys.add(itemKey3);
    // keys.add(itemKey4);

    // whichBodyType = List.generate(bodyType.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    print("service " + service.length.toString());
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      // key: _scaffoldkey,
      backgroundColor: kLightOrangeBgColor,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.18),
        child: AppBar(
          centerTitle: false,
          backgroundColor: kTransparent,
          elevation: 0,
          foregroundColor: kwhitecolor,
          title: Text(
            "Home",
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
                    itemCount: images.length, // backimage.length,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    images[index],
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
      body: isLoading
          ? Padding(
              padding: Platform.isIOS
                  ? EdgeInsets.only(bottom: 100.0)
                  : EdgeInsets.only(bottom: 150.0),
              child: loder,
            )
          : service.isEmpty
              ? Center(
                  child: Text(
                    "No Data Found",
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kTextInputPlaceholderColor)),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Container(
                        height: h * 0.07,
                        padding: EdgeInsets.only(
                            left: w * 0.06, right: w * 0.06, top: h * 0.02),
                        child: Material(
                          color: kwhitecolor,
                          elevation: 8,
                          shadowColor:
                              kTextInputPlaceholderColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(h * 0.05),
                          child: TextFormField(
                            controller: search1,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: h * 0.01, left: w * 0.05),
                                hintText: "Search",
                                hintStyle: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: ksearchTextColor.withOpacity(0.57),
                                ),
                                suffixIcon: InkWell(
                                  onTap: search1.text.isEmpty
                                      ? () {
                                          setState(() {});
                                        }
                                      : () {
                                          fecthdata(true);

                                          _scrollController.addListener(() {
                                            check();
                                          });
                                        },
                                  child: const Icon(
                                    Icons.search,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: korangecolor, width: 1.0),
                                    borderRadius:
                                        BorderRadius.circular(h * 0.05)),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: kTextInputPlaceholderColor,
                                        width: 1.0),
                                    borderRadius:
                                        BorderRadius.circular(h * 0.05))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      // Expanded(
                      //   child: ScrollableListTabView(
                      //     tabHeight: 48,
                      //         bodyAnimationDuration: const Duration(milliseconds: 150),
                      //         // tabAnimationCurve: Curves.easeOut,
                      //         tabAnimationDuration: const Duration(milliseconds: 200),
                      //     tabs: List.generate(bodyType.length, (index) {
                      //       return ScrollableListTab(
                      //         tab: ListTab(
                      //           activeBackgroundColor: kwhitecolor,
                      //          inactiveBackgroundColor: kwhitecolor,
                      //          borderRadius: BorderRadius.circular(0),
                      //           label: Text(
                      //                 "${bodyType[index]}".toUpperCase(),
                      //                 style: GoogleFonts.montserrat(
                      //                     fontSize: 9,
                      //                     textStyle: const TextStyle(
                      //                       color: kTextInputPlaceholderColor,
                      //                       height: 2,
                      //                       fontWeight: FontWeight.bold,
                      //                     )),),
                      //           // icon: Text(
                      //           //       "${bodyType[0]}".toUpperCase(),
                      //           //       style: GoogleFonts.montserrat(
                      //           //           fontSize: 9,
                      //           //           textStyle: const TextStyle(
                      //           //             height: 2,
                      //           //             fontWeight: FontWeight.bold,
                      //           //           )),),
                      //         ),
                      //         body: ListView(
                      //           shrinkWrap: true,
                      //           physics: const NeverScrollableScrollPhysics(),
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Label(
                      //                 color: kbluecolor,
                      //                 text: bodyType[index],
                      //                 textStyle: GoogleFonts.montserrat(
                      //                   textStyle: const TextStyle(
                      //                       fontSize: 11,
                      //                       fontWeight: FontWeight.bold,
                      //                       color: kwhitecolor),
                      //                 ),
                      //                 padding:
                      //                     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //           ),
                      //               ],
                      //             ),
                      //           const CommonServices(),
                      //           ],
                      //         )

                      //         );
                      //     })
                      //   //   [
                      //   //     ScrollableListTab(
                      //   //       tab: ListTab(
                      //   //         label: Text(
                      //   //               "${bodyType[0]}".toUpperCase(),
                      //   //               style: GoogleFonts.montserrat(
                      //   //                   fontSize: 9,
                      //   //                   textStyle: const TextStyle(
                      //   //                     height: 2,
                      //   //                     fontWeight: FontWeight.bold,
                      //   //                   )),),
                      //   //         // icon: Text(
                      //   //         //       "${bodyType[0]}".toUpperCase(),
                      //   //         //       style: GoogleFonts.montserrat(
                      //   //         //           fontSize: 9,
                      //   //         //           textStyle: const TextStyle(
                      //   //         //             height: 2,
                      //   //         //             fontWeight: FontWeight.bold,
                      //   //         //           )),),
                      //   //       ),
                      //   //       body: ListView(
                      //   //         shrinkWrap: true,
                      //   //         physics: const NeverScrollableScrollPhysics(),
                      //   //         children: [
                      //   //           Row(
                      //   //             children: [
                      //   //               Label(
                      //   //               color: kbluecolor,
                      //   //               text: "common services",
                      //   //               textStyle: GoogleFonts.montserrat(
                      //   //                 textStyle: const TextStyle(
                      //   //                     fontSize: 11,
                      //   //                     fontWeight: FontWeight.bold,
                      //   //                     color: kwhitecolor),
                      //   //               ),
                      //   //               padding:
                      //   //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //   //         ),
                      //   //             ],
                      //   //           ),
                      //   //         const CommonServices(),
                      //   //         ],
                      //   //       )

                      //   //       ),
                      //   // ScrollableListTab(
                      //   //       tab: ListTab(
                      //   //         label: Text(
                      //   //               "${bodyType[1]}".toUpperCase(),
                      //   //               style: GoogleFonts.montserrat(
                      //   //                   fontSize: 9,
                      //   //                   textStyle: const TextStyle(
                      //   //                     height: 2,
                      //   //                     fontWeight: FontWeight.bold,
                      //   //                   )),),
                      //   //         // icon: Text(
                      //   //         //       "${bodyType[0]}".toUpperCase(),
                      //   //         //       style: GoogleFonts.montserrat(
                      //   //         //           fontSize: 9,
                      //   //         //           textStyle: const TextStyle(
                      //   //         //             height: 2,
                      //   //         //             fontWeight: FontWeight.bold,
                      //   //         //           )),),
                      //   //       ),
                      //   //       body: ListView(
                      //   //         shrinkWrap: true,
                      //   //         physics: const NeverScrollableScrollPhysics(),
                      //   //         children: [
                      //   //           Row(
                      //   //             children: [
                      //   //               Label(
                      //   //               color: kbluecolor,
                      //   //               text: "common services",
                      //   //               textStyle: GoogleFonts.montserrat(
                      //   //                 textStyle: const TextStyle(
                      //   //                     fontSize: 11,
                      //   //                     fontWeight: FontWeight.bold,
                      //   //                     color: kwhitecolor),
                      //   //               ),
                      //   //               padding:
                      //   //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //   //         ),
                      //   //             ],
                      //   //           ),
                      //   //         const CommonServices(),
                      //   //         ],
                      //   //       )

                      //   //       ),
                      //   //       ScrollableListTab(
                      //   //       tab: ListTab(
                      //   //         label: Text(
                      //   //              "${bodyType[2]}".toUpperCase(),
                      //   //               style: GoogleFonts.montserrat(
                      //   //                   fontSize: 9,
                      //   //                   textStyle: const TextStyle(
                      //   //                     height: 2,
                      //   //                     fontWeight: FontWeight.bold,
                      //   //                   )),),
                      //   //         // icon: Text(
                      //   //         //       "${bodyType[0]}".toUpperCase(),
                      //   //         //       style: GoogleFonts.montserrat(
                      //   //         //           fontSize: 9,
                      //   //         //           textStyle: const TextStyle(
                      //   //         //             height: 2,
                      //   //         //             fontWeight: FontWeight.bold,
                      //   //         //           )),),
                      //   //       ),
                      //   //       body: ListView(
                      //   //         shrinkWrap: true,
                      //   //         physics: const NeverScrollableScrollPhysics(),
                      //   //         children: [
                      //   //           Row(
                      //   //             children: [
                      //   //               Label(
                      //   //               color: kbluecolor,
                      //   //               text: "breaks",
                      //   //               textStyle: GoogleFonts.montserrat(
                      //   //                 textStyle: const TextStyle(
                      //   //                     fontSize: 11,
                      //   //                     fontWeight: FontWeight.bold,
                      //   //                     color: kwhitecolor),
                      //   //               ),
                      //   //               padding:
                      //   //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //   //         ),
                      //   //             ],
                      //   //           ),
                      //   //         const CommonServices(),
                      //   //         ],
                      //   //       )

                      //   //       ),
                      //   //       ScrollableListTab(
                      //   //       tab: ListTab(
                      //   //         label: Text(
                      //   //               "${bodyType[3]}".toUpperCase(),
                      //   //               style: GoogleFonts.montserrat(
                      //   //                   fontSize: 9,
                      //   //                   textStyle: const TextStyle(
                      //   //                     height: 2,
                      //   //                     fontWeight: FontWeight.bold,
                      //   //                   )),),
                      //   //         // icon: Text(
                      //   //         //       "${bodyType[0]}".toUpperCase(),
                      //   //         //       style: GoogleFonts.montserrat(
                      //   //         //           fontSize: 9,
                      //   //         //           textStyle: const TextStyle(
                      //   //         //             height: 2,
                      //   //         //             fontWeight: FontWeight.bold,
                      //   //         //           )),),
                      //   //       ),
                      //   //       body: ListView(
                      //   //         shrinkWrap: true,
                      //   //         physics: const NeverScrollableScrollPhysics(),
                      //   //         children: [
                      //   //           Row(
                      //   //             children: [
                      //   //               Label(
                      //   //               color: kbluecolor,
                      //   //               text: "common services",
                      //   //               textStyle: GoogleFonts.montserrat(
                      //   //                 textStyle: const TextStyle(
                      //   //                     fontSize: 11,
                      //   //                     fontWeight: FontWeight.bold,
                      //   //                     color: kwhitecolor),
                      //   //               ),
                      //   //               padding:
                      //   //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //   //         ),
                      //   //             ],
                      //   //           ),
                      //   //         const CommonServices(),
                      //   //         ],
                      //   //       )

                      //   //       ),

                      //   //   ],

                      //   ),
                      // ),
                      TabBar(
                        isScrollable: true,
                        onTap: (value) {
                          _tabController.index = value;
                          scollToItem(_tabController.index);
                          setState(() {});
                        },
                        unselectedLabelColor: kSelectedColor.withOpacity(0.56),
                        indicatorColor:
                            kTextInputPlaceholderColor.withOpacity(0.5),
                        labelColor: kSelectedColor,
                        tabs: List.generate(service.length, (index) {
                          print(service.length.toString() + "+++++++++++");

                          return SizedBox(
                            height: h * 0.03,
                            child: Text(
                              service[index].name.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 9,
                                  textStyle: const TextStyle(
                                    height: 2,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          );
                        }),
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                      ),

                      Expanded(
                          child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h * 0.02,
                            ),
                            ListView.builder(
                              key: _scrollkey,
                              shrinkWrap: true,
                              controller: _controller1,
                              itemCount: service.length,
                              itemBuilder: (context, index) {
                                return CommonServices(
                                  subcategoryid: service[index].id,
                                  data: service[index].plans,
                                  key: keys[index],
                                  label: service[index].name,
                                );
                              },
                            ),
                            // Container(
                            //     key: itemKey1,
                            //     child: CommonServices(
                            //       label: bodyType[0],
                            //     )),
                            // Container(
                            //     key: itemKey2,
                            //     child: CommonServices(
                            //       label: bodyType[1],
                            //     )),
                            // Container(
                            //     key: itemKey3,
                            //     child: CommonServices(
                            //       label: bodyType[2],
                            //     )),
                            // Container(
                            //   key: itemKey4,
                            //   child: CommonServices(
                            //     label: bodyType[3],
                            //   ),
                            // ),
                            Visibility(
                              visible: recdata,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Label(
                                    color: korangecolor,
                                    text: "RECOMMEND packes",
                                    textStyle: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: kwhitecolor),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                  ),
                                  SizedBox(
                                    height: h * 0.005,
                                  ),
                                  Container(
                                      height: h * 0.18,
                                      child: FutureBuilder(
                                        future: getrecmostPlans(),
                                        builder: (context, AsyncSnapshot snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            // mostpop.addAll(snapshot.data);
                                            if (snapshot.hasData) {
                                              return ListView.builder(
                                                controller: _controller2,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection: Axis.horizontal,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: h * 0.01,
                                                    horizontal: h * 0.025),
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  PlanModel model = PlanModel();
                                                  model = snapshot.data[index];
                                                  return Visibility(
                                                    visible: model.isrec == "true",
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print("Cat " +
                                                            model.categoryId
                                                                .toString() +
                                                            "^^");
                                                        Ids.categoryid = model
                                                            .categoryId
                                                            .toString();
                                                        Ids.subcategoryid =
                                                            model.subcatid.toString();
                                                        Ids.planid =
                                                            model.planid.toString();
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ProductDetails(
                                                                        planDetails:
                                                                            model)));
                                                      },
                                                      child: RRectCard(
                                                        h: h * 0.1,
                                                        w: w * 0.25,
                                                        borderRadius: 15,
                                                        widget: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
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
                                                                  model.packs.first
                                                                      .planName,
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height: 2,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            h * 0.01),
                                                                child: FittedBox(
                                                                  child: Text(
                                                                    model.packs.first
                                                                        .subPlanName,
                                                                    textScaleFactor:
                                                                        0.6,
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: kTextInputPlaceholderColor
                                                                          .withOpacity(
                                                                              0.6),
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
                                            return const Center(child: Text("Empty"));
                                          }
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            if (snapshot.hasData) {
                                              return ListView.builder(
                                                controller: _controller2,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection: Axis.horizontal,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: h * 0.01,
                                                    horizontal: h * 0.025),
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  PlanModel model = PlanModel();
                                                  model = snapshot.data[index];
                                                  return Visibility(
                                                    visible: model.isrec == "true",
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        print("Cat " +
                                                            model.categoryId
                                                                .toString() +
                                                            "^^");
                                                        Ids.categoryid = model
                                                            .categoryId
                                                            .toString();
                                                        Ids.subcategoryid =
                                                            model.subcatid.toString();
                                                        Ids.planid =
                                                            model.planid.toString();
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ProductDetails(
                                                                        planDetails:
                                                                            model)));
                                                      },
                                                      child: RRectCard(
                                                        h: h * 0.1,
                                                        w: w * 0.25,
                                                        borderRadius: 15,
                                                        widget: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
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
                                                                  model.packs.first
                                                                      .planName,
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height: 2,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            h * 0.01),
                                                                child: FittedBox(
                                                                  child: Text(
                                                                    model.packs.first
                                                                        .subPlanName,
                                                                    textScaleFactor:
                                                                        0.6,
                                                                    style: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: kTextInputPlaceholderColor
                                                                          .withOpacity(
                                                                              0.6),
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
                                ],
                              ),
                            ),
                            // Container(
                            //   height: h * 0.18,
                            //   child: ListView.builder(
                            //     physics: const BouncingScrollPhysics(),
                            //     scrollDirection: Axis.horizontal,
                            //     padding: EdgeInsets.all(h * 0.01),
                            //     itemCount: reccomendedPackes.length,
                            //     itemBuilder: (context, index) {
                            //       return RRectCard(
                            //         h: h * 0.1,
                            //         w: w * 0.25,
                            //         borderRadius: 15,
                            //         widget: Column(
                            //             mainAxisAlignment: MainAxisAlignment.center,
                            //             children: [
                            //               Image.asset(
                            //                   "assets/images/${reccomendedPackes[index]["image"]}"),
                            //               const SizedBox(
                            //                 height: 5,
                            //               ),
                            //               FittedBox(
                            //                 child: Text(
                            //                   reccomendedPackes[index]["services"],
                            //                   style: GoogleFonts.montserrat(
                            //                     fontWeight: FontWeight.w600,
                            //                     height: 2,
                            //                   ),
                            //                 ),
                            //               ),
                            //               Padding(
                            //                 padding: EdgeInsets.symmetric(
                            //                     horizontal: h * 0.01),
                            //                 child: FittedBox(
                            //                   child: Text(
                            //                     reccomendedPackes[index]["type"],
                            //                     textScaleFactor: 0.6,
                            //                     style: GoogleFonts.montserrat(
                            //                       fontWeight: FontWeight.w600,
                            //                       color: kTextInputPlaceholderColor
                            //                           .withOpacity(0.6),
                            //                       height: 2,
                            //                     ),
                            //                   ),
                            //                 ),
                            //               )
                            //             ]),
                            //       );
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                          ],
                        ),
                      )
                          // TabBarView(

                          //   children: const [
                          //     CommonServices(),
                          //     CommonServices(),
                          //     CommonServices(),
                          //     CommonServices(),
                          //   ],
                          //   controller: _tabController,
                          // ),
                          // ),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child:
                          // Row(
                          //     children: List.generate(
                          //         bodyType.length,
                          //         (index) => InkWell(
                          //           onTap: (){},
                          //           child: Container(
                          //                 padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                          //                 height: h * 0.02,
                          //                 child: Column(
                          //                   mainAxisSize: MainAxisSize.min,
                          //                   children: [
                          //                     Text(
                          //                       "${bodyType[index]}".toUpperCase(),
                          //                       textScaleFactor: 0.7,
                          //                       style: GoogleFonts.montserrat(
                          //                           textStyle: const TextStyle(
                          //                               fontWeight: FontWeight.w400,
                          //                               )),
                          //                     ),
                          //                     Container(
                          //                       height: 3,
                          //                       width: 100,
                          //                       color: Colors.black,
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //         )),
                          //   ),
                          // ),
                          // ],
                          ),
                    ]),
    );
  }

  check() {
    print(_scrollController.offset);
    print(_scrollkey.currentContext!.size!.height);
    _tabController.index = (_scrollController.offset) ~/
        (_scrollkey.currentContext!.size!.height ~/ (keys.length));
    print(_tabController.index);
    setState(() {});
  }

  Future scollToItem(int index) async {
    contexte = keys[index].currentContext!;
    print(keys[index].currentContext!);
    await Scrollable.ensureVisible(contexte,
        duration: const Duration(milliseconds: 1000));
  }

  fecthdata(bool search) {
    isLoading = true;
    setState(() {});
  !search?  getSubcategory(_id).then((value) {
      setState(() {
        service.clear();
        service.addAll(value);
      });
    }).whenComplete(() {
      _tabController = TabController(length: service.length, vsync: this);
      for (int i = 0; i < service.length; i++) {
        keys.add(i);
        keys[i] = GlobalKey();
      }
      isLoading = false;
      setState(() {});
    }):
    searchGloble(search1.text).then((value) {
      print("done");
      if (value) {

        service.clear();
        service.addAll(Searchdata.subcat);
        
        print("condition");
        

        // pls=value.plans;

        setState(() {});
      }
    }).whenComplete(() {
      _tabController = TabController(length: service.length, vsync: this);
      for (int i = 0; i < service.length; i++) {
        keys.add(i);
        keys[i] = GlobalKey();
      }
      isLoading = false;
      setState(() {});
    });
  }
}
