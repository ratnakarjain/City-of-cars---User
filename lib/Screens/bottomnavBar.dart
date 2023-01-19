import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Screens/news.dart';
import 'package:cityofcars/Screens/notification.dart';
import 'package:cityofcars/Screens/orderHistory.dart';
import 'package:cityofcars/Screens/profile.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Services/models/usercardetailsmodel.dart';
import '../Services/servies.dart';
import '../Utils/functions.dart';

class BottomNavBar extends StatefulWidget {
  int index;
  BottomNavBar({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home".toUpperCase(), korangecolor,
        labelStyle: GoogleFonts.montserrat(color: kwhitecolor, fontSize: 9)),
    TabItem(Icons.list_alt_rounded, "Blogs".toUpperCase(), korangecolor,
        labelStyle: GoogleFonts.montserrat(color: kwhitecolor, fontSize: 9)),
    TabItem(Icons.shopping_cart, "Orders".toUpperCase(), korangecolor,
        labelStyle: GoogleFonts.montserrat(color: kwhitecolor, fontSize: 9)),
    TabItem(Icons.person, "Profile".toUpperCase(), korangecolor,
        labelStyle: GoogleFonts.montserrat(color: kwhitecolor, fontSize: 9)),
    TabItem(
        Icons.notifications_none, "Notifications".toUpperCase(), korangecolor,
        labelStyle: GoogleFonts.montserrat(color: kwhitecolor, fontSize: 9)),
  ]);
  var _navigationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcmsdata();
    getSecurityURL();
    selectedPos = widget.index;
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  List<Widget> widgets = [
    ServiceMain(),
    News(),
    OrderHistory(),
    Profile(),
    Notifications(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() => showExitPopup(context)),
      child: Scaffold(
          extendBody: true,
          body: widgets[selectedPos],
          bottomNavigationBar: CircularBottomNavigation(
            tabItems,
            controller: _navigationController,
            barHeight: bottomNavBarHeight,
            iconsSize: 20,
            normalIconColor: kwhitecolor,
            barBackgroundColor: kbluecolor,
            animationDuration: const Duration(milliseconds: 300),
            selectedCallback: (selectedPos) {
              setState(() {
                this.selectedPos = selectedPos!;
              });
            },
          )),
    );
  }
}
