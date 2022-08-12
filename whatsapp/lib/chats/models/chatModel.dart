// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    this.avatar,
    this.name,
    this.message,
    this.updatedAt,
    this.isGroup,
  });

  String? avatar;
  String? name;
  String? message;
  String? updatedAt;
  bool? isGroup;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        avatar: json["avatar"],
        name: json["name"],
        message: json["message"],
        updatedAt: json["updated At"],
        isGroup: json["isGroup"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "message": message,
        "updated At": updatedAt,
        "isGroup": isGroup,
      };
}
