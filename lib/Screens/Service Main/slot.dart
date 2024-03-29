import 'package:cityofcars/Screens/Service%20Main/cart.dart';
import 'package:cityofcars/Screens/Service%20Main/payment.dart';
import 'package:cityofcars/Screens/Service%20Main/selectLocation.dart';
import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/Buttons/button.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Utils/constants.dart';
import '../../Utils/functions.dart';
import '../bottomnavBar.dart';

var h;
var w;
String date = "";
String time = "";
bool istaped = false;
bool currentlocation = false;

class Slot extends StatefulWidget {
  const Slot({Key? key}) : super(key: key);

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  ScrollController _controller = ScrollController();
  bool isTime = false;

  final houseNo = TextEditingController();
  final street = TextEditingController();
  final state = TextEditingController();
  final pinCode = TextEditingController();
  final name = TextEditingController();
  final contect = TextEditingController();
  final mail = TextEditingController();
  final carNumber = TextEditingController();
  final option = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String errorState = "";
  String errorPinCode = "";
  String lati = "";
  String longi = "";

  @override
  void initState() {
    super.initState();
    contect.text = prefs!.getString("mobile").toString() == "null"
        ? ""
        : prefs!.getString("mobile").toString();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
// istaped=false;
    return Scaffold(
        backgroundColor: kLightOrangeBgColor,
        appBar: AppBar(
          titleSpacing: -10,
          centerTitle: false,
          elevation: 0,
          backgroundColor: kwhitecolor,
          foregroundColor: kblackcolor,
          title: Text(
            "Select Slot",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
          bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.06, vertical: h * 0.005),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          isTime = false;
                          setState(() {});
                        },
                        child: Text(
                          "Choose Date >",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isTime = true;
                          setState(() {});
                        },
                        child: Text(
                          "Choose Time Slot >",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ]),
              ),
              preferredSize: Size.fromHeight(h * 0.02)),
        ),
        body: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              isTime
                  ? Container(
                      height: h * 0.35,
                      width: w,
                      child: const Center(child: TimeSlot()),
                    )
                  : const Calendar(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.06, vertical: h * 0.04),
                color: kwhitecolor,
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Booking Details",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, color: kblackcolor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "Get current location:",
                                    "Current location as pick-up",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        color: kblackcolor),
                                  ),
                                  Text(
                                    "location services need to be turned on",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 9,
                                        color: kblackcolor),
                                  ),
                                ],
                              ),
                            ),
                            Checkbox(
                              focusColor: kGreenColor,
                              value: currentlocation,
                              onChanged: (value) {
                                currentlocation = value!;

                                setState(() {});
                              },
                            )
                          ],
                        ),

                        // Container(
                        //   height: h * 0.06,
                        //   margin: EdgeInsets.only(top: h * 0.02, bottom: 0.01),
                        //   child: TextFormField(
                        //     cursorColor: korangecolor,
                        //     decoration: InputDecoration(
                        //         hintText: "Enter pick-up location",
                        //         hintStyle: GoogleFonts.montserrat(fontSize: 13),
                        //         suffixIcon: const Icon(Icons.search),
                        //         fillColor: korangecolor,
                        //         focusColor: korangecolor,
                        //         suffixIconColor: korangecolor,
                        //         focusedBorder: OutlineInputBorder(
                        //             borderSide: const BorderSide(
                        //                 color: korangecolor, width: 1.0),
                        //             borderRadius:
                        //                 BorderRadius.circular(h * 0.02)),
                        //         border: OutlineInputBorder(
                        //             borderRadius:
                        //                 BorderRadius.circular(h * 0.02))),
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => SelectLocation(),
                        //         ));
                        //   },
                        //   child: Container(
                        //       height: h * 0.06,
                        //       margin:
                        //           EdgeInsets.only(top: h * 0.02, bottom: 0.01),
                        //       padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(h * 0.02),
                        //           border: Border.all(
                        //               color: kTextInputPlaceholderColor
                        //                   .withOpacity(0.5))),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             "Enter pick-up location",
                        //             style: GoogleFonts.montserrat(fontSize: 13),
                        //           ),
                        //           Icon(
                        //             Icons.search,
                        //             color: kTextInputPlaceholderColor
                        //                 .withOpacity(0.7),
                        //           )
                        //         ],
                        //       )
                        // TextFormField(
                        //   cursorColor: korangecolor,
                        //   decoration: InputDecoration(
                        //       hintText: "Enter pick-up location",
                        //       hintStyle: GoogleFonts.montserrat(fontSize: 13),
                        //       suffixIcon: const Icon(Icons.search),
                        //       fillColor: korangecolor,
                        //       focusColor: korangecolor,
                        //       suffixIconColor: korangecolor,
                        //       focusedBorder: OutlineInputBorder(
                        //           borderSide: const BorderSide(
                        //               color: korangecolor, width: 1.0),
                        //           borderRadius:
                        //               BorderRadius.circular(h * 0.02)),
                        //       border: OutlineInputBorder(
                        //           borderRadius:
                        //               BorderRadius.circular(h * 0.02))),
                        // ),
                        // ),
                        // ),
                        // SizedBox(
                        //   height: h * 0.02,
                        // ),
                        TextFormField(
                          cursorColor: korangecolor,
                          controller: houseNo,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter house no.";
                            }
                            return null;
                          },
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                          decoration: InputDecoration(
                              hintText: "House No.. & Floor*",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.25),
                              ),
                              focusColor: korangecolor,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: korangecolor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextFormField(
                          cursorColor: korangecolor,
                          controller: street,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter street";
                            }
                            return null;
                          },
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              hintText: "Street / City*",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.25),
                              ),
                              focusColor: korangecolor,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: korangecolor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: state,
                                cursorColor: korangecolor,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter state";
                                  }
                                  if (!RegExp('[a-zA-Z]').hasMatch(value)) {
                                    return 'Enter a Valid State';
                                  }
                                  return null;
                                },
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13)),
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                    hintText: "State*",
                                    hintStyle: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.25),
                                    ),
                                    focusColor: korangecolor,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.25),
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: korangecolor,
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: w * 0.05,
                            ),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: pinCode,
                                cursorColor: korangecolor,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter pin code";
                                  }
                                  if (value.length != 6) {
                                    return "Pincode should be enter 6 digit";
                                  }
                                  return null;
                                },
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13)),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]")),
                                ],
                                onChanged: (value) {
                                  if (value == " " || value == "0") {
                                    pinCode.clear();
                                  }
                                },
                                maxLength: 6,
                                decoration: InputDecoration(
                                    counterText: "",
                                    hintText: "Pin Code*",
                                    hintStyle: GoogleFonts.montserrat(
                                      fontSize: 13,
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.25),
                                    ),
                                    focusColor: korangecolor,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.25),
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: korangecolor,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextFormField(
                          cursorColor: korangecolor,
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Name';
                            }
                            if (!RegExp('[a-zA-Z]').hasMatch(value)) {
                              return 'Enter a Valid Name';
                            }
                            return null;
                          },
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              hintText: "Name*",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.25),
                              ),
                              focusColor: korangecolor,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: korangecolor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: contect,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter contact number";
                            }
                            if (value.length < 10) {
                              return "Mobile no. should be enter 10 digit";
                            }
                            return null;
                          },
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                          cursorColor: korangecolor,
                          maxLength: 10,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ],
                          onChanged: (value) {
                            if (value == " " || value == "0") {
                              contect.clear();
                            }
                          },
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: "Contact*",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.25),
                              ),
                              focusColor: korangecolor,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: korangecolor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: mail,
                          cursorColor: korangecolor,
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "E-Mail",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.25),
                              ),
                              focusColor: korangecolor,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: korangecolor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        TextFormField(
                          controller: carNumber,
                          cursorColor: korangecolor,
                          // textCapitalization: TextCapitalization.characters,
                          inputFormatters: [
                            UpperCaseTextFormatter(),
                          ],
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),

                          // inputFormatters: [FilteringTextInputFormatter.allow(RegExp("^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}\$"))],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter car number";
                            }
                            if (value.length < 9) {
                              return "Please enter valid car no.";
                            }

                            // if(!RegExp("^[0-9]{2}[0-9]{4}[A-HJ-NP-Z]{2}\$").hasMatch(value)){
                            //   return "Please enter correct formate";
                            // }
                            return null;
                          },
                          maxLength: 12,
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: "Car Number eg. RJ70 ZX 0000",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: kTextInputPlaceholderColor
                                    .withOpacity(0.25),
                              ),
                              focusColor: korangecolor,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: korangecolor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Text(
                          // "Special Remarks / Preferences",
                          "Additional Requests",
                          style: GoogleFonts.montserrat(
                              color: kTextInputPlaceholderColor),
                        ),
                        Container(
                          height: h * 0.1,
                          width: w,
                          margin: EdgeInsets.only(top: h * 0.015),
                          decoration: BoxDecoration(
                              color: kwhitecolor,
                              borderRadius: BorderRadius.circular(h * 0.025),
                              boxShadow: [
                                // BoxShadow(
                                //   blurRadius: 5,
                                //   offset:
                                // )
                              ]),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(h * 0.015)),
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 5,
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13)),
                              controller: option,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Anything to add or specify",
                                  hintStyle: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    color: kTextInputPlaceholderColor
                                        .withOpacity(0.25),
                                  ),
                                  contentPadding: EdgeInsets.all(h * 0.01)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        istaped
                            ? loder
                            : RRecctButton(
                                text: "continue".toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    color: kwhitecolor),
                                h: h * 0.06,
                                buttonColor: korangecolor,
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  if (currentlocation) {
                                    print("done");
                                    istaped = true;
                                    setState(() {});
                                    await determinePosition().then((value) {
                                      lati = value.latitude.toString();
                                      longi = value.longitude.toString();
                                      print(lati);
                                      print(longi);
                                    }).whenComplete(() {
                                      if (date.isEmpty || time.isEmpty) {
                                        _controller.jumpTo(0);
                                        istaped = false;
                                        setState(() {
                                          isTime = date.isEmpty ? false : true;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(date.isEmpty
                                              ? "Please select date to proceed."
                                              : "Please choose time slot to proceed."),
                                        ));
                                      } else {
                                        if (_formKey.currentState!.validate()) {
                                          istaped = true;
                                          bookSlot();

                                          currentlocation = false;
                                        } else {
                                          istaped = false;
                                          setState(() {});
                                        }
                                      }
                                    });
                                  } else {
                                    if (date.isEmpty || time.isEmpty) {
                                      _controller.jumpTo(0);
                                      istaped = false;
                                      setState(() {
                                        isTime = date.isEmpty ? false : true;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(date.isEmpty
                                            ? "Please select date to proceed"
                                            : "Please select the time slot to proceed."),
                                      ));
                                    } else {
                                      if (_formKey.currentState!.validate()) {
                                        istaped = true;
                                        setState(() {});
                                        bookSlot();
                                        currentlocation = false;
                                      } else {
                                        istaped = false;
                                        setState(() {});
                                      }
                                    }
                                  }
                                },
                              )
                      ]),
                ),
              ),
            ],
          ),
        ));
  }

  bookSlot() {
    slot(
            name.text,
            mail.text,
            contect.text,
            carNumber.text,
            houseNo.text,
            state.text,
            street.text,
            pinCode.text,
            option.text,
            date,
            time,
            Prefernece.pref!.getString("cityId").toString(),
            lati,
            longi)
        .then((value) {
      Ids.slotid = value["_id"];
      print(Ids.categoryid);
      print(Ids.subcategoryid);
      print(Ids.planid);
      print(Ids.slotid);
      istaped = false;
      date = "";
      time = "";
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "You are just a few steps away to complete your booking and have a great experience.")));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Cart(
              getcart: false,
            ),
          ));
    });
  }
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  var kToday = DateTime.now();
  var kFirstDay;
  var kLastDay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    kFirstDay = DateTime.now();
    kLastDay = DateTime(kToday.year + 3, kToday.month, kToday.day);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: h * 0.01, bottom: h * 0.02, left: w * 0.04, right: w * 0.04),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.02, right: w * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${DateFormat.MMMM().format(_focusedDay)}",
                  style: GoogleFonts.montserrat(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          TableCalendar(
            formatAnimationDuration: const Duration(seconds: 0),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            headerVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
                leftChevronVisible: false,
                formatButtonVisible: false,
                rightChevronVisible: false,
                headerMargin: const EdgeInsets.only(right: 20),
                titleTextStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kTextInputPlaceholderColor)),

            daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle:
                    GoogleFonts.montserrat(color: kTextInputPlaceholderColor)),

            calendarStyle: CalendarStyle(
              // withinRangeDecoration: BoxDecoration(
              //     color: _rangeEnd == null ? kDateCircleColor : kTransparent),
              // defaultTextStyle: GoogleFonts.montserrat(
              //   color: kTextInputPlaceholderColor,
              // ),
              // rangeStartDecoration: BoxDecoration(
              //     color: _rangeEnd == null ? kbluecolor : kDateCircleColor,
              //     shape: BoxShape.circle),
              // rangeHighlightColor: kStartDatrCicleColor,
              // rangeStartTextStyle: GoogleFonts.montserrat(
              //     color: _rangeEnd == null ? kwhitecolor : kStartDateColor),
              // rangeEndTextStyle: GoogleFonts.montserrat(
              //     fontWeight: FontWeight.w700, color: kwhitecolor),
              weekendTextStyle:
                  GoogleFonts.montserrat(color: kTextInputPlaceholderColor),
              selectedTextStyle: GoogleFonts.montserrat(
                  color:
                      //  _rangeEnd == null
                      //     ? _rangeStart == null
                      kwhitecolor),
              selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      //  _rangeEnd == null
                      //     ? _rangeStart == null
                      kGreenColor),
              todayTextStyle: GoogleFonts.montserrat(
                color:
                    //  _rangeEnd == null
                    //     ? _rangeStart == null
                    kwhitecolor,
              ),
              // : kTextInputPlaceholderColor
              //  :  kTextInputPlaceholderColor),
              todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      //  _rangeEnd == null
                      //     ? _rangeStart == null
                      korangecolor.withOpacity(0.7)),
              //     : kDateCircleColor
              // : kDateCircleColor),
              defaultDecoration: const BoxDecoration(
                  shape: BoxShape.circle, color: kDateCircleColor),
              weekendDecoration: const BoxDecoration(
                  shape: BoxShape.circle, color: kDateCircleColor),
              rangeEndDecoration: const BoxDecoration(
                  color: kbluecolor, shape: BoxShape.circle),
            ),
            // rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            // rangeSelectionMode: _rangeSelectionMode,
            onDaySelected: (selectedDay, focusedDay) {
              // if (!isSameDay(_selectedDay, selectedDay)) {
              //   if (_rangeStart!.day >= DateTime.now().day ||
              //       _rangeStart!.month > DateTime.now().month) {
              //     setState(() {
              _focusedDay = focusedDay;
              _selectedDay = selectedDay;
              date = DateFormat('yyyy-MMM-dd').format(_selectedDay!);
              print(date);
              print(selectedDay);
              // if (_selectedDay!.day < DateTime.now().day &&
              //     _selectedDay!.month < DateTime.now().month &&
              //     _selectedDay!.year < DateTime.now().year) {
              //   _selectedDay =null;
              //    setState(() {});

              // }

              //       _rangeStart = null; // Important to clean those
              //       _rangeEnd = null;
              //       _rangeSelectionMode = RangeSelectionMode.toggledOff;
              //     });
              //   }
              // }
              setState(() {});
            },
            // onRangeSelected: (start, end, focusedDay) {
            //   if (DateTime.now().day <= start!.day ||
            //       DateTime.now().month < start.month) {
            //     setState(() {
            //       _selectedDay = null;
            //       _focusedDay = focusedDay;
            //       _rangeStart = start;
            //       _rangeEnd = end;
            //       _rangeSelectionMode = RangeSelectionMode.toggledOn;
            //     });
            //   }
            // },
            // onFormatChanged: (format) {
            //   if (_calendarFormat != format) {
            //     setState(() {
            //       _calendarFormat = format;
            //     });
            //   }
            // },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
              print(focusedDay);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class TimeSlot extends StatefulWidget {
  const TimeSlot({Key? key}) : super(key: key);

  @override
  State<TimeSlot> createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  ScrollController _controller = ScrollController();
  List<bool> isSelected = [];
  List data = [
    {
      "start hour": "09",
      "start min": "00",
      "end hour": "12",
      "end min": "00",
    },
    {
      "start hour": "12",
      "start min": "00",
      "end hour": "03",
      "end min": "00",
    },
    {
      "start hour": "03",
      "start min": "00",
      "end hour": "06",
      "end min": "00",
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    change();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: _controller,
      itemCount: data.length,
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.2,
      ),
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: h * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isSelected[index] ? kDateCircleColor : kTransparent),
            child: InkWell(
              onTap: () {
                change();
                setState(() {
                  isSelected[index] = !isSelected[index];
                  time = data[index]["start hour"] +
                      " " +
                      data[index]["start min"] +
                      " : " +
                      data[index]["end hour"] +
                      " " +
                      data[index]["end min"];
                  print(time);
                });
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              isSelected[index] ? kbluecolor : kDateCircleColor,
                          foregroundColor: isSelected[index]
                              ? kwhitecolor
                              : kTextInputPlaceholderColor,
                          child: FittedBox(
                            child: Text(
                              data[index]["start hour"],
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        CircleAvatar(
                          backgroundColor:
                              isSelected[index] ? kbluecolor : kDateCircleColor,
                          foregroundColor: isSelected[index]
                              ? kwhitecolor
                              : kTextInputPlaceholderColor,
                          child: FittedBox(
                              child: Text(
                            data[index]["start min"],
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
                    ),
                    Text(
                      "-",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: kTextInputPlaceholderColor),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: isSelected[index]
                              ? korangecolor
                              : kDateCircleColor,
                          foregroundColor: isSelected[index]
                              ? kwhitecolor
                              : kTextInputPlaceholderColor,
                          child: FittedBox(
                              child: Text(
                            data[index]["end hour"],
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        CircleAvatar(
                          backgroundColor: isSelected[index]
                              ? korangecolor
                              : kDateCircleColor,
                          foregroundColor: isSelected[index]
                              ? kwhitecolor
                              : kTextInputPlaceholderColor,
                          child: FittedBox(
                              child: Text(
                            data[index]["end min"],
                            style: GoogleFonts.montserrat(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
                    ),
                  ]),
            ));
      },
    );
  }

  change() {
    isSelected = List.generate(data.length, (index) => false);
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
