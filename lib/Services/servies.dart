// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:cityofcars/Services/models/citiesModel.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
var prefs = Prefernece.pref;

Future getcities()async{
  var url = Uri.parse(getCities);
  try {
    var respnse = await  http.get(
      url,
      headers:{"Authorization": prefs!.getString('token').toString()}
    );
    if(respnse.statusCode==200){
      var data = jsonDecode(respnse.body);
      if(data["status"]){
        print(data["data"]);
        return data["data"];
      }else{
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");
      
      
    }else{
      return Future.error("Server Error");
    }
  } catch (e) {
    print(
      "error $e"
    );
  }
}
Future getCarData()async{
  var url = Uri.parse(getcarData);
  try {
    var respnse = await  http.get(
      url,
      headers:{"Authorization": prefs!.getString('token').toString()}
    );
    if(respnse.statusCode==200){
      var data = jsonDecode(respnse.body);
      if(data["status"]){
        print(data["data"]);
        return data["data"];
      }else{
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");
      
      
    }else{
      return Future.error("Server Error");
    }
  } catch (e) {
    print(
      "error $e"
    );
  }
}

Future getBrandss()async{
  var url = Uri.parse(getBrands);
  try {
    var respnse = await  http.get(
      url,
      headers:{"Authorization": prefs!.getString('token').toString()}
    );
    if(respnse.statusCode==200){
      var data = jsonDecode(respnse.body);
      if(data["status"]){
        print(data["data"]);
        return data["data"];
      }else{
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");
      
      
    }else{
      return Future.error("Server Error");
    }
  } catch (e) {
    print(
      "error $e"
    );
  }
}

Future getfuel()async{
  var url = Uri.parse(getFuel);
  try {
    var respnse = await  http.get(
      url,
      headers:{"Authorization": prefs!.getString('token').toString()}
    );
    if(respnse.statusCode==200){
      var data = jsonDecode(respnse.body);
      if(data["status"]){
        print(data["data"]);
        return data["data"];
      }else{
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");
      
      
    }else{
      return Future.error("Server Error");
    }
  } catch (e) {
    print(
      "error $e"
    );
  }
}


Future getcategaries()async{
  var url = Uri.parse(getcategryUrl);
  try {
    var respnse = await  http.get(
      url,
      headers:{"Authorization": prefs!.getString('token').toString()}
    );
    if(respnse.statusCode==200){
      var data = jsonDecode(respnse.body);
      print(respnse.body);
      if(data["status"]){
        print(data["getdata"]);
        print(data["getdata"].length);
        return data["getdata"];
      }else{
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");
      
      
    }else{
      return Future.error("Server Error");
    }
  } catch (e) {
    print(
      "error $e"
    );
  }
}

Future editProfile(
  String id,
  String name,
  String email,
  String mobile,
  // String houseNo,
  String street,
  String state,
  String pincode,
  File? file,
  BuildContext context,
)async{
  var url = Uri.parse(editprofileUrl);
   
    try {
      var request = http.MultipartRequest("POST", url);
      request.headers['Authorization'] = prefs!.getString("token").toString();
      request.fields['name'] = name.toString();
      request.fields['_id'] = id.toString();
      request.fields['mobile'] = mobile.toString();
      request.fields['email'] = email.toString();
      request.fields['Street'] = street.toString();
      request.fields['State'] = state.toString();
      // request.fields['house'] = houseNo.toString();
      request.fields['PinCode'] = pincode.toString();
      // request.fields['type'] = "Scout";
      if(file != null){
      request.files.add(http.MultipartFile(
          'image',
          File(file.path).readAsBytes().asStream(),
          File(file.path).lengthSync(),
          filename: file.path.split('/').last));
      }

      await request.send().then((response) async {
        if (response.statusCode == 200) {
          print("Uploaded!");
          var respone = await response.stream.bytesToString();
          const JsonDecoder _decoder = JsonDecoder();
          var jsonRes;
          jsonRes = _decoder.convert(respone.toString());
          print("Response: " + jsonRes.toString() + "_");
          print(jsonRes["status"]);
          if (jsonRes["status"].toString() == "true") {
            print(jsonRes);
            prefs!.setString('name', jsonRes["data"]["name"].toString());
            prefs!.setString('image', jsonRes["data"]["image"].toString());
            prefs!.setString('mobile', jsonRes["data"]["mobile"].toString());
            prefs!.setString('street', jsonRes["data"]["Street"].toString());
            prefs!.setString('state', jsonRes["data"]["State"].toString());
            prefs!.setString('pincode', jsonRes["data"]["PinCode"].toString());
            prefs!.setString('email', jsonRes["data"]["email"].toString());


            print(prefs!.getString('name'));
            print(prefs!.getString('image'));
            print(prefs!.getString('mobile'));
            print(prefs!.getString('street'));
            print(prefs!.getString('state'));
            print(prefs!.getString('pincode'));
            print(prefs!.getString('email'));

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(jsonRes["message"].toString())));
            // Navigator.of(context).pop();
            // Navigator.push(
            // context,
            // MaterialPageRoute(
            //   builder: (context) => const Verfication(),
            // ));
            
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(jsonRes["message"].toString())));
            
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Please try later")));
          
        }
      });
    } catch (e) {
      // ignore: avoid_print
      print("error $e");
    }
    }

    Future searchCity(String city)async{
  var url = Uri.parse(searchCityUrl+"?city="+city);
  try {
    var respnse = await  http.get(
      url,
      headers:{"Authorization": prefs!.getString('token').toString()}
    );
    if(respnse.statusCode==200){
      var data = jsonDecode(respnse.body);
      if(data["status"]){
        print(data["data"]);
        print(data["data"].length);
        return data["data"];
      }else{
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");
      
      
    }else{
      return Future.error("Server Error");
    }
  } catch (e) {
    print(
      "error $e"
    );
  }
}
   Future searchBrand(String brand)async{
  var url = Uri.parse(searchBrandUrl+"?brand="+brand);
  try {
    var respnse = await  http.get(
      url,
      headers:{"Authorization": prefs!.getString('token').toString()}
    );
    if(respnse.statusCode==200){
      var data = jsonDecode(respnse.body);
      if(data["status"]){
        print(data["data"]);
        print(data["data"].length);
        return data["data"];
      }else{
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");
      
      
    }else{
      return Future.error("Server Error");
    }
  } catch (e) {
    print(
      "error $e"
    );
  }
}