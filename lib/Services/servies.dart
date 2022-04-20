// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cityofcars/Services/models/citiesModel.dart';
import 'package:cityofcars/Services/url.dart';
import 'package:cityofcars/Utils/preference.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
var prefs = Prefernece.pref;
// register(String _name, String _mail, String _mobile) async {
  
//   var url = Uri.parse(registerUrl);
//   try {
//     var response = await http.post(url, body: {
//       'name': _name,
//       'email': _mail,
//       'mobile': _mobile,
//     });
//     if (response.statusCode == 200) {
//       var jsonResponse =
//         convert.jsonDecode(response.body);
//       print("success");
//       print(jsonResponse);
//       print(jsonResponse["token"]);
//       prefs!.setString("token", jsonResponse["token"]);
//       token = prefs!.getString("token")!;
//       print("$token");
//       return response.body;
//     }
//   } catch (e) {
//     print("error $e");
//   }
// }

// login(String _mobile) async {
//    var url = Uri.parse(registerUrl);
//   try {
//     var response = await http.post(url, body: {
//       'mobile': _mobile,
//     });
//     if (response.statusCode == 200) {
//       print("success");
//       return response.body;
//     }
//   } catch (e) {
//     print("error $e");
//   }
// }

//  Future verifyOtp(String otp)async{

//  var url = Uri.parse(verification);
//   try {
//     var response = await http.post(url, body: {
//       'otp': otp,
//     },
//     headers:{"Authorization": prefs!.getString('token').toString()}
//     );
//     if (response.statusCode == 200) {
//       print("success");
//       return response.body;
//     }
//   } catch (e) {
//     print("error $e");
//   }
// }

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
        print(data["getCities"]);
        return data["getCities"];
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