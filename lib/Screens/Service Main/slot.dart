import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../Utils/constants.dart';

class Slot extends StatefulWidget {
  const Slot({Key? key}) : super(key: key);

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  var h;
  var w;
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: kLightOrangeBgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kwhitecolor,
          foregroundColor: kblackcolor,
          title: Text(
            "Select Slot",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
          bottom: PreferredSize(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Choose Date",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Choose Time Slot",
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
              Calendar(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.06, vertical: h * 0.04),
                color: kwhitecolor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter Booking Details",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                      ),
                      Container(
                        height: h * 0.06,
                        margin: EdgeInsets.only(top: h * 0.02, bottom: 0.01),
                        child: TextFormField(
                          cursorColor: korangecolor,
                          decoration: InputDecoration(
                              hintText: "Enter pick-up location",
                              hintStyle: GoogleFonts.montserrat(
                                fontSize: 13 
                              ),
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
                      SizedBox(
                        height: h * 0.02,
                      ),
                      TextFormField(
                        cursorColor: korangecolor,
                        decoration: InputDecoration(
                            hintText: "House No.. & Floor*",
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 13
                            ),
                            focusColor: korangecolor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: korangecolor,
                              ),
                            )),
                      ),
                      TextFormField(
                        cursorColor: korangecolor,
                        decoration: InputDecoration(
                            hintText: "Street*",
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 13
                            ),
                            focusColor: korangecolor,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: korangecolor,
                              ),
                            )),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: korangecolor,
                              decoration: InputDecoration(
                                  hintText: "State*",
                                  hintStyle: GoogleFonts.montserrat(
                                    fontSize: 13
                                  ),
                                  focusColor: korangecolor,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: korangecolor,
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor: korangecolor,
                              decoration: InputDecoration(
                                  hintText: "Pin Code*",
                                  hintStyle: GoogleFonts.montserrat(
                                    fontSize: 13
                                  ),
                                  focusColor: korangecolor,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: korangecolor,
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: h*0.02,),
                      TextFormField(
                        cursorColor: korangecolor,
                        decoration: InputDecoration(
                          hintText: "Name*",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 13
                          ),
                          focusColor: korangecolor,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: korangecolor,
                            ),
                            
                          )
                          
                        ),
                      ),
                      TextFormField(
                        cursorColor: korangecolor,
                        decoration: InputDecoration(
                          hintText: "Contact*",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 13
                          ),
                          focusColor: korangecolor,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: korangecolor,
                            ),
                            
                          )
                          
                        ),
                      ),
                      TextFormField(
                        cursorColor: korangecolor,
                        decoration: InputDecoration(
                          hintText: "E-Mail",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 13
                          ),
                          focusColor: korangecolor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: korangecolor,
                            ),
                            
                          )
                          
                        ),
                      ),
                      TextFormField(
                        cursorColor: korangecolor,
                        decoration: InputDecoration(
                          hintText: "Car Number",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 13
                          ),
                          focusColor: korangecolor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: korangecolor,
                            ),
                            
                          )
                          
                        ),
                      ),
                      Text(
                        "Special Remarks / Preferences",
                        style: GoogleFonts.montserrat(
                          color: kTextInputPlaceholderColor
                        ),
                      )
                    ]),
              )
            ],
          ),
        ));
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
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  var kToday = DateTime.now();
  var kFirstDay;
  var kLastDay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    kFirstDay = DateTime(kToday.year - 3, kToday.month, kToday.day);
    kLastDay = DateTime(kToday.year + 3, kToday.month, kToday.day);
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      formatAnimationDuration: Duration(seconds: 0),
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      rangeStartDay: _rangeStart,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
          leftChevronVisible: false,
          formatButtonVisible: false,
          rightChevronVisible: false,
          headerMargin: EdgeInsets.only(right: 20),
          titleTextStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kTextInputPlaceholderColor)),

      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle:
              GoogleFonts.montserrat(color: kTextInputPlaceholderColor)),

      calendarStyle: CalendarStyle(
        withinRangeDecoration: BoxDecoration(
            color: _rangeEnd == null ? kDateCircleColor : kTransparent),
        defaultTextStyle: GoogleFonts.montserrat(
          color: kTextInputPlaceholderColor,
        ),
        rangeStartDecoration: BoxDecoration(
            color: _rangeEnd == null ? kbluecolor : kDateCircleColor,
            shape: BoxShape.circle),
        rangeHighlightColor: kStartDatrCicleColor,
        rangeStartTextStyle: GoogleFonts.montserrat(
            color: _rangeEnd == null ? kwhitecolor : kStartDateColor),
        rangeEndTextStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700, color: kwhitecolor),
        weekendTextStyle:
            GoogleFonts.montserrat(color: kTextInputPlaceholderColor),
        todayTextStyle: GoogleFonts.montserrat(
            color: _rangeEnd == null
                ? _rangeStart == null
                    ? kwhitecolor
                    : kTextInputPlaceholderColor
                : kTextInputPlaceholderColor),
        todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _rangeEnd == null
                ? _rangeStart == null
                    ? kbluecolor
                    : kDateCircleColor
                : kDateCircleColor),
        defaultDecoration: const BoxDecoration(
            shape: BoxShape.circle, color: kDateCircleColor),
        weekendDecoration: const BoxDecoration(
            shape: BoxShape.circle, color: kDateCircleColor),
        rangeEndDecoration:
            const BoxDecoration(color: kbluecolor, shape: BoxShape.circle),
      ),
      rangeEndDay: _rangeEnd,
      calendarFormat: _calendarFormat,
      rangeSelectionMode: _rangeSelectionMode,
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          if (_rangeStart!.day >= DateTime.now().day ||
              _rangeStart!.month > DateTime.now().month) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              _rangeSelectionMode = RangeSelectionMode.toggledOff;
            });
          }
        }
      },
      onRangeSelected: (start, end, focusedDay) {
        if (DateTime.now().day <= start!.day ||
            DateTime.now().month < start.month) {
          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _rangeStart = start;
            _rangeEnd = end;
            _rangeSelectionMode = RangeSelectionMode.toggledOn;
          });
        }
      },
      // onFormatChanged: (format) {
      //   if (_calendarFormat != format) {
      //     setState(() {
      //       _calendarFormat = format;
      //     });
      //   }
      // },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
