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
        
    });

    String? id;
    String? city;
    String? image;
    

    factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        id: json["_id"],
        city: json["city"],
        image: json["image"],
        
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "city": city,
        "image": image,
        
    };
}
