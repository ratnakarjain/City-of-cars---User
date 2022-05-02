// To parse this JSON data, do
//
//     final subcategory = subcategoryFromJson(jsonString);

import 'dart:convert';

Subcategory subcategoryFromJson(String str) => Subcategory.fromJson(json.decode(str));

String subcategoryToJson(Subcategory data) => json.encode(data.toJson());

class Subcategory {
    Subcategory({
        this.msg,
        this.status,
        this.data,
        this.err,
    });

    String? msg;
    bool? status;
    List<Data>? data;
    dynamic err;

    factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        msg: json["msg"],
        status: json["status"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        err: json["err"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "err": err,
    };
}

class Data {
    Data({
        this.id,
        this.title,
        this.parentsid,
        this.discreption,
        this.planId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? title;
    String? parentsid;
    String? discreption;
    List<PlanId>? planId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        title: json["title"],
        parentsid: json["parentsid"],
        discreption: json["discreption"],
        planId: List<PlanId>.from(json["plan_id"].map((x) => PlanId.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "parentsid": parentsid,
        "discreption": discreption,
        "plan_id": List<dynamic>.from(planId!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class PlanId {
    PlanId({
        this.id,
        this.servicesId,
        this.label,
        this.planName,
        this.servicepack,
        this.typeprice,
        this.servicepackprice,
        this.timming,
        this.description,
        this.subcategory,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    List<ServicesId>? servicesId;
    String? label;
    String? planName;
    String? servicepack;
    List<Price>? typeprice;
    List<Price>? servicepackprice;
    List<Timming>? timming;
    String? description;
    List<String>? subcategory;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory PlanId.fromJson(Map<String, dynamic> json) => PlanId(
        id: json["_id"],
        servicesId: List<ServicesId>.from(json["services_id"].map((x) => ServicesId.fromJson(x))),
        label: json["label"],
        planName: json["planName"],
        servicepack: json["servicepack"],
        typeprice: List<Price>.from(json["typeprice"].map((x) => Price.fromJson(x))),
        servicepackprice: List<Price>.from(json["servicepackprice"].map((x) => Price.fromJson(x))),
        timming: List<Timming>.from(json["timming"].map((x) => Timming.fromJson(x))),
        description: json["description"],
        subcategory: List<String>.from(json["Subcategory"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "services_id": List<dynamic>.from(servicesId!.map((x) => x.toJson())),
        "label": label,
        "planName": planName,
        "servicepack": servicepack,
        "typeprice": List<dynamic>.from(typeprice!.map((x) => x.toJson())),
        "servicepackprice": List<dynamic>.from(servicepackprice!.map((x) => x.toJson())),
        "timming": List<dynamic>.from(timming!.map((x) => x.toJson())),
        "description": description,
        "Subcategory": List<dynamic>.from(subcategory!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class Price {
    Price({
        this.price,
        this.id,
    });

    String? price;
    String? id;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        price: json["price"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "_id": id,
    };
}

class ServicesId {
    ServicesId({
        this.id,
        this.title,
        this.discerpition,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? title;
    String? discerpition;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory ServicesId.fromJson(Map<String, dynamic> json) => ServicesId(
        id: json["_id"],
        title: json["title"],
        discerpition: json["discerpition"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "discerpition": discerpition,
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class Timming {
    Timming({
        this.hours,
        this.month,
        this.id,
    });

    String? hours;
    String? month;
    String? id;

    factory Timming.fromJson(Map<String, dynamic> json) => Timming(
        hours: json["hours"],
        month: json["month"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "hours": hours,
        "month": month,
        "_id": id,
    };
}
