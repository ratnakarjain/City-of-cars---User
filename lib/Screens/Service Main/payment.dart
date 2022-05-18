import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Services/models/paymentmodel.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/Shapes/widgets.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'orderSuccessfull.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var h;
  var w;
  List<PaymentModel> list = [];
  ScrollController _scrollController = ScrollController();
  TextEditingController special = TextEditingController();
  bool istap = false;
  @override
  void initState() {
    // TODO: implement initState
    proceed().then((value) {
      List data = [];
      data.addAll(value);
      for (int i = 0; i < data.length; i++) {
        PaymentModel med = PaymentModel();
        med.planname = data[i]["Plans"]["planName"].toString();
        med.price = data[i]["Plans"]["typeprice"].toString();
        med.hour = data[i]["Plans"]["hours"].toString();
        med.month = data[i]["Plans"]["month"].toString();
        med.plotStreet = data[i]["bookingdata"]["House"].toString() +
            " " +
            data[i]["bookingdata"]["Street"].toString();
        med.cityCode = data[i]["bookingdata"]["state"].toString() +
            " - " +
            data[i]["bookingdata"]["pincode"].toString();
        med.option = data[i]["bookingdata"]["optional"].toString();
        med.contect = data[i]["bookingdata"]["contect"].toString();
        med.name = data[i]["bookingdata"]["name"].toString();
        med.carno = data[i]["bookingdata"]["carno"].toString();
        list.add(med);
        setState(() {
          
        });
        // print(list);
      }
      
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightOrangeBgColor,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        elevation: 0,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "Payment",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          child: Column(
            children: [
              list.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.03),
                      child: loder,
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: list.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        PaymentModel data = PaymentModel();
                        data = list[index];
                        return Container(
                          padding: EdgeInsets.only(bottom: h * 0.02),
                          child: Column(
                            children: [
                              RRectCard(
                                h: h * 0.1,
                                color: kwhitecolor,
                                shadowColor:
                                    kTextInputPlaceholderColor.withOpacity(0.1),
                                w: w,
                                widget: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: w * .07),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.planname,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    kTextInputPlaceholderColor),
                                          ),
                                          Text(
                                            "Takes ${data.hour} Hrs / Every ${data.month} months",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    kTextInputPlaceholderColor
                                                        .withOpacity(0.5)),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            data.price,
                                            // "₹2700",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    kTextInputPlaceholderColor),
                                          ),
                                          Text(
                                            "Incl. Taxes",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 7,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    kTextInputPlaceholderColor
                                                        .withOpacity(0.5)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                borderRadius: h * 0.02,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.01),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: RRectCard(
                                        h: h * 0.12,
                                        w: w,
                                        widget: Padding(
                                          padding:
                                              EdgeInsets.only(left: w * 0.05),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                  text: "Name",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11,
                                                      height: 2,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ksubHading),
                                                  children: [
                                                    TextSpan(
                                                        text: "- ${data.name}",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 2,
                                                                color:
                                                                    ksubHading)),
                                                  ],
                                                )),
                                                RichText(
                                                    text: TextSpan(
                                                  text: "Contact",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11,
                                                      height: 2,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ksubHading),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            " - ${data.contect}",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 11,
                                                                height: 2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    ksubHading)),
                                                  ],
                                                )),
                                                RichText(
                                                    text: TextSpan(
                                                  text: "Car",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11,
                                                      height: 2,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ksubHading),
                                                  children: [
                                                    TextSpan(
                                                        text: " - Hyundai i20",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                height: 2,
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    ksubHading)),
                                                  ],
                                                )),
                                              ]),
                                        ),
                                        borderRadius: h * 0.02,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: RRectCard(
                                        h: h * 0.12,
                                        w: w,
                                        widget: Padding(
                                          padding:
                                              EdgeInsets.only(left: w * 0.05),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                  text: "Delivery Date",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ksubHading),
                                                  children: [
                                                    TextSpan(
                                                        text: " - 27th Oct",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    ksubHading)),
                                                  ],
                                                )),
                                                RichText(
                                                    text: TextSpan(
                                                  text: "Address",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11,
                                                      height: 2,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ksubHading),
                                                  children: [
                                                    TextSpan(
                                                        text: " - 2007",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 11,
                                                                height: 2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    ksubHading)),
                                                  ],
                                                )),
                                                RichText(
                                                    text: TextSpan(
                                                  text: "Email",
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11,
                                                      height: 2,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ksubHading),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            " - cityofcars.in",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 11,
                                                                height: 2,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    ksubHading)),
                                                  ],
                                                )),
                                              ]),
                                        ),
                                        borderRadius: h * 0.02,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              RRectCard(
                                // h: h * 0.1,
                                w: w,
                                widget: Padding(
                                  padding: EdgeInsets.only(left: w * 0.05),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                        text: "Address",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 11,
                                            height: 2,
                                            fontWeight: FontWeight.w700,
                                            color: ksubHading),
                                        children: [
                                          TextSpan(
                                              text:
                                                  " ${data.plotStreet}, \n${data.cityCode} \n${data.option}",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 11,
                                                  height: 2,
                                                  fontWeight: FontWeight.w500,
                                                  color: ksubHading)),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                                borderRadius: h * 0.02,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
              RRectCard(
                // h: h * 0.1,
                w: w,
                widget: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.05, vertical: h * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                        text: "Special Remark / Additional Jobs",
                        style: GoogleFonts.montserrat(
                            fontSize: 11,
                            height: 2,
                            fontWeight: FontWeight.w700,
                            color: ksubHading),
                      )),
                      TextFormField(
                        controller: special,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )
                    ],
                  ),
                ),
                borderRadius: h * 0.02,
              ),
              SizedBox(
                height: h * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child:istaped?loder: RRecctButton(
                  onTap: () {
                    istaped=true;
                    setState(() {
                      
                    });
                    addorder().then((value) {
                      print(value["_id"]+"1234567890987654321");
                      String _id = value["_id"];
                      
                      istaped=false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderSuccessful(id: _id),
                          ));
                          
                    });
                    setState(() {});
                  },
                  text: "Pay now".toUpperCase(),
                  h: h * 0.07,
                  buttonColor: kbluecolor,
                  style: GoogleFonts.montserrat(
                      color: kwhitecolor, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: RRecctButton(
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

                    istaped=false;
                    setState(() {
                      
                    });
                  },
                  text: "PAY ON DROP-OFF".toUpperCase(),
                  h: h * 0.07,
                  buttonColor: korangecolor,
                  style: GoogleFonts.montserrat(
                      color: kwhitecolor, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: h * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
