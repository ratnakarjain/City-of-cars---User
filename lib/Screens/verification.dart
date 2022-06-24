// ignore_for_file: deprecated_member_use
import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Utils/preference.dart';
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
import '../Services/url.dart';
import '../Utils/Buttons/button.dart';
import 'bottomnavBar.dart';

class Verfication extends StatefulWidget {
  bool toLogin;
   Verfication({Key? key,required this.toLogin }) : super(key: key);

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
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text("Verfication Code",
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
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9]")),
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
                _scaffoldKey.currentState!.showSnackBar(
                    const SnackBar(content: Text("OTP resent successfully")));
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
                    onTap:_controller.text.isEmpty?(){}: () {
                      istaped = true;

                      if(_controller.text.toString().isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter otp first")));
                        return ;
                      }
                      verify().whenComplete(() {
                        istaped = false;
                        setState(() {});
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
         print(pref!.getString("userId").toString()+"===========");
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => widget.toLogin?BottomNavBar(index: 0,): SelectCity(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(jsonResponse["message"]),
          ));
        }

        return response.body;
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
