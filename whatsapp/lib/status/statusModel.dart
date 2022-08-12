// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) =>
    StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
  StatusModel({
    required this.avatar,
    required this.name,
    required this.date,
    required this.updatedAt,
  });

  String? avatar;
  String? name;
  String? date;
  String? updatedAt;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
      avatar: json["avatar"],
      name: json["name"],
      date: json["date"],
      updatedAt: json["updatedAt"]);

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "date": date,
        "updated At": updatedAt,
      };
}
