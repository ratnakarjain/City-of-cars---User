import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Services/models/orderhistoryModel.dart';
import '../Utils/Buttons/button.dart';
import '../Utils/constants.dart';

class FeedBack extends StatefulWidget {
  OrderHistoryModel order = OrderHistoryModel();
  FeedBack({Key? key, required this.order}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  var h;
  var w;
  List topServices = [
    {
      "type": "Service Quality",
      "subtype": "pick-up and drop off",
    },
    {
      "type": "Expert Behaviour",
      "subtype": "The way we made you feel",
    },
    {
      "type": "On-Time",
      "subtype": "pick-up and drop off",
    },
    {
      "type": "Quality Spares",
      "subtype": "pick-up and drop off",
    },
  ];
  int isSelected = 0;
  int rating = 0;
  bool onTapload = false;
  TextEditingController optional = TextEditingController();
  var _controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg3,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "Feedback",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: kwhitecolor,
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.02, vertical: h * 0.01),
                margin: EdgeInsets.only(top: h * 0.02),
                child: Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "DELIVERY DATE: ",
                            style: GoogleFonts.montserrat(
                                fontSize: 8, color: kSelectedColor),
                            children: [
                          TextSpan(
                            text: widget.order.deliverydate.toString() == "null"
                                ? "\n"
                                : DateFormat.MMMMd().format(DateTime.parse(
                                        widget.order.deliverydate.toString())) +
                                    "\n",
                            // " 27th Oct\n",
                            style: GoogleFonts.montserrat(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                color: kSelectedColor),
                          ),
                          TextSpan(
                            text: "BOOKING ID: ",
                            style: GoogleFonts.montserrat(
                                fontSize: 8, color: kSelectedColor),
                          ),
                          TextSpan(
                            text: widget.order.orderid,
                            style: GoogleFonts.montserrat(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                color: kSelectedColor),
                          )
                        ])),
                    Image.network(
                      widget.order.carimage,
                      height: h * 0.06,
                    ),
                    RichText(
                        text: TextSpan(
                            text: widget.order.carname + " ",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: kSelectedColor,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                          TextSpan(
                            text: widget.order.carbrand,
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kSelectedColor),
                          ),
                        ])),
                    Text(
                      "Rate your overall experience",
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w400, height: 3),
                    ),
                    Container(
                      height: h * 0.05,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              rating = index + 1;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.star,
                              color: rating > index
                                  ? korangecolor
                                  : const Color(0xffdbd0bf),
                              size: h * 0.04,
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w * 0.05,
                        ),
                        Text(
                          "What did you like the most about us?",
                          style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              height: 3),
                        )
                      ],
                    ),
                    GridView.count(
                      padding: EdgeInsets.symmetric(vertical: h * 0.03),
                      shrinkWrap: true,
                      controller: _controller,
                      crossAxisSpacing: w * 0.02,
                      mainAxisSpacing: h * 0.01,
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      children: List.generate(
                          topServices.length,
                          (index) => InkWell(
                                onTap: () {
                                  isSelected = index + 1;
                                  setState(() {});
                                },
                                child: RRectCard(
                                  h: h * 0.06,
                                  w: w * 0.45,
                                  color: isSelected == index + 1
                                      ? kGreenColor
                                      : kbg2,
                                  widget: Center(
                                    child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text:
                                                "${topServices[index]["type"]}\n",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              color: isSelected == index + 1
                                                  ? kwhitecolor
                                                  : kTextInputPlaceholderColor
                                                      .withOpacity(0.9),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${topServices[index]["subtype"]}",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w400,
                                                    color: isSelected ==
                                                            index + 1
                                                        ? kwhitecolor
                                                        : kTextInputPlaceholderColor
                                                            .withOpacity(0.32)),
                                              ),
                                            ])),
                                  ),
                                  borderRadius: h * 0.05,
                                ),
                              )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.07),
                child: Text(
                  "How can we improve?",
                  style: GoogleFonts.montserrat(
                      fontSize: 13, fontWeight: FontWeight.w700, height: 3),
                ),
              ),
              Container(
                height: h * 0.13,
                width: w,
                margin: EdgeInsets.only(
                    top: h * 0.015, left: w * 0.03, right: w * 0.03),
                decoration: BoxDecoration(
                    color: kwhitecolor,
                    borderRadius: BorderRadius.circular(h * 0.025),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                          color: kTextInputPlaceholderColor.withOpacity(0.1))
                    ]),
                child: TextFormField(
                  controller: optional,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Optional",
                      hintStyle: GoogleFonts.montserrat(fontSize: 13),
                      contentPadding: EdgeInsets.all(h * 0.01)),
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              onTapload
                  ? loder
                  : Center(
                      child: RRecctButton(
                        h: h * 0.06,
                        w: w * 0.9,
                        onTap: () async {
                          if (rating == 0 ||
                              optional.text.isEmpty ||
                              isSelected <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 2),
                              content: Text("Please fill all details"),
                            ));
                          } else {
                            onTapload = true;
                            setState(() {});
                            await feedback(
                                    rating.toString(),
                                    optional.text,
                                    widget.order.id,
                                    topServices[isSelected - 1]["type"])
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(value["message"]),
                              ));
                            }).whenComplete(() {
                              Future.delayed(const Duration(seconds: 3), () {
                                print('One second has passed.');
                                Navigator.pop(
                                    context); // Prints after 1 second.
                              });
                              onTapload = false;
                              setState(() {});
                            });
                          }
                        },
                        buttonColor: kbluecolor,
                        text: "SEND FEEDBACK",
                        style: GoogleFonts.montserrat(
                            color: kwhitecolor, fontWeight: FontWeight.w600),
                      ),
                    ),
              SizedBox(
                height: h * 0.03,
              )
            ],
          ),
        ),
      ),
    );
  }
}
