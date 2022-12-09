import 'dart:convert';

SkillListModel skillListModelFromJson(String str) => SkillListModel.fromJson(json.decode(str));

String skillListModelToJson(SkillListModel data) => json.encode(data.toJson());

class SkillListModel {
  SkillListModel({
    this.id,
    this.userId,
    this.skillName,
  });

  int? id;
  int? userId;
  String? skillName;

  factory SkillListModel.fromJson(Map<String, dynamic> json) => SkillListModel(
    id: json["id"],
    userId: json["user_id"],
    skillName: json["skills"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "skills": skillName,
  };
}
