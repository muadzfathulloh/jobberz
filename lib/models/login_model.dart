// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.message,
    required this.status,
    required this.accesToken,
    required this.tokenType,
  });

  String message;
  int status;
  String accesToken;
  String tokenType;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        status: json["Status"],
        accesToken: json["Acces_token"],
        tokenType: json["Token_type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "Status": status,
        "Acces_token": accesToken,
        "Token_type": tokenType,
      };
}
