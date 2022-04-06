import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Screens/carHealth.dart';
import 'package:cityofcars/Screens/editProfile.dart';
import 'package:cityofcars/Screens/messages.dart';
import 'package:cityofcars/Screens/myhomepage.dart';
import 'package:cityofcars/Screens/sos.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var h;
  var w;
  List cars = [
    {
      "image": "Uber1.png",
    },
    {
      "image": "Uber2.png",
    },
    {
      "image": "Uber3.png",
    },
    {
      "image": "Uber4.png",
    },
    {
      "image": "Uber5.png",
    },
    {
      "image": "Uber1.png",
    },
    {
      "image": "Uber2.png",
    },
    {
      "image": "Uber3.png",
    },
    {
      "image": "Uber4.png",
    },
    {
      "image": "Uber5.png",
    },
    {
      "image": "Uber1.png",
    },
    {
      "image": "Uber2.png",
    },
    {
      "image": "Uber3.png",
    },
    {
      "image": "Uber4.png",
    },
    {
      "image": "Uber5.png",
    },
  ];
  int currentCar = 0;
  List isSelected = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = List.generate(cars.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kwhitecolor,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.montserrat(
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kbg2,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(h * 0.08)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          offset: Offset(0, 5),
                          color: kTextInputPlaceholderColor.withOpacity(0.1))
                    ]),
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: kbluecolor,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "You can",
                              style: GoogleFonts.montserrat(
                                fontSize: 11,
                                color: kTextInputPlaceholderColor,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: " change or add a new car ",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    color: kTextInputPlaceholderColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: "here",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    color: kTextInputPlaceholderColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Container(
                      height: h * 0.2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        shrinkWrap: true,
                        // padding: EdgeInsets.only(left: w*0.1),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index == 0
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (currentCar > 0) {
                                            currentCar--;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.arrow_back_ios))
                                  : Container(),
                              Column(
                                children: [
                                  RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: "I20\n",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 9,
                                            color: kTextInputPlaceholderColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "HYUNDAI",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 9,
                                                color:
                                                    kTextInputPlaceholderColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ])),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: h * 0.07,
                                      backgroundColor:
                                          isSelected[index + currentCar]
                                              ? korangecolor
                                              : kgrey,
                                      child: InkWell(
                                        onTap: () {
                                          isSelected[index + currentCar] =
                                              !isSelected[index + currentCar];
                                          setState(() {});
                                        },
                                        child: CircleAvatar(
                                          radius: h * 0.06,
                                          backgroundColor: kwhitecolor,
                                          child: Center(
                                            child: Image.asset(
                                                "assets/images/${cars[index + currentCar]["image"]}"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              index == 1
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (currentCar < cars.length - 1) {
                                            currentCar++;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.arrow_forward_ios))
                                  : Container(),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w * 0.06,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "Hi, ",
                                style: GoogleFonts.montserrat(
                                  fontSize: 19,
                                  color: kTextInputPlaceholderColor,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Ankit  ",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 19,
                                      color: kTextInputPlaceholderColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ])),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditProfile(),
                                ));
                          },
                          child: CircleAvatar(
                            radius: h * 0.014,
                            backgroundColor: kTextInputPlaceholderColor,
                            foregroundColor: kwhitecolor,
                            child: Image.asset("assets/images/edit-2.png"),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: h * 0.02),
                        height: h * 0.07,
                        width: w * 0.4,
                        decoration: BoxDecoration(
                            color: kwhitecolor,
                            borderRadius: BorderRadius.circular(h * 0.03)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: h * 0.07,
                              width: w * 0.12,
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mail),
                                      Text(
                                        "Support",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 7,
                                          color: ksubHading,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: h * 0.01,
                                    right: w * 0.02,
                                    child: CircleAvatar(
                                      radius: h * 0.01,
                                      foregroundColor: kwhitecolor,
                                      backgroundColor: kbluecolor,
                                      child: Text(
                                        "7",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 8,
                                          color: kwhitecolor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: kgrey,
                            ),
                            SizedBox(
                              height: h * 0.07,
                              width: w * 0.12,
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.notifications),
                                      Text(
                                        "Notifications",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 7,
                                          color: ksubHading,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: h * 0.01,
                                    right: w * 0.01,
                                    child: CircleAvatar(
                                      radius: h * 0.01,
                                      foregroundColor: kwhitecolor,
                                      backgroundColor: korangecolor,
                                      child: Text(
                                        "5",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 8,
                                          color: kwhitecolor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Sos(),
                      ));
                },
                child: RRectCard(
                  h: h * 0.08,
                  w: w * 0.9,
                  widget: Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: kbluecolor,
                          foregroundColor: kwhitecolor,
                          child: Image.asset("assets/images/sunrise.png"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "SOS",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  borderRadius: h * 0.04,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar(
                          index: 2,
                        ),
                      ));
                },
                child: RRectCard(
                  h: h * 0.08,
                  w: w * 0.9,
                  widget: Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: korangecolor,
                          foregroundColor: kwhitecolor,
                          child: Image.asset("assets/images/heart.png"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Order History",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  borderRadius: h * 0.04,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarHealth(),
                      ));
                },
                child: RRectCard(
                  h: h * 0.08,
                  w: w * 0.9,
                  widget: Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: korangecolor,
                          foregroundColor: kwhitecolor,
                          child: Image.asset("assets/images/heart.png"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Car Health Analysis",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  borderRadius: h * 0.04,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Messages(),
                      ));
                },
                child: RRectCard(
                  h: h * 0.08,
                  w: w * 0.9,
                  widget: Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: kbluecolor,
                          foregroundColor: kwhitecolor,
                          child: Image.asset("assets/images/sunrise.png"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Help & Support",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  borderRadius: h * 0.04,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => const MyHomePage(),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                },
                child: RRectCard(
                  h: h * 0.08,
                  w: w * 0.9,
                  widget: Row(
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: korangecolor,
                          foregroundColor: kwhitecolor,
                          child: Image.asset("assets/images/heart.png"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  borderRadius: h * 0.04,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
