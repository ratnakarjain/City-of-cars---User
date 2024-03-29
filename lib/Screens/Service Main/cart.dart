import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Screens/Service%20Main/payment.dart';
import 'package:cityofcars/Screens/Service%20Main/slot.dart';
import 'package:cityofcars/Screens/bottomnavBar.dart';
import 'package:cityofcars/Services/models/plansModel.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Services/servies.dart';
import '../../Utils/Buttons/button.dart';

class Cart extends StatefulWidget {
  static Packes packe = Packes();
  bool getcart;
  Cart({Key? key, required this.getcart}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var h;
  var w;
  String dropdownvalue = '';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];
  int dropvalue = 0;
  List data = [];
  String _null = "";
  double subtotal = 0;
  int whichindex = 0;
  ScrollController _scrollController = ScrollController();
  bool isloading = false;
  @override
  void initState() {
    // TODO: implement initState
    if (!widget.getcart) {
      fecthdata().whenComplete(() {
        if (data.isNotEmpty) {
          for (int i = 0; i < data.length; i++) {
            print("typeprice " +
                data[i]["selectplan"][0]["typeprice"].toString() +
                "^^");
            totalvalue(
                double.parse(data[i]["selectplan"][0]["typeprice"].toString()));
          }
          setState(() {});
        }
      });
    } else {
      getcartitems().then((value) {
        print("done" + value.toString());

        data.addAll(value);
        print("entering");
        if (data.isEmpty) {
          // _null = "You have nothing in Cart. Please add...";
          _null = "Your cart is empty.";
          print(_null);
          setState(() {});
        } else {
          _null = "";
          setState(() {});
        }
        print(data.toString() + "============");
        // for(int i=0; i<data.length; i++){
        //   plan=data[i]["Plans"];
        //   print(plan.toString()+"+++++++++++=====");
        // }
        //       service.addAll(value);
        //            print("================="+service.toString());
        // print("================="+service[0]["title"].toString());
      }).whenComplete(() {
        if (data.isNotEmpty) {
          for (int i = 0; i < data.length; i++) {
            print("typeprice " +
                data[i]["selectplan"][0]["typeprice"].toString() +
                "^^");
            totalvalue(
                double.parse(data[i]["selectplan"][0]["typeprice"].toString()));
          }
          setState(() {});
        }
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: widget.getcart
          ? () async {
              return true;
            }
          : () async {
              await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => BottomNavBar(
                            index: 0,
                          )),
                  (route) => false);
              return true;
            },
      child: Scaffold(
        backgroundColor: kbg3,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kwhitecolor,
          centerTitle: false,
          foregroundColor: kblackcolor,
          title: Text(
            "Cart",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: data.isEmpty
                    ? _null != ""
                        ? Center(
                            child: Text(_null),
                          )
                        : loder
                    : ListView.builder(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return isloading && index == whichindex
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: loder,
                                )
                              : Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      dropvalue = 0;
                                      setState(() {});
                                    },
                                    child: Container(
                                      // height: dropvalue == index + 1
                                      //     ? h * 0.35
                                      //     : h * 0.18,
                                      decoration: BoxDecoration(
                                          color: kwhitecolor,
                                          borderRadius: BorderRadius.only(
                                              topLeft:
                                                  Radius.circular(h * 0.015),
                                              bottomLeft:
                                                  Radius.circular(h * 0.015))),
                                      margin: EdgeInsets.only(
                                        top: h * 0.018,
                                        left: w * 0.02,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.06,
                                                vertical: h * 0.01),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      data[index]["Plans"]
                                                              ["plan"][0]
                                                          ["planName"],
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      // "Service Pack",
                                                      data[index]["Plans"]
                                                              ["plan"][1]
                                                          ["planName"],
                                                      style: GoogleFonts.montserrat(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              kTextInputPlaceholderColor
                                                                  .withOpacity(
                                                                      0.6)),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "₹" +
                                                          data[index]["selectplan"]
                                                                      [0]
                                                                  ["typeprice"]
                                                              .toString(),
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Incl. Taxes",
                                                      style: GoogleFonts.montserrat(
                                                          fontSize: 7,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              kTextInputPlaceholderColor
                                                                  .withOpacity(
                                                                      0.48)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: w * 0.08,
                                                bottom: h * 0.01),
                                            child: Text(
                                              "Takes ${data[index]["Plans"]["hours"]} Hrs / Every ${data[index]["Plans"]["month"] ?? ""} Months",
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 7,
                                                  color:
                                                      kTextInputPlaceholderColor
                                                          .withOpacity(0.6)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.06),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Visibility(
                                                    visible:
                                                        dropvalue != index + 1,
                                                    child: Expanded(
                                                      flex: 3,
                                                      child: GestureDetector(
                                                        onTap: data[index]["Plans"]
                                                                        [
                                                                        "services_id"]
                                                                    .length <=
                                                                3
                                                            ? () {}
                                                            : () {
                                                                dropvalue =
                                                                    index + 1;

                                                                setState(() {});
                                                              },
                                                        child: Container(
                                                          color:
                                                              kLightOrangeBgColor,
                                                          height: h * 0.055,
                                                          width: w * 0.6,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right:
                                                                      w * 0.03),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  h * 0.005),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                  // key: keys[index],
                                                                  width:
                                                                      w * 0.55,
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Center(
                                                                              child: ListView.builder(
                                                                                itemCount: data[index]["Plans"]["services_id"].length > 3 ? 3 : data[index]["Plans"]["services_id"].length,
                                                                                scrollDirection: Axis.horizontal,
                                                                                shrinkWrap: true,
                                                                                physics: const NeverScrollableScrollPhysics(),
                                                                                itemBuilder: (context, indexx) {
                                                                                  return Container(
                                                                                    width: data[index]["Plans"]["services_id"].length > 3 ? w * 0.14 : w * 0.16,
                                                                                    padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        CachedNetworkImage(
                                                                                          fit: BoxFit.fill,
                                                                                          height: h * 0.025,
                                                                                          imageUrl: data[index]["Plans"]["services_id"][indexx]["image"].toString(),
                                                                                          placeholder: (context, url) => Container(),
                                                                                          errorWidget: (context, url, error) => Image.network("https://i.gifer.com/DKke.gif"),
                                                                                        ),
                                                                                        // Image.asset(
                                                                                        //   "assets/images/EngineOil.png",
                                                                                        //   height: h * 0.03,
                                                                                        // ),
                                                                                        Text(
                                                                                          data[index]["Plans"]["services_id"][indexx]["title"] ?? "",
                                                                                          // "Engine Oil ",
                                                                                          // textScaleFactor: 0.7,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          style: GoogleFonts.montserrat(fontSize: 8, fontWeight: FontWeight.w600, color: kTextInputPlaceholderColor.withOpacity(0.6)),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: w * 0.02,
                                                                            ),
                                                                            Visibility(
                                                                              visible: data[index]["Plans"]["services_id"].length > 3,
                                                                              child: Text("+${data[index]["Plans"]["services_id"].length - 3} more",
                                                                                  style: GoogleFonts.montserrat(
                                                                                    fontSize: 7,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const Icon(
                                                                          Icons
                                                                              .arrow_forward_ios,
                                                                          size:
                                                                              10),
                                                                    ],
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible:
                                                        dropvalue == index + 1,
                                                    child: Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        color:
                                                            kLightOrangeBgColor,
                                                        // height: h * 0.055,
                                                        // width: w * 0.6,
                                                        margin: EdgeInsets.only(
                                                            right: w * 0.03),
                                                        padding: EdgeInsets.all(
                                                            h * 0.005),
                                                        child: GridView.count(
                                                            crossAxisSpacing: 1,
                                                            mainAxisSpacing: 2,
                                                            crossAxisCount: 3,
                                                            childAspectRatio:
                                                                1.6,
                                                            shrinkWrap: true,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: h *
                                                                        0.01),
                                                            children: List.generate(
                                                                data[index]["Plans"]
                                                                        [
                                                                        "services_id"]
                                                                    .length,
                                                                (indexx) {
                                                              return Column(
                                                                children: [
                                                                  CachedNetworkImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    height: h *
                                                                        0.03,
                                                                    imageUrl: data[index]["Plans"]["services_id"][indexx]
                                                                            [
                                                                            "image"]
                                                                        .toString(),
                                                                    placeholder:
                                                                        (context,
                                                                                url) =>
                                                                            Container(),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        Image.network(
                                                                            "https://i.gifer.com/DKke.gif"),
                                                                  ),
                                                                  // Image.asset(
                                                                  //   "assets/images/EngineOil.png",
                                                                  //   height: h * 0.03,
                                                                  // ),
                                                                  Text(
                                                                    data[index]["Plans"]["services_id"][indexx]
                                                                            [
                                                                            "title"]
                                                                        .toString(),
                                                                    // "Engine Oil ",
                                                                    // textScaleFactor: 0.7,
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: kTextInputPlaceholderColor
                                                                            .withOpacity(0.6)),
                                                                  ),
                                                                ],
                                                              );
                                                            })),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        // print(data[index]["_id"]);
                                                        isloading = true;
                                                        whichindex = index;
                                                        setState(() {});
                                                        delete(data[index]
                                                                ["_id"])
                                                            .whenComplete(() {
                                                          isloading = false;
                                                          if (data.isNotEmpty) {
                                                            subtotal = 0;
                                                            for (int i = 0;
                                                                i < data.length;
                                                                i++) {
                                                              totalvalue(double.parse(data[
                                                                              i]
                                                                          [
                                                                          "selectplan"][0]
                                                                      [
                                                                      "typeprice"]
                                                                  .toString()));
                                                            }
                                                          }
                                                        });

                                                        setState(() {});
                                                      },
                                                      child: SvgPicture.asset(
                                                        "assets/svg/Delete.svg",
                                                        height: h * 0.035,
                                                      ),
                                                      //  CircleAvatar(
                                                      //   radius: h * 0.02,
                                                      //   backgroundColor:
                                                      //       kbluecolor,
                                                      //   foregroundColor:
                                                      //       kwhitecolor,
                                                      //   child: FittedBox(
                                                      //       child: Icon(
                                                      //     Icons.delete,
                                                      //     size: h * 0.022,
                                                      //   )),
                                                      // ),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                          SizedBox(
                                            height: h * 0.02,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.02, left: w * 0.1),
                child: InkWell(
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
                  child: CircleAvatar(
                    radius: h * 0.025,
                    backgroundColor: kblackcolor,
                    foregroundColor: kwhitecolor,
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: kwhitecolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(h * 0.015),
                        bottomLeft: Radius.circular(h * 0.015))),
                margin: EdgeInsets.only(
                  top: h * 0.018,
                  left: w * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: h * 0.02, horizontal: w * 0.06),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Sub-Total",
                    //         style: GoogleFonts.montserrat(
                    //           fontSize: 13,
                    //           color: ksubHading,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //     Text("₹ $subtotal",
                    //         style: GoogleFonts.montserrat(
                    //           fontSize: 11,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Taxes",
                    //         style: GoogleFonts.montserrat(
                    //           fontSize: 13,
                    //           color: ksubHading,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //     Text("₹ 200",
                    //         style: GoogleFonts.montserrat(
                    //           fontSize: 11,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(data.isEmpty ? "₹ 0" : "₹ $subtotal",
                                style: GoogleFonts.montserrat(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("Incl. Taxes",
                                style: GoogleFonts.montserrat(
                                  color: ksubHading,
                                  fontSize: 6,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Visibility(
                visible: data.isNotEmpty,
                child: Center(
                  child: RRecctButton(
                    onTap: () {
                      // proceed();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Payment()));
                    },
                    buttonColor: korangecolor,
                    text: "Proceed".toUpperCase(),
                    h: h * 0.06,
                    w: w * 0.9,
                    style: GoogleFonts.montserrat(
                      color: kwhitecolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  totalvalue(double price) {
    subtotal = subtotal + price;
    print(subtotal);
  }

  Future fecthdata() async {
    await addcartitem(Cart.packe).then((value) {
      print("Response " + value.toString() + "^");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value["msg"]),
      ));
    }).whenComplete(() async {
      Cart.packe = Packes();
      await getcartitems().then((value) {
        setState(() {
          data.addAll(value);
          if (value == null) {
            _null = "You have nothing in Cart. Please add...";
            setState(() {});
          } else {
            _null = "";
            setState(() {});
          }
          print(data.toString() + "============");
          // for(int i=0; i<data.length; i++){
          //   plan=data[i]["Plans"];
          //   print(plan.toString()+"+++++++++++=====");
          // }
          //       service.addAll(value);
          //            print("================="+service.toString());
          // print("================="+service[0]["title"].toString());
        });
      });
    });
  }

  Future delete(String id) async {
    await deletecartitem(id).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value["msg"]),
      ));
    }).whenComplete(() async {
      await getcartitems().then((value) {
        print("+++++++++++++++=============" + value.toString());
        setState(() {
          data.clear();
          data.addAll(value);
          if (value.isEmpty) {
            _null = "You have nothing in Cart. Please add...";
            print(_null);
            setState(() {});
          } else {
            _null = "";
            setState(() {});
          }
          print(data.toString() + "============");
          setState(() {});
          // for(int i=0; i<data.length; i++){
          //   plan=data[i]["Plans"];
          //   print(plan.toString()+"+++++++++++=====");
          // }
          //       service.addAll(value);
          //            print("================="+service.toString());
          // print("================="+service[0]["title"].toString());
        });
      });
    });
  }
}
