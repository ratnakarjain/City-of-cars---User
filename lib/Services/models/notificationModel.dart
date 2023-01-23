// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel({
    this.id,
    this.user,
    this.type,
    this.body,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? user;
  final String? type;
  final String? body;
  final String? title;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["_id"] ?? "",
        user: json["user"] ?? "",
        type: json["type"] ?? "",
        body: json["body"] ?? "",
        title: json["title"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "type": type,
        "body": body,
        "title": title,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
