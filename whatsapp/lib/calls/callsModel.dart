import 'package:flutter/material.dart';
// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

CallsModel callsModelFromJson(String str) =>
    CallsModel.fromJson(json.decode(str));

String chatModelToJson(CallsModel data) => json.encode(data.toJson());

class CallsModel {
  CallsModel({
    required this.avatar,
    required this.name,
    required this.date,
    required this.updatedAt,
    required this.isGroup,
    required this.callType,
    required this.calllist,
  });

  String avatar;
  String name;
  String date;
  String updatedAt;
  bool isGroup;
  bool callType;
 String calllist;

  factory CallsModel.fromJson(Map<String, dynamic> json) => CallsModel(
      avatar: json["avatar"],
      name: json["name"],
      date: json["date"],
      updatedAt: json["updated At"],
      isGroup: json["isGroup"],
      callType: json["callType"],
      calllist:json["calllist"]);
  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "date": date,
        "updated At": updatedAt,
        "isGroup": isGroup,
        "callType": callType,
        "calllist":calllist,
      };
}
