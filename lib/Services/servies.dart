// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:cityofcars/Services/models/subcategory.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

var prefs = Prefernece.pref;

Future getcities() async {
  var url = Uri.parse(getCities);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        print(data["data"]);
        return data["data"];
      } else {
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
  }
}

Future getCarData() async {
  var url = Uri.parse(getcarData);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        print(data["data"]);
        return data["data"];
      } else {
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
  }
}

Future getBrandss() async {
  var url = Uri.parse(getBrands);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        print(data["data"]);
        return data["data"];
      } else {
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
  }
}

Future getfuel() async {
  var url = Uri.parse(getFuel);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        print(data["data"]);
        return data["data"];
      } else {
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
  }
}

Future getcategaries() async {
  var url = Uri.parse(getcategryUrl);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      print(respnse.body);
      if (data["status"]) {
        print(data["getdata"]);
        print(data["getdata"].length);
        return data["getdata"];
      } else {
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
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
) async {
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
    if (file != null) {
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

Future searchCity(String city) async {
  var url = Uri.parse(searchCityUrl + "?City=" + city);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        print(data["data"]);
        print(data["data"].length);
        return data["data"];
      } else {
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
  }
}

Future searchBrand(String brand) async {
  var url = Uri.parse(searchBrandUrl + "?brands=" + brand);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        print(data["data"]);
        print(data["data"].length);
        return data["data"];
      } else {
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
  }
}

//    Future <Subcategory?> getSubcategory(String _id)async{
//   var url = Uri.parse(getSubcategoryUrl+"?categoryid="+_id);
//   try {
//     var respnse = await  http.get(
//       url,
//       headers:{"Authorization": prefs!.getString('token').toString()}
//     );
//     if(respnse.statusCode==200){
//       var data = jsonDecode(respnse.body);
//       if(data["status"]){
//         // print(data["data"].toString());
//         // print(data["data"].length.toString());
//        final Subcategory value = subcategoryFromJson(respnse.body);
//        print(value.data!.length);
//         // return data["data"];
//         return value;
//       }else{
//         // return Future.error(data["msg"]);
//         print(
//           "Error====="
//         );
//       }
//       // Future city = data["getCities"];
//       // print("success============== ${data["getCities"]}");

//     }else{
//       // return Future.error("Server Error");
//       print(
//           "Error====="
//         );
//     }
//   } catch (e) {
//     print(
//       "error $e"
//     );
//   }
// }

Future getSubcategory(String _id) async {
  print("id" + _id.toString() + "========");
  var url = Uri.parse(getSubcategoryUrl + "?categoryid=" + _id);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        // print(data["data"].toString());
        print(data["data"].length.toString());
        //  final Subcategory value = subcategoryFromJson(respnse.body);
        //  print(value.data!.length);
        // return data["data"];
        return data["data"];
      } else {
        return Future.error(data["msg"]);
        // print(
        //   "Error====="
        // );
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
      print("Error=====");
    }
  } catch (e) {
    print("error $e");
  }
}

Future slot(
  String name,
  String mail,
  String contact,
  String carNo,
  String houseNo,
  String state,
  String street,
  String pinCode,
  String option,
  String date,
  String time,
) async {
  var url = Uri.parse(slotUrl);
  try {
    var response = await http.post(url, body: {
      "date": date,
      "time": time,
      "Street": street,
      "state": state,
      "pincode": pinCode,
      "name": name,
      "email": mail,
      "carno": carNo,
      "contect": contact,
      "optional": option,
      "houseNo": houseNo
    }, headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data["data"];
    }
  } catch (e) {
    print("error $e");
  }
}

Future addcartitem() async {
  var url = Uri.parse(addcartUrl);
  try {
    var response = await http.post(url, body: {
      "category": Ids.categoryid,
      "subcategory": Ids.subcategoryid,
      "Plans": Ids.planid,
      "bookingdata": Ids.slotid,
    }, headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Ids.cartid = data["data"]["_id"];
      print(Ids.cartid + "123456789012345678901234567890");
      print(data);
      return data;
    }
  } catch (e) {
    print("error $e");
  }
}

Future getcartitems() async {
  var url = Uri.parse(getcartUrl);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        // print(data["data"].toString());
        print(data["data"].length.toString());
        //  final Subcategory value = subcategoryFromJson(respnse.body);
        //  print(value.data!.length);
        // return data["data"];
        return data["data"];
      } else {
        return Future.error(data["msg"]);
        // print(
        //   "Error====="
        // );
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      return Future.error("Server Error");
      print("Error=====");
    }
  } catch (e) {
    print("error $e");
  }
}

Future deletecartitem(String _id) async {
  var url = Uri.parse(deletecartUrl);
  try {
    var response = await http.post(url,
        body: {"cartid": _id},
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    }
  } catch (e) {
    print("error $e");
  }
}

Future sos(String number, String problem) async {
  var url = Uri.parse(sosUrl);
  try {
    var response = await http.post(url,
        body: {"text": problem, "MobileNo": number},
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    }
  } catch (e) {
    print("error $e");
  }
}

Future proceed() async {
  var url = Uri.parse(proceedUrl);
  try {
    var response = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data["data"]);
      return data["data"];
    }
  } catch (e) {
    print("error $e");
  }
}

Future addorder() async {
  var url = Uri.parse(addorderUrl);
  try {
    var response = await http.post(url, body: {
      "category": Ids.categoryid,
      "subcategory": Ids.subcategoryid,
      "Plans": Ids.planid,
      "bookingdata": Ids.slotid,
      "fuel":Ids.fuelid,
      "car":Ids.carid,
      "brand":Ids.brandid,
      "city":Ids.cityid,
      "user":Ids.userid
    }, headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data["data"];
    }
     if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);
      // return data;
    }
  } catch (e) {
    print("error $e");
  }
}

Future ordersuccess(String id) async {
  var url = Uri.parse(ordersuccessUrl+"?id="+id);
  try {
    var response = await http.get(url,  headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data["data"];
    }
    //  if (response.statusCode == 201) {
    //   var data = jsonDecode(response.body);
    //   print(data);
    //   // return data;
    // }
  } catch (e) {
    print("error $e");
  }
}
Future rating(String rating) async {
  var url = Uri.parse(ratingUrl);
  try {
    var response = await http.post(url,body: {
       "user_id":Ids.userid,
    "order_id":Ids.orderid,
    "rating":rating,
    "review":"good"
    },  headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data["msg"];
    }
    //  if (response.statusCode == 201) {
    //   var data = jsonDecode(response.body);
    //   print(data);
    //   // return data;
    // }
  } catch (e) {
    print("error $e");
  }
}
Future addusercitycardata() async {
  var url = Uri.parse(usercardataUrl);
  try {
    var response = await http.post(url,body: {
      
    "user":Ids.userid,
    "city":Ids.cityid,
    "brand":Ids.brandid,
    "car":Ids.carid,
    "fuel":Ids.fuelid
    },  headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data["msg"]??"Error";
    }
    //  if (response.statusCode == 201) {
    //   var data = jsonDecode(response.body);
    //   print(data);
    //   // return data;
    // }
  } catch (e) {
    print("error $e");
  }
}
