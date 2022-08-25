// ignore_for_file: deprecated_member_use
import 'dart:convert';

import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cityofcars/Screens/selectCity.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'dart:convert' as convert;
import '../Services/models/usercardetailsmodel.dart';
import '../Services/url.dart';
import '../Utils/Buttons/button.dart';
import 'bottomnavBar.dart';

class Verfication extends StatefulWidget {
  bool toLogin;
  String mobile;
  Verfication({Key? key, required this.toLogin,required this.mobile}) : super(key: key);

  @override
  State<Verfication> createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var h;
  var w;
  bool istaped = false;
  var pref = Prefernece.pref;
  var _controller = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 70,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: const Color(0XFFF1F0F2),
      borderRadius: BorderRadius.circular(20),
    ),
  );
@override
  void initState() {
    token() {
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("token: " + value.toString());
      var tokenId = value.toString();
      Prefernece.pref!.setString("fcmtoken", tokenId);

      print("new token: " + Prefernece.pref!.getString("fcmtoken").toString());
    });
  }
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text("Verification Code",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
        foregroundColor: kblackcolor,
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            SizedBox(
              height: h * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Pinput(
                controller: _controller,
                forceErrorState: true,
                defaultPinTheme: defaultPinTheme,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ],
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
                  borderRadius: BorderRadius.circular(8),
                ),
                pinAnimationType: PinAnimationType.fade,
              ),
            ),
            GestureDetector(
              onTap: () {
                resendotp(widget.mobile,context);
                // _scaffoldKey.currentState!.showSnackBar(
                //     const SnackBar(content: Text("OTP resent successfully")));
              },
              child: Text(
                "Resend code",
                style: GoogleFonts.montserrat(
                    color: kbluecolor, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            istaped
                ? loder
                : RRecctButton(
                    text: "CONTINUE",
                    h: h * 0.07,
                    w: w * 0.88,
                    buttonColor: korangecolor,
                    style: GoogleFonts.montserrat(
                        color: kwhitecolor, fontWeight: FontWeight.w600),
                    onTap: _controller.text.isEmpty
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Please enter otp first")));
                          }
                        : () async {
                            istaped = true;
                            getusercars().then((value) {
                              modellist.clear();
                              modellist.addAll(value);
                              Prefernece.pref!.setString(
                                  "usercarsData", jsonEncode(modellist));
                              // print(jsonEncode(modellist));
                              // print(modellist);
                              if (isSelected == 0) {
                                isSelected = 1;
                              }
                              Prefernece.pref!.setString("brandId",
                                  modellist[0].carbrandid.toString());
                              Prefernece.pref!.setString(
                                  "CarId", modellist[0].carid.toString());
                              Prefernece.pref!.setString(
                                  "cityId", modellist[0].cityid.toString());
                              Prefernece.pref!.setString(
                                  "fuelId", modellist[0].carfuelid.toString());
                              // Ids.brandid = ;
                              // Ids.carid = modellist[0].carid.toString();
                              // Ids.cityid = modellist[0].cityid.toString();
                              // Ids.fuelid = modellist[0].carfuelid.toString();
                            }).whenComplete(() {
                              verify().whenComplete(() {
                                istaped = false;
                                setState(() {});
                                sendfcm();
                              });
                            });

                            setState(() {});
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: ((context) => SelectCity())));
                          },
                  ),
          ],
        ),
      ),
    );
  }

  Future verify() async {
    var url = Uri.parse(verification);
    try {
      var response = await http.post(url, body: {
        'otp': _controller.text,
      }, headers: {
        "Authorization": prefs!.getString('token').toString()
      });
      if (response.statusCode == 200) {
        print("success");
        var jsonResponse = convert.jsonDecode(response.body);
        if (jsonResponse["status"] == true) {
//  Navigator.push(context,
//                     MaterialPageRoute(builder: ((context) => SelectCity())));
          pref!.setString("userId", Ids.userid);
          print(pref!.getString("userId").toString() + "===========");
          //  await getusercarsdata(true).whenComplete(() {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => widget.toLogin
                  ? BottomNavBar(
                      index: 0,
                    )
                  : SelectCity(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
          // });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(jsonResponse["message"]),
          ));
        }

        return response.body;
      } else {
        var jsonResponse = convert.jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(jsonResponse["message"]),
        ));
      }
    } catch (e) {
      print("error $e");
    }
//     verifyOtp(_controller.text).then(
//       (value) {
// Navigator.push(context,
//                     MaterialPageRoute(builder: ((context) => SelectCity())));
//       }).catchError((e){
//         print("error $e");
//       });
  }
}
