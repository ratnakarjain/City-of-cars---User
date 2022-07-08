// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:cityofcars/Screens/Service%20Main/serviceMain.dart';
import 'package:cityofcars/Services/models/carHealthModel.dart';
import 'package:flutter/material.dart';
import 'package:cityofcars/Screens/Service%20Main/productDetail.dart';
import 'package:cityofcars/Services/models/jobcardModel.dart';
import 'package:cityofcars/Services/models/offersModel.dart';
import 'package:cityofcars/Services/models/orderhistoryModel.dart';
import 'package:cityofcars/Services/models/plansModel.dart';
import 'package:cityofcars/Services/models/subcategory.dart';
import 'package:cityofcars/Services/models/usercardetailsmodel.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/constants.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'models/ApprovalsModel.dart';
import 'models/blogModel.dart';
import 'models/faqModel.dart';
import 'models/messageModel.dart';
import 'models/paymentmodel.dart';
import 'models/recentsModel.dart';

bool isLoading = false;
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
  var url = Uri.parse(getcarData + "?brand_id=" + Ids.brandid);
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
  isLoading = true;
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        print(data["data"]);
        isLoading = false;
        return data["data"];
      } else {
        isLoading = false;
        return Future.error(data["msg"]);
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      isLoading = false;
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
  }
}

Future getfuel() async {
  var url = Uri.parse(getFuel + "?_id=" + Ids.carid);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        var list = data["data"][0]["fuel"];
        print(list);

        return list;
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
  print("token " + prefs!.getString('token').toString() + "^^");
  print("userId " + prefs!.getString("userId").toString() + "^^");
  var url = Uri.parse(getcategryUrl);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);

      if (data["status"]) {
        print(data["getdata"]);
        print(data["getdata"].length);
        return data["getdata"];
      } else {
        print(Future.error(data["msg"]));
        return [];
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      print(Future.error("Server Error"));
      return [];
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
  String houseNo,
  String street,
  String state,
  String pincode,
  String fcm,
  File? file,
  BuildContext context,
) async {
  var url = Uri.parse(editprofileUrl);

  try {
    var request = http.MultipartRequest("POST", url);
    request.headers['Authorization'] = prefs!.getString("token").toString();
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.fields['name'] = name.toString();
    request.fields['userId'] = id.toString();
    request.fields['mobile'] = mobile.toString();
    request.fields['email'] = email.toString();
    request.fields['Street'] = street.toString();
    request.fields['State'] = state.toString();
    request.fields['House'] = houseNo.toString();
    request.fields['fcmToken'] = fcm.toString();
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
          prefs!.setString('houseno', jsonRes["data"]["House"].toString());
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
  String car = "";
  if (prefs!.getString("CarId").toString() != "" &&
      prefs!.getString("CarId").toString() != "null") {
    String id = prefs!.getString("CarId").toString();
    print(id);

    car = "?carid=" + id + "&";
  } else {
    car = "?";
  }
  var url = Uri.parse(getSubcategoryUrl + car + "cateory_id=" + _id);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List<PlanModel> plans = [];
      List<SubcatModel> subcats = [];
      if (data["status"]) {
        for (int i = 0; i < data["plans"].length; i++) {
          PlanModel pl = PlanModel();
          pl.planid = data["plans"][i]["_id"].toString();
          pl.componyprice = data["plans"][i]["servicepackprice"].toString();
          // pl.componypricedes=data["plans"][i]["servicename"].toString();
          pl.description = data["plans"][i]["description"].toString();
          pl.hour = data["plans"][i]["hours"].toString();
          pl.isMost = data["plans"][i]["mostpopularpack"].toString();
          pl.isrec = data["plans"][i]["status"].toString();
          pl.label = data["plans"][i]["label"].toString();
          pl.months = data["plans"][i]["month"].toString();
          pl.planimage = data["plans"][i]["image"].toString();
          // pl.planname=data["plans"][i]["planName"].toString();
          // pl.planpricdes=data["plans"][i]["typename"].toString();
          // pl.planprice=data["plans"][i]["typeprice"].toString();
          pl.servicepackname = data["plans"][i]["servicepack"].toString();
          pl.subcatid = data["plans"][i]["Subcategory"].toString();
          // pl.subplanname=data["plans"][i]["subPlanName"].toString();
          pl.termsdetails = data["plans"][i]["textField"].toString();
          pl.termsheading = data["plans"][i]["heading"].toString();
          for (int j = 0; j < data["plans"][i]["services_id"].length; j++) {
            IncludeMod ink = IncludeMod();
            ink.image = data["plans"][i]["services_id"][j]["image"];
            ink.name = data["plans"][i]["services_id"][j]["title"];
            pl.includes.add(ink);
          }
          for (int j = 0; j < data["plans"][i]["plan"].length; j++) {
            Packes ink = Packes();
            ink.planName = data["plans"][i]["plan"][j]["planName"];
            ink.subPlanName = data["plans"][i]["plan"][j]["subPlanName"];
            ink.planPrice = data["plans"][i]["plan"][j]["typeprice"];
            ink.pricedes = data["plans"][i]["plan"][j]["typename"];
            ink.packId = data["plans"][i]["plan"][j]["_id"];
            pl.packs.add(ink);
          }
          plans.add(pl);
        }
        for (int i = 0; i < data["Subcategory"].length; i++) {
          SubcatModel mod = SubcatModel();
          mod.id = data["Subcategory"][i]["_id"];
          mod.name = data["Subcategory"][i]["title"];
          for (int j = 0; j < plans.length; j++) {
            if (plans[j].subcatid == mod.id) {
              mod.plans.add(plans[j]);
            }
          }
          subcats.add(mod);
        }
        print(jsonEncode(plans));
        print(jsonEncode(subcats));
        return subcats;
      } else {
        print(Future.error(data["msg"]));
        return <SubcatModel>[];
        // print(
        //   "Error====="
        // );
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      print(Future.error("Server Error"));
      return <SubcatModel>[];
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
    String city,
    String leti,
    String longi) async {
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
      "houseNo": houseNo,
      "city": city,
      "latitude": leti,
      "longitude": longi,
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

Future addcartitem(Packes packes) async {
  print("Category " + Ids.categoryid.toString() + "^^");
  print("subcategory " + Ids.subcategoryid.toString() + "^^");
  print("Plans " + Ids.planid.toString() + "^^");
  print("bookingdata " + Ids.slotid.toString() + "^^");
  print("selecetedPrice " + ProductDetails.selctedprice + "^^");
  print("user " + prefs!.getString("userId").toString() + "^^");
  print("CarId " + prefs!.getString("CarId").toString() + "^^");
  print("token " + prefs!.getString('token').toString() + "^^");
  var url = Uri.parse(addcartUrl);
  try {
    var response = await http.post(url, body: {
      "category": Ids.categoryid,
      "subcategory": Ids.subcategoryid,
      "Plans": Ids.planid,
      "bookingdata": Ids.slotid,
      "selecetedPrice": ProductDetails.selctedprice,
      "user": prefs!.getString("userId").toString(),
      "cars": prefs!.getString("CarId").toString(),
      "brand": prefs!.getString("brandId").toString(),
      "planName": packes.planName,
      "subPlanName": packes.subPlanName,
      "typeprice": packes.planPrice
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
  var url =
      Uri.parse(getcartUrl + "?user=" + prefs!.getString("userId").toString());
  print("UserId " + prefs!.getString("userId").toString() + "^^");
  print("token " + prefs!.getString('token').toString() + "^^");
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
  var url = Uri.parse(proceedUrl + "?userid=" + Ids.userid);
  try {
    var response = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data["data"]);
      // for (int i = 0; i < data.length; i++) {
      //   PaymentModel med = PaymentModel();
      //   med.planname = data["data"][i]["Plans"]["planName"].toString();
      //   med.price = data["data"][i]["Plans"]["typeprice"].toString();
      //   med.hour = data["data"][i]["Plans"]["hours"].toString();
      //   med.month = data["data"][i]["Plans"]["month"].toString();
      //   med.plotStreet = data["data"][i]["bookingdata"]["House"].toString() +
      //       " " +
      //       data["data"][i]["bookingdata"]["Street"].toString();
      //   med.cityCode = data["data"][i]["bookingdata"]["state"].toString() +
      //       " - " +
      //       data["data"][i]["bookingdata"]["pincode"].toString();
      //   med.option = data["data"][i]["bookingdata"]["optional"].toString();
      //   med.contect = data["data"][i]["bookingdata"]["contect"].toString();
      //   med.name = data["data"][i]["bookingdata"]["name"].toString();
      //   med.carno = data["data"][i]["bookingdata"]["carno"].toString();
      //   // totalvalue(double.parse(med.price));
      //   // list.add(med);
      //   // setState(() {});
      //   // print(list);
      // }
      return data["data"];
    }
  } catch (e) {
    print("error $e");
  }
}

Future addorder(String paymentid, String paymentstatus, String status1,
    String status2) async {
  var url = Uri.parse(addorderUrl);
  print("category " + Ids.categoryid.toString() + "^^");
  print("subcategory " + Ids.subcategoryid.toString() + "^^");
  print("Plans " + Ids.planid.toString() + "^^");
  print("bookingdata " + Ids.slotid.toString() + "^^");
  print("fuel " + Ids.fuelid.toString() + "^^");
  print("car " + Ids.carid.toString() + "^^");
  print("cart " + Ids.cartid.toString() + "^^");
  print("brand " + Ids.brandid.toString() + "^^");
  print("city " + Ids.cityid.toString() + "^^");
  print("user " + prefs!.getString("userId").toString() + "^^");
  print("status " + "^^");
  print("paymentStatus " + paymentstatus.toString() + "^^");
  print("paymentid " + paymentid.toString() + "^^");
  print("Authorization " + prefs!.getString('token').toString() + "^^");

  try {
    var response = await http.post(url, body: {
      "userid": prefs!.getString("userId").toString(),
      "paymentStatus": paymentstatus,
      "paymentid": paymentid,
      "status1": status1,
      "status2": status2,
    }, headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
      print("Response " + response.body.toString() + "");
      var data = jsonDecode(response.body);
      print(data);
      return data["order"];
    } else if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);
      // return data;
    } else {
      return false;
    }
  } catch (e) {
    print("error $e");
  }
}

Future ordersuccess(String id) async {
  var url = Uri.parse(ordersuccessUrl + "?id=" + id);
  try {
    var response = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
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
    var response = await http.post(url, body: {
      "user_id": prefs!.getString("userId").toString(),
      "order_id": Ids.orderid,
      "rating": rating,
      "review": "good"
    }, headers: {
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
    var response = await http.post(url, body: {
      "user": prefs!.getString("userId").toString(),
      "city": Ids.cityid,
      "brand": Ids.brandid,
      "car": Ids.carid,
      "fuel": Ids.fuelid
    }, headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data["msg"] ?? "Error";
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

Future getOrderhistory() async {
  print(prefs!.getString("userId").toString());
  var url = Uri.parse(
      getorderhistoryUrl + "?userid=" + prefs!.getString("userId").toString());
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List<OrderHistoryModel> modellist = [];
      if (data["status"]) {
        for (int i = 0; i < data["data"].length; i++) {
          OrderHistoryModel model = OrderHistoryModel();
          var list = data["data"][i];
          // model.carbrand=list["_id"] ;
          model.carimage = list["orderData"][0]["cars"]["image"].toString();
          model.carname = list["orderData"][0]["cars"]["cars"].toString();
          model.carbrand = list["orderData"][0]["brands"]["brands"].toString();
          model.deliverydate = list["date"].toString();
          model.deliverytime = list["time"].toString();
          // model.details=list["_id"];
          model.orderid = list["orderid"].toString();
          model.id = list["_id"].toString();
          if (list["orderData"][0]["selectplan"][0].toString() != "null") {
            model.packname =
                list["orderData"][0]["selectplan"][0]["planName"].toString();
            model.price =
                list["orderData"][0]["selectplan"][0]["typeprice"].toString();
            model.servicename =
                list["orderData"][0]["selectplan"][0]["subPlanName"].toString();
          }
          model.paystatus = list["paymentStatus"].toString();

          model.status = list["status"].toString();
          modellist.add(model);
        }
        // print(data["data"].toString());
        print(data["data"].length.toString());
        //  final Subcategory value = subcategoryFromJson(respnse.body);
        //  print(value.data!.length);
        // return data["data"];
        return modellist;
      } else {
        return <OrderHistoryModel>[];
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

Future getestimateTime(String id) async {
  var url = Uri.parse(getorderhistoryUrl + "?orderid=" + id);
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

Future getrecentUpdates(String _id) async {
  var url = Uri.parse(resentUpdateUrl + "?orderid=" + _id);
  try {
    var response = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (response.statusCode == 200) {
      // orders.clear();
      var data = jsonDecode(response.body);
      print(data);
      List<RecentModel> list = [];
      for (int i = 0; i < data["data"].length; i++) {
        RecentModel model = RecentModel();
        model.heading = data["data"][i]["heading"] ?? "";
        model.subheading = data["data"][i]["subheading"] ?? "";
        model.description = data["data"][i]["Description"] ?? "";
        model.file = data["data"][i]["image"] ?? "";
        model.time = data["data"][i]["time"] ?? "";
        model.type = data["data"][i]["type"] ?? "";
        list.add(model);
      }
      return list;
    } else {
      return <RecentModel>[];
    }
    //  if (response.statusCode == 201) {
    //   var data = jsonDecode(response.body);
    //   print(data);
    //   // return data;
    // }
  } catch (e) {
    print("error $e");
    return <RecentModel>[];
  }
}

Future getapproveddetails(String id) async {
  var url = Uri.parse(getApprovalsUrl + "?orderid=" + id);
  try {
    var response = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});

    if (response.statusCode == 200) {
      List<ApprovalModel1> modellist = [];
      var data = jsonDecode(response.body);
      print(data);
      if (data["status"] == true) {
        for (int i = 0; i < data["data"].length; i++) {
          ApprovalModel1 model = ApprovalModel1();
          model.id = data["data"][i]["_id"].toString();
          model.status = data["data"][i]["status"].toString();
          model.description = data["data"][i]["description"].toString();
          model.heading = data["data"][i]["heading"].toString();
          model.image = data["data"][i]["image"].toString();
          model.type = data["data"][i]["type"].toString();
          model.price = data["data"][i]["price"].toString();
          model.qty = data["data"][i]["qty"].toString();
          model.subheading = data["data"][i]["subheading"].toString();
          modellist.add(model);
        }
      }
      print(data);
      return modellist;
    } else {
      List<ApprovalModel1> modellist = [];

      return modellist;
    }
    //  if (response.statusCode == 201) {
    //   var data = jsonDecode(response.body);
    //   print(data);
    //   // return data;
    // }
  } catch (e) {
    print("error $e");
    return <ApprovalModel1>[];
  }
}

Future setApprooval(String id, String status, BuildContext context) async {
  var url = Uri.parse(postApprovedstatusUrl);
  try {
    var response = await http.post(url,
        body: {"aprovelid": id, "status": status},
        headers: {"Authorization": prefs!.getString('token').toString()});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["msg"])));
    } else {}
  } catch (e) {
    print("error $e");
  }
}

Future getjobcard(String id) async {
  var url = Uri.parse(getjobcardUrl + "?orderid=" + id);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      print("Response " + data.toString() + "&");
      // JobCardModel model = JobCardModel();
      if (data["status"]) {
        //   model.username = data["data"]["orderid"]["bookingdata"]["name"];
        //   model.address = data["data"]["orderid"]["bookingdata"]["houseNo"]+" "+data["data"]["orderid"]["bookingdata"]["Street"];
        //   model.city = data["data"]["orderid"]["bookingdata"]["houseNo"]+" "+data["data"]["orderid"]["bookingdata"]["Street"];
        //   model.carNo = data["data"]["orderid"]["bookingdata"]["carno"];
        //   model.carbrand = data["data"]["orderid"]["brand"]["brands"];
        //   model.carimage = data["data"]["orderid"]["brand"]["image"];
        //   model.carname = data["data"]["orderid"]["car"]["city"];
        //    var gn = jsonDecode(data["data"]["condition"]);
        //    for(int i = 0; i<gn.length; i++){
        //      Condtion cond = Condtion();
        //     //  cond.a = gn[i][];
        //      cond.g;
        //      cond.heading;
        //      cond.p;
        //      cond.x;
        //      model.condtion.add(cond);
        //    }

        //   model.frontL;
        //   model.frontR;
        //   model.backL;
        //   model.backR;
        //   model.images;
        //   model.odometer;
        //   model.avail;
        //   model.tyrename;
        //   model.batterycondtion;
        //   model.batteryname;
        //   model.remarks;
        //   model.gst = "";
        //   model.customersconcerns.addAll(data["data"]["customerConcerns"]);
        //   model.fuellevel = data["data"]["fuel"].toString();

        return data["data"];
      } else {
        return [];
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
    return [];
  }
}

Future getcategoryBanner() async {
  var url = Uri.parse(getcatBannerUrl);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List image = [];
      if (data["status"]) {
        for (int i = 0; i < data["data"].length; i++) {
          image.add(data["data"][i]["image"].toString());
        }
        return image;
      } else {
        return [];
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

Future getusercars() async {
  var url = Uri.parse(
      getusercarsUrl + "?userid=" + prefs!.getString("userId").toString());
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List<CarsModel> model = [];
      if (data["status"]) {
        for (int i = 0; i < data["data"].length; i++) {
          CarsModel mod = CarsModel();
          mod.carbrand = data["data"][i]["brand"]["brands"].toString();
          mod.carbrandimage = data["data"][i]["brand"]["image"].toString();
          mod.carfuel = data["data"][i]["fuel"]["fuel"].toString();
          mod.carfuelimage = data["data"][i]["fuel"]["image"].toString();
          mod.carimage = data["data"][i]["car"]["image"].toString();
          mod.carname = data["data"][i]["car"]["cars"].toString();
          mod.city = data["data"][i]["city"]["city"].toString();
          mod.cityimage = data["data"][i]["city"]["image"].toString();
          mod.cityid = data["data"][i]["city"]["_id"].toString();
          mod.carfuelid = data["data"][i]["fuel"]["_id"].toString();
          mod.carbrandid = data["data"][i]["brand"]["_id"].toString();
          mod.carid = data["data"][i]["car"]["_id"].toString();
          model.add(mod);
        }
        return model;
      } else {
        return <CarsModel>[];
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

Future getrecmostPlans() async {
  print("CAr Id " + prefs!.getString("CarId").toString() + "^");
  var url = Uri.parse(
      getpoprecUrl + "?carid=" + prefs!.getString("CarId").toString());
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List<PlanModel> plans = [];
      if (data["state"]) {
        for (int i = 0; i < data["data"].length; i++) {
          PlanModel pl = PlanModel();
          pl.planid = data["data"][i]["_id"].toString();
          pl.componyprice = data["data"][i]["servicepackprice"].toString();
          // pl.componypricedes=data["data"][i]["servicename"].toString();
          pl.description = data["data"][i]["description"].toString();
          pl.hour = data["data"][i]["hours"].toString();
          pl.isMost = data["data"][i]["mostpopularpack"].toString();
          pl.isrec = data["data"][i]["status"].toString();
          if (data["data"][i]["mostpopularpack"].toString() == "true") {
            mostdata = true;
          }
          if (data["data"][i]["status"].toString() == "true") {
            recdata = true;
          }
          pl.label = data["data"][i]["label"].toString();
          pl.months = data["data"][i]["month"].toString();
          pl.planimage = data["data"][i]["image"].toString();
          // pl.planname=data["data"][i]["planName"].toString();
          // pl.planpricdes=data["data"][i]["typename"].toString();
          // pl.planprice=data["data"][i]["typeprice"].toString();
          // pl.servicepackname=data["data"][i]["servicepack"].toString();
          pl.subcatid = data["data"][i]["Subcategory"].toString();
          pl.subplanname = data["data"][i]["subPlanName"].toString();
          pl.termsdetails = data["data"][i]["textField"].toString();
          pl.termsheading = data["data"][i]["heading"].toString();
          // print("ASA" +
          //     data["data"][i]["services_id"][0]["category"][0].toString() +
          //     "^^");
          // if(data["data"][i]["services_id"].length>0) {
          //   if (data["data"][i]["services_id"][0]["category"].length > 0) {
          //     pl.categoryId =
          //         data["data"][i]["services_id"][0]["category"][0].toString();
          //   }
          // }
          pl.categoryId = data["data"][i]["Category"].toString();
          for (int j = 0; j < data["data"][i]["services_id"].length; j++) {
            IncludeMod ink = IncludeMod();
            ink.image = data["data"][i]["services_id"][j]["image"];
            ink.name = data["data"][i]["services_id"][j]["title"];
            pl.includes.add(ink);
          }
          for (int j = 0; j < data["data"][i]["plan"].length; j++) {
            Packes ink = Packes();
            ink.planName = data["data"][i]["plan"][j]["planName"];
            ink.subPlanName = data["data"][i]["plan"][j]["subPlanName"];
            ink.planPrice = data["data"][i]["plan"][j]["typeprice"];
            ink.pricedes = data["data"][i]["plan"][j]["typename"];
            ink.packId = data["data"][i]["plan"][j]["_id"];
            pl.packs.add(ink);
          }
          plans.add(pl);
        }
        print("+++++" + jsonEncode(plans));
        return plans;
      } else {
        return [];
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

// Future postMess(String msg) async {
//   var url = Uri.parse(postmessageUrl);
//   try {
//     var respnse = await http.post(url, body: {
//       "sender_id": Ids.userid,
//       "message": msg,
//       "resive_id": "626259f89d1ec3425360af89"
//     }, headers: {
//       "Authorization": prefs!.getString('token').toString()
//     });
//     if (respnse.statusCode == 200) {
//       var data = jsonDecode(respnse.body);
//       if (data["status"]) {
//         return "success";
//       } else {
//         return "error";
//         // print(
//         //   "Error====="
//         // );
//       }
//       // Future city = data["getCities"];
//       // print("success============== ${data["getCities"]}");

//     } else {
//       return Future.error("Server Error");
//       print("Error=====");
//     }
//   } catch (e) {
//     print("error $e");
//   }
// }

// Future getMess() async {
//   var url = Uri.parse(getmessageUrl + "?Sender_id=" + Ids.userid);
//   try {
//     var respnse = await http.get(url,
//         headers: {"Authorization": prefs!.getString('token').toString()});
//     if (respnse.statusCode == 200) {
//       var data = jsonDecode(respnse.body);
//       if (data["status"]) {
//         return data["data"];
//       } else {
//         return "error";
//         // print(
//         //   "Error====="
//         // );
//       }
//       // Future city = data["getCities"];
//       // print("success============== ${data["getCities"]}");

//     } else {
//       return Future.error("Server Error");
//       print("Error=====");
//     }
//   } catch (e) {
//     print("error $e");
//   }
// }

Future postMess(String msg) async {
  var user = {};
  var str;
  try {
    var resBody = {};

    resBody["message"] = msg;
    resBody["type"] = "sender";
    user["sender_id"] = Ids.userid;
    user["resive_id"] = "626259f89d1ec3425360af89";
    user["conversation"] = resBody;
    user["fcmToken"] = "1223e412131asccwe";

    str = json.encode(user);
  } catch (e) {}

  var url = Uri.parse(postmessageUrl);
  try {
    print(str);
    print(url);
    var respnse = await http.post(url, body: str, headers: {
      "Authorization": prefs!.getString('token').toString(),
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        List<MessageModel> msg = [];
        msg = messageModelFromJson(jsonEncode(data["data"]["conversation"]));
        print(jsonEncode(msg));
        return msg;
      } else {
        return [];
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

Future getMess() async {
  var url = Uri.parse(getmessageUrl + "?Sender_id=" + Ids.userid);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        List<MessageModel> msg = [];
        msg = messageModelFromJson(jsonEncode(data["data"][0]["conversation"]));
        print(jsonEncode(msg));
        return msg;
      } else {
        return [];
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

Future getsubcatbanner() async {
  var url = Uri.parse(getsubcatBannerUrl);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List image = [];
      if (data["status"]) {
        for (int i = 0; i < data["data"].length; i++) {
          image.add(data["data"][i]["image"].toString());
        }
        return image;
      } else {
        return [];
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

Future getplanbanner() async {
  var url = Uri.parse(getplanBannerUrl);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List image = [];
      if (data["status"]) {
        for (int i = 0; i < data["data"].length; i++) {
          image.add(data["data"][i]["image"].toString());
        }
        return image;
      } else {
        return [];
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

Future getoffers() async {
  var url = Uri.parse(getofferUrl);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List<OffersModel> offers = [];
      if (data["status"]) {
        for (int i = 0; i < data["data"].length; i++) {
          var list = data["data"];
          OffersModel offersModel = OffersModel();
          offersModel.id = list[i]["_id"];
          offersModel.heading = list[i]["heading"];
          offersModel.des = list[i]["offerdiscreption"];
          offersModel.discount = list[i]["Discount"];
          offersModel.image = list[i]["image"];
          offersModel.status = list[i]["status"] ?? false;
          offers.add(offersModel);
        }
        return offers;
      } else {
        return <OffersModel>[];
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

Future feedback(
  String rating,
  String optional,
  String id,
  String review,
) async {
  var url = Uri.parse(feedbackUrl);
  try {
    var respnse = await http.post(url, headers: {
      "Authorization": prefs!.getString('token').toString()
    }, body: {
      "Rating": rating,
      "ServiceQuality": review,
      "Optional": optional,
      "orderid": id,
      "fcmToken":"1"
    });
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      return data;
    } else {
      return Future.error("Server Error");
    }
  } catch (e) {
    print("error $e");
  }
}

Future getblog() async {
  var url = Uri.parse(blogUrl);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      List<BlogsModel> blogs = [];
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        blogs = blogsModelFromJson(jsonEncode(data["data"]));
        return blogs;
      }
      return <BlogsModel>[];
    } else {
      return <BlogsModel>[];
    }
  } catch (e) {
    print("error $e");
  }
}

Future getCarHealth(String id) async {
  var url = Uri.parse(carhealthUrl + "?orderId=" + id);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        var qwe = data["data"].first;
        print(qwe);
        CarHealthModel carHealthModel = CarHealthModel();
        carHealthModel.overallhealth = qwe["overalcarhealth"];
        carHealthModel.carName =
            qwe["order"]["orderData"][0]["cars"]["cars"].toString();
        carHealthModel.brandName =
            qwe["order"]["orderData"][0]["brands"]["brands"].toString();

        var list = jsonDecode(qwe["MainHealth"]);
        carHealthModel.totalServices = prefs!.getInt("totalServices");
        for (int i = 0; i < list.length; i++) {
          CarParts parts = CarParts();
          parts.partName = list[i]["heading"];
          parts.rating = list[i]["rate"];
          parts.des = list[i]["description"];
          carHealthModel.carparts.add(parts);
        }
        return carHealthModel;
      }
      return CarHealthModel;
    } else {
      return CarHealthModel;
    }
  } catch (e) {
    print("error $e");
    return "error";
  }
}

Future searchGloble(String text) async {
  // print("id" + text.toString() + "========");
  // String car = "";
  // if (prefs!.getString("CarId").toString() != "" &&
  //     prefs!.getString("CarId").toString() != "null") {
  //   String id = prefs!.getString("CarId").toString();
  //   print(id);

  //   car = "?carid=" + id + "&";
  // } else {
  //   car = "?";
  // }
  var url = Uri.parse(globalsearchUrl + "?text=" + text);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      // ServiceMain.plans.clear();
      // ServiceMain.category.clear();
      List<PlanModel> plans = [];
      List<SubcatModel> subcats = [];
      if (data["status"]) {
        var categotry = data["searchData"][0]["category"];
        for (int i = 0; i < data["searchData"][2]["plan"].length; i++) {
          var qwe = data["searchData"][2]["plan"][i];
          PlanModel pl = PlanModel();
          pl.planid = qwe["_id"].toString();
          pl.componyprice = qwe["servicepackprice"].toString();
          // pl.componypricedes=qwe["servicename"].toString();
          pl.description = qwe["description"].toString();
          pl.hour = qwe["hours"].toString();
          pl.isMost = qwe["mostpopularpack"].toString();
          pl.isrec = qwe["status"].toString();
          if (qwe["mostpopularpack"].toString() == "true") {
            mostdata = true;
          }
          if (qwe["status"].toString() == "true") {
            recdata = true;
          }
          pl.label = qwe["label"].toString();
          pl.months = qwe["month"].toString();
          pl.planimage = qwe["image"].toString();
          // pl.planname=qwe["planName"].toString();
          // pl.planpricdes=qwe["typename"].toString();
          // pl.planprice=qwe["typeprice"].toString();
          pl.servicepackname = qwe["servicepack"].toString();
          pl.subcatid = qwe["Subcategory"].toString();
          // pl.subplanname=qwe["subPlanName"].toString();
          pl.termsdetails = qwe["textField"].toString();
          pl.termsheading = qwe["heading"].toString();
          // for (int j = 0; j < qwe["services_id"].length; j++) {
          //   IncludeMod ink = IncludeMod();
          //   ink.image = qwe["services_id"][j]["image"];
          //   ink.name = qwe["services_id"][j]["title"];
          //   pl.includes.add(ink);
          // }

          for (int j = 0; j < qwe["plan"].length; j++) {
            Packes ink = Packes();
            ink.planName = qwe["plan"][j]["planName"];
            ink.subPlanName = qwe["plan"][j]["subPlanName"];
            ink.planPrice = qwe["plan"][j]["typeprice"];
            ink.pricedes = qwe["plan"][j]["typename"];
            ink.packId = qwe["plan"][j]["_id"];
            pl.packs.add(ink);
          }
          plans.add(pl);
        }
        for (int i = 0;
            i < data["searchData"][1]["getsubcategory"].length;
            i++) {
          var qwe = data["searchData"][1]["getsubcategory"][i];
          SubcatModel mod = SubcatModel();
          mod.id = qwe["_id"];
          mod.name = qwe["title"];
          for (int j = 0; j < plans.length; j++) {
            if (plans[j].subcatid == mod.id) {
              mod.plans.add(plans[j]);
            }
          }
          subcats.add(mod);
        }
        print("plans" + jsonEncode(plans));
        print("subcats" + jsonEncode(subcats));

        Searchdata.cats = null;
        Searchdata.plans.clear();
        Searchdata.subcat.clear();
        Searchdata.cats = categotry;
        Searchdata.plans.addAll(plans);
        Searchdata.subcat.addAll(subcats);
        print("working");
        return true;
      } else {
        print(Future.error(data["msg"]));
        print("not working");

        return false;
        // print(
        //   "Error====="
        // );
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      print(Future.error("Server Error"));
      return <SubcatModel>[];
      print("Error=====");
    }
  } catch (e) {
    print("error $e");
  }
}

Future sendfcm() async {
  var url = Uri.parse(fcmtoken);
  try {
    var respnse = await http.post(url,
        body: {"fcmtoken": prefs!.getString("fcmtoken")},
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      print("Success");
    }
  } catch (e) {
    print("error $e");
  }
}

Future getcmsdata() async {
  var url = Uri.parse(cmsPagesUrl);
  try {
    var respnse = await http.get(
      url,

      // headers: {"Authorization": prefs!.getString('token').toString()}
    );
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      var terms = data["data"][0]["Terms_Conditions"] ?? "";
      var us = data["data"][0]["About"] ?? "";
      var pp = data["data"][0]["Privacy_Policy"] ?? "";
      prefs!.setString("terms", terms);
      prefs!.setString("us", us);
      prefs!.setString("pp", pp);
      print("Success");
    }
  } catch (e) {
    print("error $e");
  }
}

Future getfaq() async {
  var url = Uri.parse(faqUrl);
  try {
    var respnse = await http.get(
      url,

      headers: {"Authorization": prefs!.getString('token').toString()}
    );
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List<FaqModel> list =faqModelFromJson(jsonEncode(data["data"]));
      
      print("Success");
      return list;
    }else{
      return <FaqModel>[];
    }
  } catch (e) {
    print("error $e");
  }
}
