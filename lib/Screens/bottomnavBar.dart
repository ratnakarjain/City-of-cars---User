import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 2;
  var size;
  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 700) {
      barHeight = 70;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }

    return Scaffold(
      bottomNavigationBar:  CircleBottomNavigationBar(
        initialSelection: currentPage,
        barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
        arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
        itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
        itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
        circleOutline: 15.0,
        shadowAllowance: 0.0,
        circleSize: 50.0,
        blurShadowRadius: 50.0,
        barBackgroundColor: kbluecolor,
        textColor: kwhitecolor,
        circleColor: korangecolor,
        activeIconColor: kwhitecolor,
        inactiveIconColor: kwhitecolor,
        tabs: getTabsData(),
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );

  }
  
List<TabData> getTabsData() {
  return [
    TabData(
      icon: Icons.home,
      iconSize: 25.0,
      title: 'Home',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.history,
      iconSize: 25,
      title: 'History',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.search,
      iconSize: 25,
      title: 'Search',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.alarm,
      iconSize: 25,
      title: 'Alarm',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: Icons.alarm,
      iconSize: 25,
      title: 'Alarm',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
  ];
}
}