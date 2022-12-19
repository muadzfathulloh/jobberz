// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.data,
    required this.message,
    required this.status,
  });

  RegisterDataModel data;
  String message;
  int status;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        data: RegisterDataModel.fromJson(json["Data"]),
        message: json["Message"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data.toJson(),
        "Message": message,
        "Status": status,
      };
}

class RegisterDataModel {
  RegisterDataModel({
    required this.username,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String username;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        username: json["username"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
