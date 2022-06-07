class PlanModel {
  String planid = "";
  String subcatid = "";
  String label = "";
  String planimage = "";
  String planname = "";
  String subplanname = "";
  String planprice = "";
  String planpricdes = "";
  String servicepackname = "";
  String componyprice = "";
  String componypricedes = "";
  String hour = "";
  String months = "";
  String description = "";
  String termsheading = "";
  String termsdetails = "";
  String isMost = "";
  String isrec = "";
  String categoryId = "";
  String cars = "";
  List<IncludeMod> includes = [];
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["planid"] = planid;
    map['subcatid'] = subcatid;
    map['label']=label;
    map['planimage']=planimage;
    map['planname']=planname;
    map['subplanname']=subplanname;
    map['planprice']=planprice;
    map['planpricdes']=planpricdes;
    map['servicepackname']=servicepackname;
    map['componyprice']=componyprice;
    map['componypricedes']=componypricedes;
    map['hour']=hour;
    map['months']=months;
    map['description']=description;
    map['termsheading']=termsheading;
    map['termsdetails']=termsdetails;
    map['isMost']=isMost;
    map['isrec']=isrec;
    map['includes']=includes;
    map['categoryId']=categoryId;
    return map;
  }
}

class IncludeMod {
  String image = "";
  String name = "";
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    return map;
  }
}
