
import 'dart:convert';

CrewModel crewModelFromMap(String str) => CrewModel.fromMap(json.decode(str));

String crewModelToMap(CrewModel data) => json.encode(data.toMap());

class CrewModel {
  String name;
  String job;
  String id;
  String createdAt;

  CrewModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory CrewModel.fromMap(Map<String, dynamic> json) => CrewModel(
    name: json["name"] ?? "",
    job: json["job"] ?? "",
    id: json["id"] ?? "",
    createdAt: json["createdAt"] ?? "",
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt,
  };
}
