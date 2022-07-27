import 'dart:convert';

import 'package:cityofcars/Services/models/faqModel.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/servies.dart';
import '../Utils/constants.dart';

class FAQS extends StatefulWidget {
  const FAQS({Key? key}) : super(key: key);

  @override
  _FAQSState createState() => _FAQSState();
}

class _FAQSState extends State<FAQS> {
  bool isloading = true;
  String selected = "";

  List<FaqModel> faqList = [];

  @override
  void initState() {
    super.initState();

    getfaq().then((value) {
      if (value != null) {
        faqList.addAll(value);
        isloading = false;
        setState(() {});
      }
    });
  }

  ScrollController _controller = new ScrollController();
  bool visibility1 = false;
  bool visibility2 = false;
  bool visibility3 = false;

  List<Map<dynamic, dynamic>> splashData = [
    {
      "title": "Lorem ipsum dolor sit amet?",
      "subTitile":
          "Lorem ipsum dolor sit amet, consetetur spscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.",
      "visibility": true
    },
    {
      "title": "Lorem ipsum dolor sit amet?",
      "subTitile":
          "Lorem ipsum dolor sit amet, consetetur spscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.",
      "visibility": false
    },
    {
      "title": "Lorem ipsum dolor sit amet?",
      "subTitile":
          "Lorem ipsum dolor sit amet, consetetur spscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.",
      "visibility": false
    },
  ];
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    // getfaq().then((value) {
    //   if (value != null) {
    //     faqList.addAll(value);
    //     isLoading = false;
    //     setState(() {});
    //   }
    // });
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "FAQ",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: isloading
          ? loder
          : ListView.builder(
              shrinkWrap: true,
              controller: _controller,
              itemCount: faqList.length,
              padding: EdgeInsets.only(top:h*0.02),
              itemBuilder: (BuildContext context, int index) {
                //  var abc = faqList[index];
                return Visibility(
                  visible: faqList[index].question!=null||faqList[index].answer !=null,
                  child: ExpandableNotifier(
                      initialExpanded: false,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          color: kbg2.withOpacity(0.5),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: <Widget>[
                              ScrollOnExpand(
                                scrollOnExpand: true,
                                scrollOnCollapse: false,
                                child: ExpandablePanel(
                                  theme: const ExpandableThemeData(
                                    useInkWell: true,
                                    iconColor: korangecolor,
                                    iconSize: 30,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment
                                            .center,
                                    tapBodyToCollapse: true,
                                  ),
                                  header: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        //  "Most companies have an FAQ",
                                        faqList[index].question.toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                kTextInputPlaceholderColor),
                                      )),
                                  collapsed: Text(
                                    //  "Frequently Asked Questions — page on their website. This page includes a series of questions that are commonly asked by customers and cover topics including product or service usage, business hours, prices, and more.",
                                    faqList[index].answer.toString(),
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: kTextInputPlaceholderColor),
                                  ),
                                  expanded: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // for (var _ in Iterable.generate(5))
                                      Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            //  "Frequently Asked Questions — page on their website. This page includes a series of questions that are commonly asked by customers and cover topics including product or service usage, business hours, prices, and more.",

                                            faqList[index]
                                                .answer
                                                .toString(),
                                            softWrap: true,
                                            overflow: TextOverflow.fade,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    kTextInputPlaceholderColor),
                                          )),
                                    ],
                                  ),
                                  builder: (_, collapsed, expanded) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10),
                                      child: Expandable(
                                        collapsed: collapsed,
                                        expanded: expanded,
                                        theme: const ExpandableThemeData(
                                            crossFadePoint: 0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              },
            ),
    );
  }
}
