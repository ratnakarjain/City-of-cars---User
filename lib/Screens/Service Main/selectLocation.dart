import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({ Key? key }) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
     h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "Select Location",
          style: GoogleFonts.montserrat(
            fontSize: 21,
            fontWeight: FontWeight.w700
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(h*0.06),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: w*0.06),
                        height: h * 0.055,
                        margin: EdgeInsets.only(top: h * 0.02, bottom: 0.01),
                        child: TextFormField(
                          cursorColor: korangecolor,
                          decoration: InputDecoration(
                              hintText: "Enter pick-up location",
                              hintStyle: GoogleFonts.montserrat(fontSize: 13),
                              suffixIcon: const Icon(Icons.search),
                              fillColor: korangecolor,
                              focusColor: korangecolor,
                              suffixIconColor: korangecolor,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: korangecolor, width: 1.0),
                                  borderRadius:
                                      BorderRadius.circular(h * 0.02)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(h * 0.02))),
                        ),
                      ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: h*0.01),
        height: h,
        width: w,
        color: kLightOrangeBgColor,
      ),
    );
  }
}