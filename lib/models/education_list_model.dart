import 'dart:convert';

EducationListModel educationListModelFromJson(String str) => EducationListModel.fromJson(json.decode(str));

String educationListModelToJson(EducationListModel data) => json.encode(data.toJson());

class EducationListModel {
  EducationListModel({
    this.gpaOrMarks,
    this.joinFromYear,
    this.joinToYear,
    this.uniOrSchool,
    this.degreeOrCourse,
  });
  String? gpaOrMarks;
  String? joinFromYear;
  String? joinToYear;
  String? uniOrSchool;
  String? degreeOrCourse;

  factory EducationListModel.fromJson(Map<String, dynamic> json) => EducationListModel(
    gpaOrMarks: json["GPAOrMarks"],
    joinFromYear: json["JoinFromYear"],
    joinToYear: json["JoinToYear"],
    uniOrSchool: json["UniOrSchool"],
    degreeOrCourse: json["DegreeOrCourse"],
  );

  Map<String, dynamic> toJson() => {
    "GPAOrMarks": gpaOrMarks,
    "JoinFromYear": joinFromYear,
    "JoinToYear": joinToYear,
    "UniOrSchool": uniOrSchool,
    "DegreeOrCourse": degreeOrCourse,
  };
}
