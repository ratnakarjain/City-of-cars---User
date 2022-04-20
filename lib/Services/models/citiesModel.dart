// To parse this JSON data, do
//
//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

List<Cities> citiesFromJson(String str) => List<Cities>.from(json.decode(str).map((x) => Cities.fromJson(x)));

String citiesToJson(List<Cities> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cities {
    Cities({
        this.id,
        this.city,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? city;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        id: json["_id"],
        city: json["city"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "city": city,
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
