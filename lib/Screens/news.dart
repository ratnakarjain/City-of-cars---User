import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/constants.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List textExtended = [];
  List isSelected = [];
  var h;
  var w;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generate1();
    generate2();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kwhitecolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "News",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(4, (index) {
            return Container(
              decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(h * 0.1)),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5, offset: Offset(0, 7), color: Colors.grey)
                  ]),
              margin: EdgeInsets.only(bottom: h * 0.015),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isSelected[index]) {
                        isSelected[index] = !isSelected[index];
                      } else {
                        if (textExtended[index]) {
                          generate1();
                          isSelected[index] = !isSelected[index];
                        } else {
                          generate1();
                          generate2();
                          isSelected[index] = !isSelected[index];
                        }
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected[index] ? kbluecolor : kTransparent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(h * 0.05)),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.1, vertical: h * 0.03),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Best and he bestest cars in India",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: isSelected[index]
                                          ? kwhitecolor
                                          : kTextInputPlaceholderColor,
                                    ),
                                  ), 
                                  Text(
                                    "8 hrs",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: isSelected[index]
                                          ? kwhitecolor
                                          : kTextInputPlaceholderColor,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                isSelected[index]
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: isSelected[index]
                                    ? kwhitecolor
                                    : kTextInputPlaceholderColor,
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (textExtended[index]) {
                                textExtended[index] = !textExtended[index];
                              } else {
                                if (isSelected[index]) {
                                  generate2();
                                  textExtended[index] = !textExtended[index];
                                } else {
                                  generate1();
                                  generate2();
                                  textExtended[index] = !textExtended[index];
                                }
                              }

                              setState(() {});
                            },
                            child: textExtended[index]
                                ? Container(
                                    margin: EdgeInsets.only(top: h * 0.03),
                                    child: Text(
                                      "When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: isSelected[index]
                                            ? kwhitecolor
                                            : kTextInputPlaceholderColor,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: h * 0.02,
                                    margin: EdgeInsets.only(top: h * 0.03),
                                    child: Text(
                                      "When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: isSelected[index]
                                            ? kwhitecolor
                                            : kTextInputPlaceholderColor,
                                      ),
                                    ),
                                  ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      h * 0.06,
                                    ),
                                    topLeft: Radius.circular(h * 0.015),
                                    bottomRight: Radius.circular(h * 0.015),
                                    bottomLeft: Radius.circular(h * 0.06)),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/news1.png"),
                                    fit: BoxFit.fill)),
                            margin: EdgeInsets.symmetric(vertical: h * 0.03),
                            height: h * 0.14,
                            // child: Image.asset("assets/images/news1.png")
                          )
                        ],
                      ),
                    ),
                  ),
                  isSelected[index]
                      ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.1,
                          ),
                          margin:
                              EdgeInsets.only(top: h * 0.01, bottom: h * 0.07),
                          child: Text(
                            "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going.",
                            style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: knewstextbrif,
                                height: 1.5),
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          })),
        ),
      ),
    );
  }

  generate1() {
    isSelected = List.generate(10, (index) => false);
  }

  generate2() {
    textExtended = List.generate(10, (index) => false);
  }
}
