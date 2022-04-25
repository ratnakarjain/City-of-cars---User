// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/functions.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/Buttons/button.dart';
import '../Utils/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var h;
  var w;
  var file;
  var prefs = Prefernece.pref;
  var name = TextEditingController();
  var mobile = TextEditingController();
  var email = TextEditingController();
  var houseNo = TextEditingController();
  var street = TextEditingController();
  var state = TextEditingController();
  var pinCode = TextEditingController();
  bool isImagePicked = false;
  @override
  void initState() {
    name.text = prefs!.getString("name").toString();
    mobile.text = prefs!.getString("mobile").toString();
    email.text = prefs!.getString("email").toString();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kbg2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhitecolor,
        foregroundColor: kTextInputPlaceholderColor,
        title: Text(
          "Edit Profile",
          style:
              GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05, vertical: h * 0.02),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "My Documment     ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.file_upload_outlined,
                              color: kbluecolor,
                              size: h * 0.02,
                            )
                          ],
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: "Registration Certificate\n",
                              style: GoogleFonts.montserrat(
                                  color: kSelectedColor, fontSize: 10),
                              children: [
                                TextSpan(
                                    text: "Insurance Policy\n",
                                    style: GoogleFonts.montserrat(
                                        color: kSelectedColor, fontSize: 10)),
                                TextSpan(
                                    text: "Other\n",
                                    style: GoogleFonts.montserrat(
                                        color: kSelectedColor, fontSize: 10)),
                              ]),
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () async {
                          // editPic();
                          file = await imagePicker();
                          isImagePicked = true;
                          print("============================$file");
                          setState(() {});
                        },
                        child: isImagePicked
                            ? Container(
                                height: h * 0.06,
                                width: h * 0.06,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: FileImage(
                                          File(file),
                                        ))),
                              )
                            : Container(
                                height: h * 0.06,
                                width: h * 0.06,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            AssetImage("assets/images/ava1.png")
                                        //     image:  FileImage(
                                        //   File(file),
                                        // ):
        
                                        )),
                              )
                        // CircleAvatar(
                        //   radius: h * 0.03,
                        //   backgroundColor: kwhitecolor,
                        //   child:
                        //   !isImagePicked?
                        //   Image.asset(
                        //     "assets/images/ava1.png",
                        //     fit: BoxFit.cover,
                        //      height: h * 0.1,
                        //   ):
                        //   Image.file(
                        //     File(file),
                        //     fit: BoxFit.cover,
                        //     // height: h*0.07,
                        //     ),
                        // ),
                        )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: kwhitecolor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          h * 0.05,
                        ),
                        bottomLeft: Radius.circular(h * 0.05)),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5, offset: Offset(0, 3), color: Colors.grey)
                    ]),
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05, vertical: h * 0.03),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,

                      decoration: InputDecoration(
                          hintText: "Name*",
                          hintStyle: GoogleFonts.montserrat(
                              color: kTextInputPlaceholderColor.withOpacity(0.32),
                              fontSize: 13),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.32))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: mobile,
                      decoration: InputDecoration(
                          hintText: "Mobile No.*",
                          hintStyle: GoogleFonts.montserrat(
                              color: kTextInputPlaceholderColor.withOpacity(0.32),
                              fontSize: 13),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.32))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.montserrat(
                              color: kTextInputPlaceholderColor.withOpacity(0.32),
                              fontSize: 13),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.32))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: houseNo,
                      decoration: InputDecoration(
                          hintText: "House No.. & Floor*",
                          hintStyle: GoogleFonts.montserrat(
                              color: kTextInputPlaceholderColor.withOpacity(0.32),
                              fontSize: 13),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.32))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: street,
                      decoration: InputDecoration(
                          hintText: "Street*",
                          hintStyle: GoogleFonts.montserrat(
                              color: kTextInputPlaceholderColor.withOpacity(0.32),
                              fontSize: 13),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.32))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: state,
                            decoration: InputDecoration(
                                hintText: "State*",
                                hintStyle: GoogleFonts.montserrat(
                                    color: kTextInputPlaceholderColor
                                        .withOpacity(0.32),
                                    fontSize: 13),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.32))),
                                contentPadding: EdgeInsets.only(left: w * 0.02)),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.05,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: pinCode,
                            decoration: InputDecoration(
                                hintText: "Pin Code*",
                                hintStyle: GoogleFonts.montserrat(
                                    color: kTextInputPlaceholderColor
                                        .withOpacity(0.32),
                                    fontSize: 13),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.32))),
                                contentPadding: EdgeInsets.only(left: w * 0.02)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.04,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Center(
                child: RRecctButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  h: h * 0.06,
                  w: w * 0.9,
                  buttonColor: kbluecolor,
                  text: "SAVE CHANGES",
                  style: GoogleFonts.montserrat(
                      color: kwhitecolor, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  editPic() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Want to change Profile Pic",
              style: GoogleFonts.montserrat(
                  color: kTextInputPlaceholderColor, fontSize: 18),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Yes",
                          style: GoogleFonts.montserrat(
                              color: kbluecolor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          "No",
                          style: GoogleFonts.montserrat(
                              color: kredcolor, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }

  imagePicker() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image;
    image = await _picker.pickImage(source: ImageSource.gallery);
    print("=======================================dvsdv${image!.path}");
    return image.path;
  }
}
