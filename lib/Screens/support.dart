import 'package:cityofcars/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  var h;
  var w;
  List message =[
    {
      "message" : "what is the best time to visit Rio de Janeiro?",
      "status" : 0,
    }
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg2,
      appBar: AppBar(
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        elevation: 0,
        title: Text(
          "Support",
          style: GoogleFonts.montserrat(
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
        color: carhealthColor4,
        height: h * 0.08,
        child: Row(
          children: [
            

            Expanded(
              child: InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                      color: kgrey,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(w * 0.07, h * 0.06))),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: kwhitecolor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.only(
                    left: w*0.08
                  ),
                  child:TextFormField(
                    cursorColor: kgrey,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Say Something…",
                      
                      hintStyle: TextStyle(
                        color: kwhitecolor.withOpacity(0.64),
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        
                      )
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
        ],
      ),
    );
  }
}
