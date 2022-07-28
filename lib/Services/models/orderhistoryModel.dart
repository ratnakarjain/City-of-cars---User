import 'dart:convert';

class OrderHistoryModel{
  String id = "";
  String orderid = "";
  String deliverydate = "";
  String deliverytime = "";
  String price = "";
  String paystatus = "";
  String carimage = "";
  String carname = "";
  String carbrand = "";
  String packname = "";
  String servicename = "";
  String details = "";
  String status = "";
  String invoice = "";
  List<OrdersPlans> ordersPlans = [];
}
List<OrdersPlans> ordersPlanModelFromJson(String str) => List<OrdersPlans>.from(json.decode(str).map((x) => OrdersPlans.fromJson(x)));

class OrdersPlans{
  String? planName;
  String? plansubName;
  String? planPrice;
  String? month;
  String? hour;
  List<ServiceList>? list;
  OrdersPlans({
    this.hour,
    this.list,
    this.month,
    this.planName,
    this.planPrice,
    this.plansubName
  });
   factory OrdersPlans.fromJson(Map<String, dynamic> json) => OrdersPlans(
        planName: json["selectplan"][0]["planName"],
        plansubName: json["selectplan"][0]["subPlanName"],
        planPrice: json["selectplan"][0]["typeprice"],
        month: json["Plans"]["month"],
        hour: json["Plans"]["hours"],
        list: List<ServiceList>.from(json["Plans"]["services_id"].map((x) => ServiceList.fromJson(x))),
    );
}
// List<ServiceList> serviceListModelFromJson(String str) => List<ServiceList>.from(json.decode(str).map((x) => OrdersPlans.fromJson(x)));

class ServiceList{
  String? name;
  String? image;
  ServiceList({
    this.image,
    this.name
  });
  factory ServiceList.fromJson(Map<String, dynamic> json) => ServiceList(
        name: json["title"],
        image: json["image"]
    );
}