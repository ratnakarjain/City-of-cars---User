// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:cityofcars/Screens/Service%20Main/productDetail.dart';
import 'package:cityofcars/Services/models/jobcardModel.dart';
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
import 'models/paymentmodel.dart';
import 'models/recentsModel.dart';

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
  var url = Uri.parse(getcarData+"?brand_id="+Ids.brandid);
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
  print("token "+prefs!.getString('token').toString()+"^^");
  print("userId "+prefs!.getString("userId").toString()+"^^");
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
        print(Future.error(data["msg"]));
        return [];
      }
      // Future city = data["getCities"];
      // print("success============== ${data["getCities"]}");

    } else {
      print(Future.error("Server Error"));
      return[]; 
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
  String car="";
  if(prefs!.getString("CarId").toString()!=""&&prefs!.getString("CarId").toString()!="null"){
    
                                            
    String id = prefs!.getString("CarId").toString();
    print(id);

    car= "?carid="+id+"&";
  }else{
    car="?";
  }
  var url = Uri.parse(getSubcategoryUrl+ car + "cateory_id=" + _id);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      List<PlanModel> plans = [];
      List<SubcatModel> subcats = [];
      if (data["status"]) {
        for(int i = 0 ; i<data["plans"].length;i++){
          PlanModel pl = PlanModel();
          pl.planid=data["plans"][i]["_id"].toString();
          pl.componyprice=data["plans"][i]["servicepackprice"].toString();
          // pl.componypricedes=data["plans"][i]["servicename"].toString();
          pl.description=data["plans"][i]["description"].toString();
          pl.hour=data["plans"][i]["hours"].toString();
          pl.isMost=data["plans"][i]["mostpopularpack"].toString();
          pl.isrec=data["plans"][i]["status"].toString();
          pl.label=data["plans"][i]["label"].toString();
          pl.months=data["plans"][i]["month"].toString();
          pl.planimage=data["plans"][i]["image"].toString();
          // pl.planname=data["plans"][i]["planName"].toString();
          // pl.planpricdes=data["plans"][i]["typename"].toString();
          // pl.planprice=data["plans"][i]["typeprice"].toString();
          pl.servicepackname=data["plans"][i]["servicepack"].toString();
          pl.subcatid=data["plans"][i]["Subcategory"].toString();
          // pl.subplanname=data["plans"][i]["subPlanName"].toString();
          pl.termsdetails=data["plans"][i]["textField"].toString();
          pl.termsheading=data["plans"][i]["heading"].toString();
          for(int j = 0 ; j<data["plans"][i]["services_id"].length;j++){
            IncludeMod ink = IncludeMod();
            ink.image=data["plans"][i]["services_id"][j]["image"];
            ink.name=data["plans"][i]["services_id"][j]["title"];
            pl.includes.add(ink);
          }
          for(int j = 0 ; j<data["plans"][i]["plan"].length;j++){
            Packes ink = Packes();
            ink.planName=data["plans"][i]["plan"][j]["planName"];
            ink.subPlanName=data["plans"][i]["plan"][j]["subPlanName"];
            ink.planPrice=data["plans"][i]["plan"][j]["typeprice"];
            ink.pricedes=data["plans"][i]["plan"][j]["typename"];
            ink.packId=data["plans"][i]["plan"][j]["_id"];
            pl.packs.add(ink);
          }
          plans.add(pl);


        }
        for(int i=0;i<data["Subcategory"].length;i++){
          SubcatModel mod = SubcatModel();
          mod.id=data["Subcategory"][i]["_id"];
          mod.name=data["Subcategory"][i]["title"];
          for(int j = 0;j<plans.length;j++){
            if(plans[j].subcatid==mod.id){
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

Future addcartitem(Packes packes) async {
  print("Category "+Ids.categoryid.toString()+"^^");
  print("subcategory "+Ids.subcategoryid.toString()+"^^");
  print("Plans "+Ids.planid.toString()+"^^");
  print("bookingdata "+Ids.slotid.toString()+"^^");
  print("selecetedPrice "+ProductDetails.selctedprice+"^^");
  print("user "+prefs!.getString("userId").toString()+"^^");
  print("CarId "+prefs!.getString("CarId").toString()+"^^");
  print("token "+prefs!.getString('token').toString()+"^^");
  var url = Uri.parse(addcartUrl);
  try {
    var response = await http.post(url, body: {
      "category": Ids.categoryid,
      "subcategory": Ids.subcategoryid,
      "Plans": Ids.planid,
      "bookingdata": Ids.slotid,
      "selecetedPrice":ProductDetails.selctedprice,
      "user": prefs!.getString("userId").toString(),
      "cars": prefs!.getString("CarId").toString(),
      "planName":packes.planName,
      "subPlanName":packes.subPlanName,
      "typeprice":packes.planPrice
      
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
  print("UserId "+prefs!.getString("userId").toString()+"^^");
  print("token "+prefs!.getString('token').toString()+"^^");
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
  var url = Uri.parse(proceedUrl+"?userid="+Ids.userid);
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

Future addorder(String paymentid, String paymentstatus) async {
  var url = Uri.parse(addorderUrl);
  print("cartID "+Ids.cartid.toString()+"^^");
  try {
    var response = await http.post(url, body: {
      "category": Ids.categoryid.toString(),
      "subcategory": Ids.subcategoryid.toString(),
      "Plans": Ids.planid.toString(),
      "bookingdata": Ids.slotid.toString(),
      "fuel": Ids.fuelid.toString(),
      "car": Ids.carid.toString(),
      "cart": Ids.cartid.toString(),
      "brand": Ids.brandid.toString(),
      "city": Ids.cityid.toString(),
      "user": prefs!.getString("userId").toString(),
      "status": "",
      "paymentStatus": paymentstatus,
      "paymentid": paymentid
    }, headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (response.statusCode == 200) {
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
          // model.carbrand=data["data"][i]["_id"] ;
          model.carimage = data["data"][i]["car"]["image"].toString();
          model.carname = data["data"][i]["car"]["cars"].toString();
          // model.deliverydate=data["data"][i]["_id"];
          // model.details=data["data"][i]["_id"];
          model.orderid = data["data"][i]["orderid"].toString();
          model.id = data["data"][i]["_id"].toString();
         if(data["data"][i]["Plans"].toString()!="null") {
           model.packname = data["data"][i]["Plans"]["planName"].toString();
           model.price = data["data"][i]["Plans"]["typeprice"].toString();
           model.servicename =
               data["data"][i]["Plans"]["servicepack"].toString();
         }
          model.paystatus = data["data"][i]["paymentStatus"].toString();

          model.status = data["data"][i]["status"].toString();
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
          model.status = data["data"][i]["status"].toString();
          model.description = data["data"][i]["description"].toString();
          model.heading = data["data"][i]["heading"].toString();
          model.image = data["data"][i]["image"].toString();
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
  }
}

Future setApprooval(String id, String status, BuildContext context) async {
  var url = Uri.parse(postApprovedstatusUrl);
  try {
    var response = await http.post(url,
        body: {"aprovelid": id, "status": status},
        headers: {"Authorization": prefs!.getString('token').toString()});

    if (response.statusCode == 200) {
      List<ApprovalModel1> modellist = [];
      var data = jsonDecode(response.body);
      print(data);

      // print(data);
      // return modellist;
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
  }
}

Future getjobcard(String id) async {
  var url = Uri.parse(getjobcardUrl + "?orderid=" + id);
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {

      var data = jsonDecode(respnse.body);
      print("Response "+data.toString()+"&");
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
  print("CAr Id "+prefs!.getString("CarId").toString()+"^");
  var url = Uri.parse(getpoprecUrl+"?carid="+prefs!.getString("CarId").toString());
  try {
    var respnse = await http.get(url,
        headers: {"Authorization": prefs!.getString('token').toString()});
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
       List<PlanModel> plans = [];
      if (data["state"]) {
        for(int i = 0 ; i<data["data"].length;i++){
          PlanModel pl = PlanModel();
          pl.planid=data["data"][i]["_id"].toString();
          pl.componyprice=data["data"][i]["servicepackprice"].toString();
          // pl.componypricedes=data["data"][i]["servicename"].toString();
          pl.description=data["data"][i]["description"].toString();
          pl.hour=data["data"][i]["hours"].toString();
          pl.isMost=data["data"][i]["mostpopularpack"].toString();
          pl.isrec=data["data"][i]["status"].toString();
          pl.label=data["data"][i]["label"].toString();
          pl.months=data["data"][i]["month"].toString();
          pl.planimage=data["data"][i]["image"].toString();
          // pl.planname=data["data"][i]["planName"].toString();
          // pl.planpricdes=data["data"][i]["typename"].toString();
          // pl.planprice=data["data"][i]["typeprice"].toString();
          // pl.servicepackname=data["data"][i]["servicepack"].toString();
          pl.subcatid=data["data"][i]["Subcategory"].toString();
          pl.subplanname=data["data"][i]["subPlanName"].toString();
          pl.termsdetails=data["data"][i]["textField"].toString();
          pl.termsheading=data["data"][i]["heading"].toString();
          print("ASA"+data["data"][i]["services_id"][0]["category"][0].toString()+"^^");
          // if(data["data"][i]["services_id"].length>0) {
          //   if (data["data"][i]["services_id"][0]["category"].length > 0) {
          //     pl.categoryId =
          //         data["data"][i]["services_id"][0]["category"][0].toString();
          //   }
          // }
          pl.categoryId =
                  data["data"][i]["Category"].toString();
          for(int j = 0 ; j<data["data"][i]["services_id"].length;j++){
            IncludeMod ink = IncludeMod();
            ink.image=data["data"][i]["services_id"][j]["image"];
            ink.name=data["data"][i]["services_id"][j]["title"];
            pl.includes.add(ink);
          }
          for(int j = 0 ; j<data["data"][i]["plan"].length;j++){
            Packes ink = Packes();
            ink.planName=data["data"][i]["plan"][j]["planName"];
            ink.subPlanName=data["data"][i]["plan"][j]["subPlanName"];
            ink.planPrice=data["data"][i]["plan"][j]["typeprice"];
            ink.pricedes=data["data"][i]["plan"][j]["typename"];
            ink.packId=data["data"][i]["plan"][j]["_id"];
            pl.packs.add(ink);
          }
          plans.add(pl);


        }
        print(jsonEncode(plans));
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

Future postMess(String msg) async {
  var url = Uri.parse(postmessageUrl);
  try {
    var respnse = await http.post(url, body: {
      "sender_id": Ids.userid,
      "message": msg,
      "resive_id": "626259f89d1ec3425360af89"
    }, headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        return "success";
      } else {
        return "error";
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

Future getMess() async {
  
  var url = Uri.parse(getmessageUrl+"?Sender_id="+Ids.userid);
  try {
    var respnse = await http.get(url, 
     headers: {
      "Authorization": prefs!.getString('token').toString()
    });
    if (respnse.statusCode == 200) {
      var data = jsonDecode(respnse.body);
      if (data["status"]) {
        return data["data"];
      } else {
        return "error";
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