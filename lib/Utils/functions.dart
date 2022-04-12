// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';

// void showInSnackBar(String value, BuildContext context) {
//     Scaffold.of(context).showSnackBar( SnackBar(
//         content:  Text(value)
//     ));
//   }
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

imagePicker()async{

final ImagePicker _picker = ImagePicker();
final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
}