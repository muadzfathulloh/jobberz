import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String username;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// UserProfileModel welcomeFromJson(String str) =>
//     UserProfileModel.fromJson(json.decode(str));

// String welcomeToJson(UserProfileModel data) => json.encode(data.toJson());

// class UserProfileModel {
//   UserProfileModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   bool status;
//   String message;
//   Data data;

//   factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
//       UserProfileModel(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     required this.user,
//   });

//   UserProfileDataModel user;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         user: UserProfileDataModel.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "user": user.toJson(),
//       };
// }

// class UserProfileDataModel {
//   UserProfileDataModel({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.emailVerifiedAt,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   String username;
//   String email;
//   dynamic emailVerifiedAt;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
//       UserProfileDataModel(
//         id: json["id"],
//         username: json["username"],
//         email: json["email"],
//         emailVerifiedAt: json["email_verified_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "email": email,
//         "email_verified_at": emailVerifiedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
