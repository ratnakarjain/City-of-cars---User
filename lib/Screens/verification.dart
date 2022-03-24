import 'package:cityofcars/Screens/selectCity.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../Utils/Buttons/button.dart';


class Verfication extends StatefulWidget {
  const Verfication({Key? key}) : super(key: key);

  @override
  State<Verfication> createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
  var h;
  var w;
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
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
                  borderRadius: BorderRadius.circular(8),
                ),
                pinAnimationType: PinAnimationType.fade,
              ),
            ),
            Text(
              "Resend code",
              style: GoogleFonts.montserrat(
                  color: kbluecolor, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            RRecctButton(
              text: "CONTINUE",
              h: h * 0.07,
              w: w * 0.88,
              buttonColor: korangecolor,
              style: GoogleFonts.montserrat(
                  color: kwhitecolor, fontWeight: FontWeight.w600),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => SelectCity())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
