// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
    MessageModel({
       required this.message,
       required this.type,
        
    });

    String message;
    String type;


    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json["message"],
        type: json["type"],

    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "type": type,

    };
}
