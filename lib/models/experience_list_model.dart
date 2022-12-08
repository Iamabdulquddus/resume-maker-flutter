import 'dart:convert';

ExperienceListModel experienceListModelFromJson(String str) => ExperienceListModel.fromJson(json.decode(str));

String experienceListModelToJson(ExperienceListModel data) => json.encode(data.toJson());

class ExperienceListModel {
  ExperienceListModel({
    required this.companyName,
    required this.jobTitle,
    required this.joinFromYear,
    required this.toEndYear,
    required this.details,
  });

  String companyName;
  String jobTitle;
  String joinFromYear;
  String toEndYear;
  String details;

  factory ExperienceListModel.fromJson(Map<String, dynamic> json) => ExperienceListModel(
    companyName: json["companyName"],
    jobTitle: json["jobTitle"],
    joinFromYear: json["JoinFromYear"],
    toEndYear: json["toEndYear"],
    details: json["Details"],
  );

  Map<String, dynamic> toJson() => {
    "companyName": companyName,
    "jobTitle": jobTitle,
    "JoinFromYear": joinFromYear,
    "toEndYear": toEndYear,
    "Details": details,
  };
}
