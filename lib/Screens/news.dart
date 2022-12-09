import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityofcars/Services/models/blogModel.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/constants.dart';
import '../Utils/functions.dart';
import 'savedBlogs.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  List<BlogsModel> blogs = [];
  int length1 = 0;
  int length2 = 0;
  bool isloading = true;
  var h;
  var w;

  ScrollController scrollController = ScrollController();
  double value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getblog().then((value) {
      blogs.addAll(value);
      setState(() {
        length1 = blogs.length + 1;
        length2 = blogs.length + 1;
        blogs = blogs.reversed.toList();
        isloading = false;
      });
    });
    // _modalBottomSheetMenu();
    // bottemSheet();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kwhitecolor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "Blogs",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SavedBlogs(),
                      ));
                },
                child: const Icon(Icons.favorite_border)),
          )
        ],
      ),
      body: isloading
          ? loder
          : blogs.isEmpty
              ? Center(
                  child: Text(
                    "No data",
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                )
              : Container(
                  height: h,
                  width: w,
                  padding: EdgeInsets.only(bottom: h * 0.07),
                  child: Stack(
                    children: [
                      ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: blogs.length,
                          controller: scrollController,
                          shrinkWrap: true,
                          // reverse: true,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: kwhitecolor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(h * 0.1)),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 5,
                                        offset: Offset(0, 7),
                                        color: Colors.grey)
                                  ]),
                              margin: EdgeInsets.only(bottom: h * 0.015),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (length1 == index + 1) {
                                        length1 = 0;
                                      } else {
                                        if (length2 == index + 1) {
                                          length1 = index + 1;
                                        } else {
                                          length1 = index + 1;
                                        }
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: length1 == index + 1
                                            ? kbluecolor
                                            : kTransparent,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                Radius.circular(h * 0.05)),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.1,
                                          vertical: h * 0.03),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    // "Best and he bestest cars in India",
                                                    blogs[index]
                                                        .blogsheading
                                                        .toString(),
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: length1 ==
                                                              index + 1
                                                          ? kwhitecolor
                                                          : kTextInputPlaceholderColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    // "8 hrs",
                                                    //  DateTime.parse(blogs[index]
                                                    //               .createDate
                                                    //               .toString())
                                                    //           .day
                                                    //           .toString()+"/"+
                                                    DateTime.parse(blogs[index]
                                                                .createDate
                                                                .toString())
                                                            .hour
                                                            .toString() +
                                                        " Hrs"
                                                    // DateTime(blogs[index].createDate).hour.toString()
                                                    ,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: length1 ==
                                                              index + 1
                                                          ? kwhitecolor
                                                          : kTextInputPlaceholderColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                length1 == index + 1
                                                    ? Icons.keyboard_arrow_up
                                                    : Icons.keyboard_arrow_down,
                                                color: length1 == index + 1
                                                    ? kwhitecolor
                                                    : kTextInputPlaceholderColor,
                                              )
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (length2 == index + 1) {
                                                length2 = 0;
                                              } else {
                                                if (length1 == index + 1) {
                                                  length2 = index + 1;
                                                } else {
                                                  length2 = index + 1;
                                                }
                                              }

                                              setState(() {});
                                            },
                                            child: length2 == index + 1
                                                ? Container(
                                                    width: w,
                                                    margin: EdgeInsets.only(
                                                        top: h * 0.03),
                                                    child: Text(
                                                      blogs[index]
                                                          .discreption
                                                          .toString(),
                                                      // "When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up.",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: length1 ==
                                                                index + 1
                                                            ? kwhitecolor
                                                            : kTextInputPlaceholderColor,
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: h * 0.02,
                                                    width: w,
                                                    margin: EdgeInsets.only(
                                                        top: h * 0.03),
                                                    child: Text(
                                                      // "When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up.",
                                                      blogs[index]
                                                          .discreption
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: length1 ==
                                                                index + 1
                                                            ? kwhitecolor
                                                            : kTextInputPlaceholderColor,
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: kwhitecolor,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                    h * 0.06,
                                                  ),
                                                  topLeft: Radius.circular(
                                                      h * 0.015),
                                                  bottomRight: Radius.circular(
                                                      h * 0.015),
                                                  bottomLeft: Radius.circular(
                                                      h * 0.06)),
                                              // image: DecorationImage(
                                              //     image: NetworkImage(
                                              //       blogs[index].image.toString(),
                                              //     ),
                                              //     fit: BoxFit.fill)
                                            ),
                                            margin: EdgeInsets.symmetric(
                                                vertical: h * 0.03),
                                            height: h * 0.14,
                                            width: w,
                                            // child: Image.asset("assets/images/news1.png")
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                    h * 0.06,
                                                  ),
                                                  topLeft: Radius.circular(
                                                      h * 0.015),
                                                  bottomRight: Radius.circular(
                                                      h * 0.015),
                                                  bottomLeft: Radius.circular(
                                                      h * 0.06)),
                                              child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  height: h * 0.14,
                                                  imageUrl: blogs[index]
                                                      .image
                                                      .toString(),
                                                  placeholder: (context, url) =>
                                                      loder,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          // Icon(Icons.error)
                                                          Container()
                                                  // Image.network(
                                                  //     "https://i.gifer.com/DKke.gif"),
                                                  ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: w,
                                      constraints:
                                          BoxConstraints(minHeight: h * 0.04),
                                      child: Stack(
                                        children: [
                                          length1 == index + 1
                                              ? Container(
                                                  width: w,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.1,
                                                  ),
                                                  margin: EdgeInsets.only(
                                                      top: h * 0.01,
                                                      bottom: h * 0.07),
                                                  child: Text(
                                                    blogs[index]
                                                        .subDiscreption
                                                        .toString(),
                                                    textAlign: TextAlign.start,
                                                    // "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going.",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                knewstextbrif,
                                                            height: 1.5),
                                                  ),
                                                )
                                              : Container(),
                                          Positioned(
                                            bottom: h * 0.008,
                                            right: w * 0.04,
                                            child: GestureDetector(
                                              onTap: () {
                                                share(
                                                    des: blogs[index]
                                                        .discreption
                                                        .toString(),
                                                    heading: blogs[index]
                                                        .blogsheading
                                                        .toString(),
                                                    subdes: blogs[index]
                                                        .subDiscreption
                                                        .toString(),
                                                    time: blogs[index]
                                                        .createDate
                                                        .toString(),
                                                    url: blogs[index]
                                                        .image
                                                        .toString());
                                              },
                                              child: Icon(
                                                Icons.share,
                                                size: h * 0.025,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: h * 0.008,
                                            right: w * 0.1,
                                            child: GestureDetector(
                                              onTap: () {
                                                // share(
                                                //     des: blogs[index]
                                                //         .discreption
                                                //         .toString(),
                                                //     heading: blogs[index]
                                                //         .blogsheading
                                                //         .toString(),
                                                //     subdes: blogs[index]
                                                //         .subDiscreption
                                                //         .toString(),
                                                //     time: blogs[index]
                                                //         .createDate
                                                //         .toString(),
                                                //     url: blogs[index].image.toString());
                                                addbookmark(
                                                        blogs[index]
                                                            .id
                                                            .toString(),
                                                        context)
                                                    .whenComplete(() {
                                                  getblog().then((value) {
                                                    blogs.clear();
                                                    blogs.addAll(value);
                                                    setState(() {
                                                      length1 =
                                                          blogs.length + 1;
                                                      length2 =
                                                          blogs.length + 1;
                                                      blogs = blogs.reversed
                                                          .toList();
                                                    });
                                                  });
                                                  setState(() {});
                                                });
                                              },
                                              child: !blogs[index].profileBlogs!
                                                  ? Icon(
                                                      Icons.bookmark_border,
                                                      size: h * 0.03,
                                                    )
                                                  : Icon(
                                                      Icons.bookmark,
                                                      size: h * 0.03,
                                                      color: korangecolor,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
    );
  }
  // void _modalBottomSheetMenu() {
  //   WidgetsBinding.instance!.addPostFrameCallback((_) async {
  //     await showModalBottomSheet(
  //         context: context,
  //         builder: (builder) {
  //           return new Container(
  //             height: 350.0,
  //             color:
  //                 Colors.transparent, //could change this to Color(0xFF737373),
  //             //so you don't have to change MaterialApp canvasColor
  //             child: new Container(
  //                 decoration: new BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: new BorderRadius.only(
  //                         topLeft: const Radius.circular(10.0),
  //                         topRight: const Radius.circular(10.0))),
  //                 child: new Center(
  //                   child: new Text("This is a modal sheet"),
  //                 )),
  //           );
  //         });
  //   });
  // }

}
