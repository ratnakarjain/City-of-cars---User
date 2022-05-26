class JobCardModel{
  String username = "";
  String address = "";
  String city = "";
  String gst = "";
  String tyrename = "";
  String carimage="";
  String carname = "";
  String carbrand = "";
  List<String> images = [];
  List<String> customersconcerns = [];
  String carNo = "";
  String odometer ="";
  String fuellevel = "";
  String frontL ="";
  String frontR = "";
  String backL = "";
  String backR ="";
  String batteryname = "";
  String batterycondtion = "";
  String remarks ="";
  List<Availeble> avail = [];
  List<Condtion> condtion = [];
}


class Availeble{
  String heading = "";
  String r = "";
  String w = "";
  String m = "";
  int x = 0;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['heading'] = heading;
    map['r']=r;
    map['w']=w;
    map['n']=m;
    map['x']=x;
    return map;
  }
}
class Condtion{
  String heading = "";
  String g = "";
  String a = "";
  String p = "";
  int x = 0;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['heading'] = heading;
    map['g'] = g;
    map['a']=a;
    map['p']=p;
    map['x']=x;
    return map;
  }
}