import 'package:cityofcars/button.dart';
import 'package:cityofcars/constants.dart';
import 'package:cityofcars/loginSignup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var h;
  var w;
  int currentPage = 0;
  List cardData=[
    {
      "image":"assets/images/man_with_car.png"
    },
    {
      "image":"assets/images/man_with_car.png"
    },
    {
      "image":"assets/images/man_with_car.png"
    },
    {
       "image":"assets/images/man_with_car.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CarouselSlider.builder(
            //   carouselController: _controller,
            //   itemCount: 1,
            //   itemBuilder: (context, index, pageViewIndex){
            //     return
            // Card(
            //   elevation: 10,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(h*0.08)
            //   ),
            //   child: Container(
            //     height: h*0.6,
            //     width: w*0.9,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Image.asset("assets/images/man_with_car.png"),
            //         Padding(
            //           padding: EdgeInsets.only(top: h*0.02),
            //           child: Center(
            //             child: Text(
            //               "Get Started",
            //               textScaleFactor: 2,
            //               style: GoogleFonts.montserrat(
            //                 fontWeight: FontWeight.w700
            //               ),
                          
            //               ),
            //           ),
            //         ),
            //         Container(
            //           width: w*0.8,
            //           padding: EdgeInsets.only(top: h*0.015),
            //           child: Center(
            //             child: Text(
            //               "   If you're offered a seat on a rocket\n ship, don't ask what seat! Just get on.",
            //               textScaleFactor: 1,
            //               style: GoogleFonts.montserrat(
            //                 color: kblacklightshadecolor,
            //                 fontWeight: FontWeight.w500
            //               ),
                          
            //               ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // );

            //   },
            //   options: CarouselOptions(
            //    height: h*0.6,
            //    aspectRatio: 2.0,
            //     enlargeCenterPage: true,
            //     viewportFraction: 0.9,
            //      onPageChanged: (index, reason) {
            //       setState(() {
            //         _current = index;
            //       });
            //     }),
              
            // ),
            Expanded(

              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: cardData.length,
                  itemBuilder: (context, index) =>
                  Padding(
                    padding:  EdgeInsets.only(top: h*0.08,left: w*0.05,right: w*0.05,bottom: h*0.02),
                    child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(h*0.08)
                ),
                child: Container(
                    height: h*0.6,
                    width: w*0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(cardData[index]["image"]!),
                        Padding(
                          padding: EdgeInsets.only(top: h*0.02),
                          child: Center(
                            child: Text(
                              "Get Started",
                              textScaleFactor: 2,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700
                              ),
                              
                              ),
                          ),
                        ),
                        Container(
                          width: w*0.8,
                          padding: EdgeInsets.only(top: h*0.015),
                          child: Center(
                            child: Text(
                              "   If you're offered a seat on a rocket\n ship, don't ask what seat! Just get on.",
                              textScaleFactor: 1,
                              style: GoogleFonts.montserrat(
                                color: kblacklightshadecolor,
                                fontWeight: FontWeight.w500
                              ),
                              
                              ),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
                  )
                ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cardData.map((url) {
                int index = cardData.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
             SizedBox(
              height: h*0.05,
            ),            
            RRecctButton(
              text: "LOGIN",
              h: h*0.07,
              w: w*0.88,
              buttonColor: kbluecolor,
              style: GoogleFonts.montserrat(
                      color: kwhitecolor,
                      fontWeight: FontWeight.w600
                    ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignUp(isSignIn: true,),));
                
              },
            ),
             SizedBox(
              height: h*0.02,
            ),   
            RRecctButton(
              text: "SIGNUP",
              h: h*0.07,
              w: w*0.88,
              buttonColor: korangecolor,
              style: GoogleFonts.montserrat(
                      color: kwhitecolor,
                      fontWeight: FontWeight.w600
                    ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignUp(isSignIn: false,),));
                
              },
            ),
            SizedBox(
              height: h*0.05,
            ),  
            
            

          ],
        ),
      ),
    );
  }

}
