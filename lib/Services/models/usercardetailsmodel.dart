import 'dart:convert';

import 'package:cityofcars/Utils/preference.dart';

import '../../Utils/constants.dart';
import '../servies.dart';

List<CarsModel> modellist = [];
int isSelected = 0;
Future getusercarsdata(bool set)async {
 await getusercars().then((value) {
    modellist.clear();
    modellist.addAll(value);
    Prefernece.pref!.setString("usercarsData", jsonEncode(modellist));
    // print(jsonEncode(modellist));
    // print(modellist);
    if(isSelected==0){
      isSelected = 1;
    }
    if(set){
      Prefernece.pref!.setString("brandId",modellist[0].carbrandid.toString());
      Prefernece.pref!.setString("CarId",modellist[0].carid.toString());
      Prefernece.pref!.setString("cityId",modellist[0].cityid.toString());
      Prefernece.pref!.setString("fuelId",modellist[0].carfuelid.toString());
    // Ids.brandid = ;
    // Ids.carid = modellist[0].carid.toString();
    // Ids.cityid = modellist[0].cityid.toString();
    // Ids.fuelid = modellist[0].carfuelid.toString();
    }
    
  });
}

class CarsModel {
  String carname = "";
  String carimage = "";
  String carid = "";
  String carbrand = "";
  String carbrandimage = "";
  String carbrandid = "";
  String carfuel = "";
  String carfuelimage = "";
  String carfuelid = "";
  String cityid = "";
  String city = "";
  String cityimage = "";
  String id = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carname'] = carname;
    map['carimage'] = carimage;
    map['carbrand'] = carbrand;
    map['carbrandimage'] = carbrandimage;
    map['carfuel'] = carfuel;
    map['carfuelimage'] = carfuelimage;
    map['city'] = city;
    map['cityimage'] = cityimage;
    map['carid'] = carid;
    map['carbrandid'] = carbrandid;
    map['carfuelid'] = carfuelid;
    map['cityid'] = cityid;
    map['_id'] = id;
    return map;
  }
}

CarsModel currentcar = CarsModel();
