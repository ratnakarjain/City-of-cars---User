import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'selectBrand.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key? key}) : super(key: key);

  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  ScrollController _controller = ScrollController();
  var size;
  List cityList = [
    {"name": "Delhi", "images": "4.png"},
    {"name": "Gurgoan", "images": "2.png"},
    {"name": "Noida", "images": "3.png"},
    {"name": "Chandigarh", "images": "5.png"}
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 22, top: 20),
          child: Text(
            "Select Your City",
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: kTextInputPlaceholderColor,
            )),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.06, right: size.width * 0.06, top: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search your city... ",
                    suffixIcon: Icon(
                      Icons.search,
                      color: korangecolor,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: korangecolor, width: 1.0),
                        borderRadius: BorderRadius.circular(20)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kTextInputPlaceholderColor, width: 1.0),
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07, vertical: 50),
              color: kLightOrangeBgColor,
              child: GridView.count(
                controller: _controller,
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(cityList.length, (index) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectBrand(),
                            ));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 8,
                        shadowColor: Colors.grey.withOpacity(0.2),
                        child: Container(
                          height: size.height * 0.17,
                          width: size.height * 0.17,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/${cityList[index]["images"]}"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cityList[index]["name"],
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                )
                              ]),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
