import 'package:meta/meta.dart';
import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    required this.data,
    required this.message,
    required this.status,
  });

  AuthDataModel data;
  String message;
  int status;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        data: AuthDataModel.fromJson(json["Data"]),
        message: json["Message"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data.toJson(),
        "Message": message,
        "Status": status,
      };
}

class AuthDataModel {
  AuthDataModel({
    required this.user,
    required this.accesToken,
  });

  Data user;
  String accesToken;

  factory AuthDataModel.fromJson(Map<String, dynamic> json) => AuthDataModel(
        user: Data.fromJson(json["user"]),
        accesToken: json["Acces_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "Acces_token": accesToken,
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
