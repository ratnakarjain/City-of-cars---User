class CarsModel {
  String carname = "";
  String carimage = "";
  String carid = "";
  String carbrand = "";
  String carbrandimage = "";
  String carbrandid="";
  String carfuel = "";
  String carfuelimage = "";
  String carfuelid = "";
  String cityid ="";
  String city = "";
  String cityimage = "";
  
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carname'] = carname;
    map['carimage']=carimage;
    map['carbrand']=carbrand;
    map['carbrandimage']=carbrandimage;
    map['carfuel']=carfuel;
    map['carfuelimage']=carfuelimage;
    map['city']=city;
    map['cityimage']=cityimage;
    map['carid'] =carid;
    map['carbrandid'] = carbrandid;
    map['carfuelid'] = carfuelid;
    map['cityid'] = cityid;
    return map;
  }

}
CarsModel currentcar = CarsModel();