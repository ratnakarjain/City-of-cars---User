import 'package:cityofcars/Screens/Service%20Main/InsidCategoryTabViw/common_services.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsideCategory extends StatefulWidget {
  const InsideCategory({Key? key}) : super(key: key);

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
  int currentPage = 0;

  List backimage = [
    "https://wallpaperaccess.com/full/33110.jpg",
    "https://wallpaperaccess.com/full/14444.jpg",
    "https://wallpaperaccess.com/full/33116.jpg",
    "https://wallpaperaccess.com/full/33118.jpg"
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: bodyType.length, vsync: this);

    whichBodyType = List.generate(bodyType.length, (index) => false);
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
                    itemCount: backimage.length,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    backimage[index],
                                  ),
                                  fit: BoxFit.cover)),
                        )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: backimage.map((url) {
                      int index = backimage.indexOf(url);
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
            height: h * 0.07,
            padding:
                EdgeInsets.only(left: w * 0.06, right: w * 0.06, top: h * 0.02),
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
          TabBar(
            isScrollable: true,
            onTap: (value) {
              _tabController.index = value;
            },
            unselectedLabelColor: kSelectedColor.withOpacity(0.56),
            indicatorColor: kTextInputPlaceholderColor.withOpacity(0.5),
            labelColor: kSelectedColor,
            tabs: List.generate(
                bodyType.length,
                (index) => SizedBox(
                  height: h*0.03,
                  child: Text(
                        "${bodyType[index]}".toUpperCase(),
                       
                        style: GoogleFonts.montserrat(
                          fontSize: 9,
                            textStyle: const TextStyle(
                              height: 2,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                )),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              children: const [
                CommonServices(),
                CommonServices(),
                CommonServices(),
                CommonServices(),
              ],
              controller: _tabController,
            ),
          ),
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
        ],
      ),
    );
  }
}
