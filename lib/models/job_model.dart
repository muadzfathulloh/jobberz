// To parse this JSON data, do
//
//     final jobModel = jobModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

JobModel jobModelFromJson(String str) => JobModel.fromJson(json.decode(str));

String jobModelToJson(JobModel data) => json.encode(data.toJson());

class JobModel {
  JobModel({
    required this.data,
  });

  JobDataModel data;

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        data: JobDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class JobDataModel {
  JobDataModel({
    required this.id,
    required this.jobName,
    required this.company,
    required this.rate,
    required this.sallary,
    required this.createdAt,
    required this.updatedAt,
    // required this.categories,
  });

  int id;
  String jobName;
  String company;
  String rate;
  String sallary;
  DateTime createdAt;
  DateTime updatedAt;
  // List<Category> categories;

  factory JobDataModel.fromJson(Map<String, dynamic> json) => JobDataModel(
        id: json["id"],
        jobName: json["job_name"],
        company: json["company"],
        rate: json["rate"],
        sallary: json["sallary"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // categories: List<Category>.from(
        //     json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "job_name": jobName,
        "company": company,
        "rate": rate,
        "sallary": sallary,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        // "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.id,
    required this.jobesId,
    required this.nameCategori,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String jobesId;
  String nameCategori;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        jobesId: json["jobes_id"],
        nameCategori: json["name_categori"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobes_id": jobesId,
        "name_categori": nameCategori,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
