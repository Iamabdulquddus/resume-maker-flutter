// To parse this JSON data, do
//
//     final userResumeListModel = userResumeListModelFromJson(jsonString);

import 'dart:convert';

UserResumeListModel userResumeListModelFromJson(String str) => UserResumeListModel.fromJson(json.decode(str));

String userResumeListModelToJson(UserResumeListModel data) => json.encode(data.toJson());

class UserResumeListModel {
  UserResumeListModel({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    this.dob,
    required this.address,
    this.website,
    this.objective,
  });

  String? id;
  String name;
  String email;
  String phoneNo;
  String? dob;
  String address;
  String? website;
  String? objective;

  factory UserResumeListModel.fromJson(Map<String, dynamic> json) => UserResumeListModel(
    id: json["id"].toString(),
    name: json["name"],
    email: json["email"],
    phoneNo: json["phone_no"],
    dob: json["dob"],
    address: json["address"],
    website: json["website"],
    objective: json["objective"],
  );



  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone_no": phoneNo,
    "dob": dob,
    "address": address,
    "website": website,
    "objective": objective,
  };
}
