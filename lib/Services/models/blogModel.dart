// class BlogModel{
//   String? heading;
//   String? timing;
//   String? des;
//   String? image;
//   String? subdes;
// }
// To parse this JSON data, do
//
//     final blogsModel = blogsModelFromJson(jsonString);

import 'dart:convert';

List<BlogsModel> blogsModelFromJson(String str) => List<BlogsModel>.from(json.decode(str).map((x) => BlogsModel.fromJson(x)));

String blogsModelToJson(List<BlogsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogsModel {
    BlogsModel({
        this.id,
        this.blogsheading,
        this.createDate,
        this.discreption,
        this.subDiscreption,
        this.image,
        this.status
    });

    String? id;
    String? blogsheading;
    String? createDate;
    String? discreption;
    String? subDiscreption;
    String? image;
    bool? status;

    factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
        id: json["_id"],
        blogsheading: json["blogsheading"],
        createDate: json["createdAt"],
        discreption: json["Discreption"],
        subDiscreption: json["SubDiscreption"],
        image: json["image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "blogsheading": blogsheading,
        "createDate": createDate,
        "Discreption": discreption,
        "SubDiscreption": subDiscreption,
        "image": image,
        "status": status,
    };
}
