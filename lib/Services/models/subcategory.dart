import 'package:cityofcars/Services/models/plansModel.dart';

class SubcatModel{
  String id = "";
  String name = "";
  List<PlanModel> plans=[];
  Map<String, dynamic> toJson(){
    final map= <String, dynamic> {};
    map['id']=id;
    map['name']=name;
    map['plans']=plans;
    return map;
  }
}