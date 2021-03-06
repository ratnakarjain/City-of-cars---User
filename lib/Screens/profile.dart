import 'dart:convert';

import 'package:cityofcars/Screens/aboutUs.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Screens/carHealth.dart';
import 'package:cityofcars/Screens/editProfile.dart';
import 'package:cityofcars/Screens/loginSignup.dart';
import 'package:cityofcars/Screens/messages.dart';
import 'package:cityofcars/Screens/myhomepage.dart';
import 'package:cityofcars/Screens/newcity.dart';
import 'package:cityofcars/Screens/notification.dart';
import 'package:cityofcars/Screens/privacypolicy.dart';
import 'package:cityofcars/Screens/selectBrand.dart';
import 'package:cityofcars/Screens/selectCity.dart';
import 'package:cityofcars/Screens/sos.dart';
import 'package:cityofcars/Screens/terms.dart';
import 'package:cityofcars/Services/models/usercardetailsmodel.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Service Main/cart.dart';
import 'faq.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var pref = Prefernece.pref;
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
  int isSelected = 0;
  List<CarsModel> modellist = [];
  bool isLoading = true;
  getusercarsdata(){
 getusercars().then((value) {
      setState(() {
        modellist.clear();
        modellist.addAll(value);
        print(modellist);
        isLoading = false;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (pref?.getInt("CCar") != null) {
      isSelected = pref!.getInt("CCar")!;

      print(isSelected.toString() + "======");
      setState(() {});
    }
    getusercarsdata();
   
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SelectBrand(),
                                ));
                          },
                          child: const Icon(
                            Icons.add,
                            color: kbluecolor,
                          ),
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
                                    fontWeight: FontWeight.bold,
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
                    isLoading
                        ? loder
                        : Visibility(
                            visible: modellist.isNotEmpty,
                            child: Container(
                              height: h * 0.2,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: modellist.length <= 2
                                    ? modellist.length
                                    : 2,
                                shrinkWrap: true,
                                // padding: EdgeInsets.only(left: w*0.1),
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      index == 0
                                          ? Visibility(
                                              visible: modellist.length > 2,
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (currentCar > 0) {
                                                        currentCar--;
                                                        print(currentCar);
                                                      }
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_back_ios)),
                                            )
                                          : Container(),
                                      Column(
                                        children: [
                                          RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  text:
                                                      "${modellist[currentCar + index].carname}\n",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 9,
                                                    color:
                                                        kTextInputPlaceholderColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "${modellist[currentCar + index].carbrand}",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 9,
                                                        color:
                                                            kTextInputPlaceholderColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ])),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: h * 0.07,
                                              backgroundColor:
                                                  index + currentCar + 1 ==
                                                          isSelected
                                                      ? korangecolor
                                                      : kgrey.withOpacity(0.5),
                                              child: InkWell(
                                                onLongPress: () {
                                                  print("dvkhsdvudhvbcuw");
                                                  deletecar(currentCar + index);
                                                },
                                                onTap: () {
                                                  isSelected =
                                                      index + currentCar + 1;
                                                  String js = jsonEncode(
                                                      modellist[
                                                          isSelected - 1]);
                                                  pref!
                                                      .setString("usercar", js);
                                                  pref!.setInt(
                                                      "CCar", isSelected);
                                                  Ids.brandid =
                                                      modellist[isSelected - 1]
                                                          .carbrandid
                                                          .toString();
                                                  Ids.carid =
                                                      modellist[isSelected - 1]
                                                          .carid
                                                          .toString();
                                                  Ids.cityid =
                                                      modellist[isSelected - 1]
                                                          .cityid
                                                          .toString();
                                                  Ids.fuelid =
                                                      modellist[isSelected - 1]
                                                          .carfuelid
                                                          .toString();
                                                  print(Ids.cityid +
                                                      "  " +
                                                      Ids.carid +
                                                      "  " +
                                                      Ids.brandid +
                                                      "  " +
                                                      Ids.fuelid);

                                                  pref!.setString(
                                                      "CarId", Ids.carid);
                                                  pref!.setString(
                                                      "cityId", Ids.cityid);
                                                  pref!.setString(
                                                      "fuelId", Ids.fuelid);
                                                  pref!.setString(
                                                      "brandId", Ids.brandid);

                                                  print(pref
                                                      ?.getString("usercar"));
                                                  print(pref?.getInt("CCar"));

                                                  // print(js);
                                                  setState(() {});
                                                },
                                                child: CircleAvatar(
                                                  radius: h * 0.06,
                                                  backgroundColor: kwhitecolor,
                                                  backgroundImage: NetworkImage(
                                                      modellist[index +
                                                              currentCar]
                                                          .carimage),
                                                  child: Center(
                                                      // child: Image.network(
                                                      //     "${modellist[index + currentCar].carimage}"),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      index == 1
                                          ? Visibility(
                                              visible: modellist.length > 2,
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (currentCar <
                                                          modellist.length -
                                                              2) {
                                                        currentCar++;
                                                        print(currentCar);
                                                      }
                                                    });
                                                  },
                                                  child: Icon(
                                                      Icons.arrow_forward_ios)),
                                            )
                                          : Container(),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                    SizedBox(
                      height: h * 0.01,
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
                                    text: prefs!.getString("name").toString() +
                                        "  ",
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
                    SizedBox(
                      height: h * 0.01,
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Messages(),
                                    ));
                              },
                              child: SizedBox(
                                height: h * 0.07,
                                width: w * 0.12,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    // Positioned(
                                    //   top: h * 0.01,
                                    //   right: w * 0.02,
                                    //   child: CircleAvatar(
                                    //     radius: h * 0.01,
                                    //     foregroundColor: kwhitecolor,
                                    //     backgroundColor: kbluecolor,
                                    //     child: Text(
                                    //       "7",
                                    //       style: GoogleFonts.montserrat(
                                    //         fontSize: 8,
                                    //         color: kwhitecolor,
                                    //         fontWeight: FontWeight.w700,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color: kgrey,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) =>
                                        BottomNavBar(
                                      index: 4,
                                    ),
                                  ),
                                  (route) =>
                                      false, //if you want to disable back feature set to false
                                );
                              },
                              child: SizedBox(
                                height: h * 0.07,
                                width: w * 0.12,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    // Positioned(
                                    //   top: h * 0.01,
                                    //   right: w * 0.01,
                                    //   child: CircleAvatar(
                                    //     radius: h * 0.01,
                                    //     foregroundColor: kwhitecolor,
                                    //     backgroundColor: korangecolor,
                                    //     child: Text(
                                    //       "5",
                                    //       style: GoogleFonts.montserrat(
                                    //         fontSize: 8,
                                    //         color: kwhitecolor,
                                    //         fontWeight: FontWeight.w700,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(
                          getcart: true,
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
                          backgroundColor: kbluecolor,
                          foregroundColor: kwhitecolor,
                          child: Image.asset("assets/images/sunrise.png"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Cart",
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
              SizedBox(
                height: h * 0.02,
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
              SizedBox(
                height: h * 0.005,
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
              SizedBox(
                height: h * 0.005,
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
              SizedBox(
                height: h * 0.005,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewCity(),
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
                          "Change City",
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
              SizedBox(
                height: h * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUs(),
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
                          "About us",
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
              SizedBox(
                height: h * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Terms(),
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
                          "Terms & Condition",
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
              SizedBox(
                height: h * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()));
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
                          "Privacy Policy",
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
              SizedBox(
                height: h * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FAQS()));
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
                          "FAQ's",
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
              SizedBox(
                height: h * 0.005,
              ),
              GestureDetector(
                onTap: () {
                  confirm();
                  setState(() {});
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
              ),
              SizedBox(
                height: h * 0.01,
              ),
              SizedBox(
                height: h * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  confirm() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Do you want to logout?",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.02, vertical: h * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: kbluecolor,
                            borderRadius: BorderRadius.circular(h * 0.02)),
                        height: h * 0.04,
                        child: InkWell(
                          onTap: () {
                            pref!.remove("userId");
                            pref!.remove("usercar");
                            pref!.remove("CCar");
                            prefs!.remove("CarId");

                            pref!.remove(
                              "fuelId",
                            );
                            pref!.remove(
                              "cityId",
                            );
                            pref!.remove(
                              "brandId",
                            );
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    LoginSignUp(isSignIn: true),
                              ),
                              (route) =>
                                  false, //if you want to disable back feature set to false
                            );
                          },
                          child: Center(
                            child: Text(
                              "Yes",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kwhitecolor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: kbluecolor,
                            borderRadius: BorderRadius.circular(h * 0.02)),
                        height: h * 0.04,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              "No",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kwhitecolor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  deletecar(int cindex) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Do you want to delete this car?",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.02, vertical: h * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: kbluecolor,
                            borderRadius: BorderRadius.circular(h * 0.02)),
                        height: h * 0.04,
                        child: InkWell(
                          onTap: () {
                            deletecardata(modellist[cindex].id).then((value) {
                              Navigator.pop(context);
                              currentCar = currentCar-1;
                              isLoading = true;
                              setState(() {});
                             getusercarsdata();
                            });
                          },
                          child: Center(
                            child: Text(
                              "Yes",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kwhitecolor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: kbluecolor,
                            borderRadius: BorderRadius.circular(h * 0.02)),
                        height: h * 0.04,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              "No",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kwhitecolor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
