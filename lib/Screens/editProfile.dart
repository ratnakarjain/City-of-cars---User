// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cityofcars/Services/servies.dart';
import 'package:cityofcars/Utils/functions.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/Buttons/button.dart';
import '../Utils/constants.dart';
import 'bottomnavBar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var h;
  var w;
  var file;
  String image = "";
  String id = "";
  var prefs = Prefernece.pref;
  var name = TextEditingController();
  var mobile = TextEditingController();
  var email = TextEditingController();
  var houseNo = TextEditingController();
  var street = TextEditingController();
  var state = TextEditingController();
  var pinCode = TextEditingController();
  bool isImagePicked = false;
  String fcm = "";
  String filepath = "";
  var file2;
  @override
  void initState() {
    name.text = prefs!.getString("name").toString() == "null"
        ? ""
        : prefs!.getString("name").toString();
    id = prefs!.getString("id").toString() == "null"
        ? ""
        : prefs!.getString("id").toString();
    mobile.text = prefs!.getString("mobile").toString() == "null"
        ? ""
        : prefs!.getString("mobile").toString();
    email.text = prefs!.getString("email").toString() == "null"
        ? ""
        : prefs!.getString("email").toString();
    houseNo.text = prefs!.getString('houseno').toString() == "null"
        ? ""
        : prefs!.getString('houseno').toString();

    street.text = prefs!.getString("street").toString() == "null"
        ? ""
        : prefs!.getString("street").toString();
    state.text = prefs!.getString("state").toString() == "null"
        ? ""
        : prefs!.getString("state").toString();
    pinCode.text = prefs!.getString("pincode").toString() == "null"
        ? ""
        : prefs!.getString("pincode").toString();
    image = prefs!.getString("image").toString() == "null"
        ? ""
        : prefs!.getString("image").toString();
    print(image);
    token();
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
                    GestureDetector(
                      onTap: () async {
                        file2 = await pickfile(['pdf', 'doc'], FileType.custom);
                        if (file2 != null) {
                          filepath = file2.path.split('/').last.toString();
                          setState(() {});
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "My Documment     ",
                                style: GoogleFonts.montserrat(
                                    fontSize: 9, fontWeight: FontWeight.w700),
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
                                    color: kSelectedColor, fontSize: 8),
                                children: [
                                  TextSpan(
                                      text: "Insurance Policy\n",
                                      style: GoogleFonts.montserrat(
                                          color: kSelectedColor, fontSize: 8)),
                                  TextSpan(
                                      text: "Other\n",
                                      style: GoogleFonts.montserrat(
                                          color: kSelectedColor, fontSize: 8)),
                                ]),
                          ),
                          Visibility(
                            visible: filepath != "",
                            child: Text(
                              filepath,
                              style: GoogleFonts.montserrat(
                                  color: kSelectedColor, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          // editPic();
                          file = await imagePicker();
                          isImagePicked = true;
                          print("============================$file");
                          setState(() {});
                        },
                        child: Stack(
                          children: [
                            isImagePicked
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
                                : image.isEmpty || image == "null"
                                    ? Container(
                                        height: h * 0.06,
                                        width: h * 0.06,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "assets/images/ava1.png")
                                                //     image:  FileImage(
                                                //   File(file),
                                                // ):

                                                )),
                                      )
                                    : Container(
                                        height: h * 0.06,
                                        width: h * 0.06,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    image.toString())
                                                //     image:  FileImage(
                                                //   File(file),
                                                // ):

                                                )),
                                      ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: h * 0.0152,
                                  backgroundColor: kblackcolor,
                                  child: CircleAvatar(
                                    backgroundColor: kwhitecolor,
                                    radius: h * 0.015,
                                    child: Icon(
                                      Icons.edit,
                                      color: kTextInputPlaceholderColor
                                          .withOpacity(0.5),
                                      size: h * 0.02,
                                    ),
                                  ),
                                ))
                          ],
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
                          blurRadius: 5,
                          offset: Offset(0, 3),
                          color: Colors.grey)
                    ]),
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05, vertical: h * 0.03),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"))
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value == " ") {
                          name.clear();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Name*",
                          hintStyle: GoogleFonts.montserrat(
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.25),
                              fontSize: 13),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: mobile,
                      enabled: false,
                      onChanged: (value) {
                        if (value == " ") {
                          mobile.clear();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Mobile No.*",
                          hintStyle: GoogleFonts.montserrat(
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.25),
                              fontSize: 13),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: email,
                      onChanged: (value) {
                        if (value == " ") {
                          email.clear();
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r"\s")),
                        FilteringTextInputFormatter.deny(RegExp('[ ]')),
                      ],
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.montserrat(
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.25),
                              fontSize: 13),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: houseNo,
                      onChanged: (value) {
                        if (value == " ") {
                          houseNo.clear();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "House No.. & Floor*",
                          hintStyle: GoogleFonts.montserrat(
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.25),
                              fontSize: 13),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          contentPadding: EdgeInsets.only(left: w * 0.02)),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    TextFormField(
                      controller: street,
                      onChanged: (value) {
                        if (value == " ") {
                          street.clear();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Street*",
                          hintStyle: GoogleFonts.montserrat(
                              color:
                                  kTextInputPlaceholderColor.withOpacity(0.25),
                              fontSize: 13),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: kTextInputPlaceholderColor
                                      .withOpacity(0.25))),
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
                            onChanged: (value) {
                              if (value == " ") {
                                state.clear();
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "State*",
                                hintStyle: GoogleFonts.montserrat(
                                    color: kTextInputPlaceholderColor
                                        .withOpacity(0.25),
                                    fontSize: 13),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.25))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.25))),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.25))),
                                contentPadding:
                                    EdgeInsets.only(left: w * 0.02)),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.05,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: pinCode,
                            onChanged: (value) {
                              if (value == " ") {
                                pinCode.clear();
                              }
                            },
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: "Pin Code*",
                                hintStyle: GoogleFonts.montserrat(
                                    color: kTextInputPlaceholderColor
                                        .withOpacity(0.25),
                                    fontSize: 13),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.25))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.25))),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextInputPlaceholderColor
                                            .withOpacity(0.25))),
                                contentPadding:
                                    EdgeInsets.only(left: w * 0.02)),
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
                    bool validate = isValidation();
                    if (validate) {
                      editProfile(
                        id,
                        name.text,
                        email.text,
                        mobile.text,
                        houseNo.text,
                        street.text,
                        state.text,
                        pinCode.text,
                        fcm,
                        file == null ? null : File(file),
                        file2 == null ? null : file2,
                        context,
                      ).whenComplete(() =>
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => BottomNavBar(
                                index: 0,
                              ),
                            ),
                            (route) =>
                                false, //if you want to disable back feature set to false
                          ));
                    }
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

  bool isValidation() {
    if (name.text.toString().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please enter your name")));
      return false;
    } else {
      return true;
    }
  }

  token() {
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("token: " + value.toString());
      fcm = value.toString();
      Prefernece.pref!.setString("fcmtoken", fcm);

      print("new token: " + Prefernece.pref!.getString("fcmtoken").toString());
    });
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

    return image?.path;
  }
}
