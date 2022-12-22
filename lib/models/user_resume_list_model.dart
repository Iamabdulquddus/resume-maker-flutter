// To parse this JSON data, do
//
//     final userResumeListModel = userResumeListModelFromJson(jsonString);

import 'dart:convert';

UserResumeListModel userResumeListModelFromJson(String str) => UserResumeListModel.fromJson(json.decode(str));

String userResumeListModelToJson(UserResumeListModel data) => json.encode(data.toJson());

class UserResumeListModel {
  UserResumeListModel({
    this.id,
    this.name,
    this.image_profile,
    this.email,
    this.phoneNo,
    this.dob,
    this.address,
    this.website,
    this.objective
  });

  int? id;
  String? name;
  String? image_profile;
  String? email;
  String? phoneNo;
  String? dob;
  String? address;
  String? website;
  String? objective;


  factory UserResumeListModel.fromJson(Map<String, dynamic> json) => UserResumeListModel(
    id: json["id"],
    name: json["name"],
    image_profile: json["image_profile"],
    email: json["email"],
    phoneNo: json["phone_no"],
    dob: json["dob"],
    address: json["address"],
    website: json["website"],
    objective: json["objective"]
  );



  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_profile": image_profile,
    "email": email,
    "phone_no": phoneNo,
    "dob": dob,
    "address": address,
    "website": website,
    "objective": objective,
  };
}
