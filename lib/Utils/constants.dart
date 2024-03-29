import 'dart:io';

import 'package:flutter/material.dart';

const korangecolor = Color(0XFFF48100);
const kbluecolor = Color(0XFF003E89);

const kblackcolor = Color(0xFF000000);
const kblacklightshadecolor = Color(0XFF767676);
const kredcolor = Color(0XFFB2002D);
const klightpurpulcolor = Color(0XFF8A56AC);
const kwhitecolor = Color(0XFFFFFFFF);
const kbg3 = Color(0xFFFFF7F7);
const kSinginTextColor = Color(0XFF5C6E98);
const kLightOrangeBgColor = Color(0XFFFAF7F7);
const kcitybgcolor = Color(0XFFFAF2F2);
// const kShadowColor = Color(0XFF00001F);
const kshadowColor = Color(0xff000029);
const kTextInputPlaceholderColor = Color(0XFF241332);
const kCursorColor = Color(0XFFD47FA6);
const kTransparent = Colors.transparent;
const kGreenColor = Color(0xFF3AAA35);
const ksearchTextColor = Color(0xFF43552E);
const kSelectedColor = Color(0xFF374750);
const ksubHading = Color(0XFF998FA2);
const kDateCircleColor = Color(0xFFF0EAE1);
const kStartDateColor = Color(0xFF4D3E56);
const kStartDatrCicleColor = Color(0xFFF1E4E4);
const kAddressTextColor = Color(0xFFDDDDDD);
const kbg2 = Color(0xfff6f1f1);
const kdarkpurple = Color(0xFF5F4591);
const carhealthColor1 = Color(0xFFB07DD1);
const carhealthColor2 = Color(0xFF4F8DCB);
const carhealthColor3 = Color(0xFF5F4591);
const carhealthColor4 = Color(0xFF9599B3);
const kgrey = Color(0xFF4B516B);
const knewstextbrif = Color(0xff817889);
const kscaffoldcolor = Color(0xFFFBF9F9);
const kcardColor = Color(0xffF5EAEA);

const Widget loder = Center(
  child: CircularProgressIndicator.adaptive(),
);

Widget loder2 = Expanded(
    child: Container(
        color: kTransparent,
        child: Padding(
          padding: Platform.isIOS
              ? const EdgeInsets.only(bottom: 100.0)
              : const EdgeInsets.only(bottom: 150.0),
          child: loder,
        )));

class CarsData {
  static String city = "";
  static String name = "";
  static String brand = "";
  static String brandimage = "";
  static String carimage = "";
  static String cityimage = "";
  static String fuel = "";
  static String fuelimage = "";
}

class Ids {
  static String categoryid = "";
  static String subcategoryid = "";
  static String planid = "";
  static String slotid = "";
  static String fuelid = "";
  static String cartid = "";
  static String userid = "";
  static String orderid = "";
  static String cityid = "";
  static String carid = "";
  static String brandid = "";
}
