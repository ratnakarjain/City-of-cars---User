import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceMain extends StatefulWidget {
  const ServiceMain({Key? key}) : super(key: key);

  @override
  State<ServiceMain> createState() => _ServiceMainState();
}

class _ServiceMainState extends State<ServiceMain> {
  ScrollController _controller = new ScrollController();
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
    },
    {
      "services": "Dent Paint Detailling",
      "image": "2113.png",
    },
    {
      "services": "Custom Services",
      "image": "2112.png",
    },
    {
      "services": "Tyres Batteries",
      "image": "2111.png",
    },
  ];
  List recent = [
    {
      "services": "clutch",
      "image": "2114.png",
    },
    {
      "services": "suspension",
      "image": "2117.png",
    },
    {
      "services": "brakes",
      "image": "2118.png",
    },
    {
      "services": "clutch",
      "image": "2114.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        foregroundColor: kwhitecolor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Greater Kailash",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: kwhitecolor)),
            ),
            Text(
              "Delhi",
              textScaleFactor: 0.6,
              style: GoogleFonts.montserrat(color: kwhitecolor),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: kwhitecolor.withOpacity(0.5),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Expanded(
                flex: 2,
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
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPage == index
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFFFFFFFF).withOpacity(0.5),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    color: kLightOrangeBgColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          controller: _controller,
                          padding: EdgeInsets.symmetric(
                              vertical: h * 0.02, horizontal: h * 0.01),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: List.generate(carServices.length, (index) {
                            return
                            RRectCard(
                              h: h * 0.18,
                              w: h * 0.18,
                              borderRadius: 10,
                              widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset( "assets/images/${carServices[index]["image"]}"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        carServices[index]["services"],
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          height: 3,
                                          fontSize: 11
                                        ),
                                      ),
                                    )
                                  ]),
                            );
                             
                          }),
                        ),
                        Label(
                          color: kbluecolor,
                          text: "most populer packs", textStyle: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kwhitecolor),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                
                        
                        ),
                        Container(
                          height: h * 0.18,
                          child: ListView.builder(
                            
                  physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(h * 0.01),
                            itemCount: carServices.length,
                            itemBuilder: (context, index) {
                              return
                               RRectCard(
                              h: h * 0.1,
                              w: w * 0.25,
                              borderRadius: 15,
                              widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/${recent[index]["image"]}"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        recent[index]["services"],
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          height: 2,
                                        ),
                                      ),
                                    )
                                  ]),
                            );
                            },
                          ),
                        ),
                        Label(
                          color: korangecolor,
                          text: "recommended packs", textStyle: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kwhitecolor),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                
                        
                        ),
                        Container(
                          height: h * 0.18,
                          child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(h * 0.01),
                            itemCount: carServices.length,
                            itemBuilder: (context, index) {
                              return 
                              RRectCard(
                              h: h * 0.1,
                              w: w * 0.25,
                              borderRadius: 15,
                              widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/images/${recent[index]["image"]}"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        recent[index]["services"],
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          height: 2,
                                        ),
                                      ),
                                    )
                                  ]),
                            );},
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
