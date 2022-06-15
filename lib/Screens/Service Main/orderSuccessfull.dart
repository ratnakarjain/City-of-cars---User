import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../bottomnavBar.dart';
import '../tracking.dart';

class OrderSuccessful extends StatefulWidget {
  String id;
  OrderSuccessful({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderSuccessful> createState() => _OrderSuccessfulState();
}

class _OrderSuccessfulState extends State<OrderSuccessful> {
  var h;
  var w;
  var data;
  ScrollController _controller = ScrollController();
  int rate = 0;
  @override
  void initState() {
    // TODO: implement initState
    Ids.orderid = widget.id;
    print(Ids.orderid+" +++++++++++");
    ordersuccess(widget.id).then((value) {
      data = value;
      print(data);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ordersuccess(widget.id).then((value) {
      data = value;
      print("====="+data.toString());
      print("====="+data["orderData"].first["bookingdata"]["name"]);
      // setState(() {});
    });
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: ()async{
        await Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (builder)=>  BottomNavBar(index: 0,)), (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: kwhitecolor,
        appBar: AppBar(
          backgroundColor: kwhitecolor,
          foregroundColor: kTextInputPlaceholderColor,
          elevation: 0,
          leading: BackButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (builder)=> BottomNavBar(index: 0)), (route) => false);
            },
          ),
          title: Text(
            "Order Successful",
            style:
                GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
          ),
        ),
        body: data == null
            ? loder
            : Container(
                height: h,
                width: w,
                child: Column(
                  children: [
                    Container(
                      height: h * 0.3,
                      width: w,
                      margin: EdgeInsets.symmetric(horizontal: h * 0.055),
                      decoration: const BoxDecoration(
                        color: kwhitecolor,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/bg1.png",
                            ),
                            fit: BoxFit.fill),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/images/right.png",
                            height: h*0.08,
                          ),
                          SizedBox(
                            height: h*0.02,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "BOOKING ID:",
                                style: GoogleFonts.montserrat(
                                    color: kTextInputPlaceholderColor,
                                    fontSize: 8),
                                children: [
                                  TextSpan(
                                    text: " ${data["orderid"]}\n",
                                    style: GoogleFonts.montserrat(
                                        color: kTextInputPlaceholderColor,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: "Congratulations!\n",
                                    style: GoogleFonts.montserrat(
                                        height: 2,
                                        color: kTextInputPlaceholderColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text:
                                        "Your order has been successfully placed!",
                                    style: GoogleFonts.montserrat(
                                        color: kTextInputPlaceholderColor,
                                        height: 2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Rate your experience",
                                style: GoogleFonts.montserrat(
                                    color: kTextInputPlaceholderColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            rate = index + 1;
                                            rating(rate.toString())
                                                .then((value) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content:
                                                    Text(value.toString()),
                                              ));
                                            });
                                            setState(() {

                                            });
                                          },
                                          child:  Icon(Icons.star,
                                              color:rate>=index+1?korangecolor: kDateCircleColor, size: 14),
                                        )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: w,
                      color: kLightOrangeBgColor,
                      padding: EdgeInsets.all(h * 0.02),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: "Confirmation will be sent on your mail\n",
                            style: GoogleFonts.montserrat(
                                color: kTextInputPlaceholderColor, fontSize: 13),
                            children: [
                              TextSpan(
                                text:
                                    "Pick-up from ${data["orderData"].first["bookingdata"]["name"]}",
                                style: GoogleFonts.montserrat(
                                    color: kbluecolor,
                                    fontSize: 13,
                                    height: 3,
                                    fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text:
                                    " ${data["orderData"].first["bookingdata"]["houseNo"]}, ${data["orderData"].first["bookingdata"]["Street"]}, ${data["orderData"].first["bookingdata"]["state"]} - ${data["orderData"].first["bookingdata"]["pincode"]}\n\n",
                                style: GoogleFonts.montserrat(
                                    height: 1,
                                    color: kTextInputPlaceholderColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text:
                                    "${DateFormat.MMMd().format(DateTime.parse(data["orderData"].first['bookingdata']["date"]))}, ${data["orderData"].first['bookingdata']["time"]}\n",
                                style: GoogleFonts.montserrat(
                                    color: kGreenColor,
                                    height: 2,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: "pick-up date\n\n",
                                style: GoogleFonts.montserrat(
                                    color: kTextInputPlaceholderColor,
                                    height: 1.5,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              )
                            ]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: h * 0.02),
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.03, vertical: h * 0.01),
                      decoration: BoxDecoration(color: kwhitecolor, boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            offset: Offset(0, 2),
                            color: kTextInputPlaceholderColor.withOpacity(0.1)),
                      ]),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                RRectCard(
                                    h: h * 0.07,
                                    w: w * 0.2,
                                    color: kbluecolor,
                                    borderRadius: h * 0.03,
                                    widget: RRectCard(
                                        h: h * 0.1,
                                        w: w * 0.3,
                                        borderRadius: h * 0.025,
                                        widget: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(h * 0.05),
                                            child: Padding(
                                              padding: EdgeInsets.all(h * 0.01),
                                              child: Image.network(
                                                
                                                data["orderData"].first["cars"]["image"],
                                              ),
                                            )))),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text:   data["orderData"].first["cars"]["cars"],
                                      style: GoogleFonts.montserrat(
                                          color: kTextInputPlaceholderColor,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          fontSize: 8),
                                      children: [
                                        TextSpan(
                                          text:   " ${data["orderData"].first["brands"]["brands"]}\n",
                                          style: GoogleFonts.montserrat(
                                              color: kTextInputPlaceholderColor,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5,
                                              fontSize: 8),
                                        ),
                                        TextSpan(
                                          text: data["orderData"].first["bookingdata"]["carno"].toUpperCase(),
                                          style: GoogleFonts.montserrat(
                                              color: kTextInputPlaceholderColor,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5,
                                              fontSize: 6),
                                        ),
                                        // TextSpan(
                                        //   text: " 9733",
                                        //   style: GoogleFonts.montserrat(
                                        //       color: kTextInputPlaceholderColor,
                                        //       fontWeight: FontWeight.w700,
                                        //       height: 1.5,
                                        //       fontSize: 6),
                                        // )
                                      ]),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // RichText(
                                    //   textAlign: TextAlign.center,
                                    //   text: TextSpan(
                                    //       text: "Delivery Date",
                                    //       style: GoogleFonts.montserrat(
                                    //           color: kTextInputPlaceholderColor
                                    //               .withOpacity(0.5),
                                    //           fontWeight: FontWeight.w700,
                                    //           height: 1.5,
                                    //           fontSize: 9),
                                    //       children: [
                                    //         TextSpan(
                                    //           text: "  - 27th Oct",
                                    //           style: GoogleFonts.montserrat(
                                    //               color:
                                    //                   kTextInputPlaceholderColor
                                    //                       .withOpacity(0.5),
                                    //               fontWeight: FontWeight.w400,
                                    //               height: 1.5,
                                    //               fontSize: 9),
                                    //         ),
                                    //       ]),
                                    // ),
                                    SizedBox(),
                                    RRecctButton(
                                      text: "In-Progress",
                                      h: h * 0.03,
                                      w: w * 0.3,
                                      style: GoogleFonts.montserrat(
                                          color: kwhitecolor,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5,
                                          fontSize: 9),
                                      buttonColor: korangecolor,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: data["orderData"].first["category"]["title"]+ "\n",
                                          style: GoogleFonts.montserrat(
                                              color: kTextInputPlaceholderColor
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                              fontSize: 7),
                                          children: [
                                            TextSpan(
                                              text: data["orderData"].first["category"]["discreption"],
                                              style: GoogleFonts.montserrat(
                                                  color:
                                                      kTextInputPlaceholderColor
                                                          .withOpacity(0.5),
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  fontSize: 5),
                                            ),
                                          ]),
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: "${data["orderData"].first["subcategory"]["title"] }\n",
                                          style: GoogleFonts.montserrat(
                                              color: kTextInputPlaceholderColor
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                              fontSize: 7),
                                          children: [
                                            TextSpan(
                                              text: data["orderData"].first["subcategory"]["discreption"],
                                              style: GoogleFonts.montserrat(
                                                  color:
                                                      kTextInputPlaceholderColor
                                                          .withOpacity(0.5),
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  fontSize: 5),
                                            ),
                                          ]),
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: "${data["orderData"].first["selectplan"].first["planName"]}\n",
                                          style: GoogleFonts.montserrat(
                                              color: kTextInputPlaceholderColor
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                              fontSize: 7),
                                          children: [
                                            TextSpan(
                                              text: data["orderData"].first["selectplan"].first["subPlanName"],
                                              style: GoogleFonts.montserrat(
                                                  color:
                                                      kTextInputPlaceholderColor
                                                          .withOpacity(0.5),
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  fontSize: 5),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(),
                                    SizedBox(),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    RRecctButton(
                      text: "CONTINUE SHOPPING",
                      onTap: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => BottomNavBar(
                              index: 0,
                            ),
                          ),
                          (route) =>
                              false, //if you want to disable back feature set to false
                        );
                      },
                      h: h * 0.06,
                      w: w * 0.8,
                      style: GoogleFonts.montserrat(
                          color: kwhitecolor,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          fontSize: 13),
                      buttonColor: kbluecolor,
                    ),
                    RRecctButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Tracking(),
                            ));
                      },
                      text: "Track your order here",
                      h: h * 0.05,
                      w: w * 0.8,
                      style: GoogleFonts.montserrat(
                          color: kTextInputPlaceholderColor,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          fontSize: 13),
                      buttonColor: kTransparent,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
