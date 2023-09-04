import 'dart:convert';

ListCrewModel listCrewModelFromMap(String str) =>
    ListCrewModel.fromMap(json.decode(str));

String listCrewModelToMap(ListCrewModel data) => json.encode(data.toMap());

class ListCrewModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  ListCrewModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory ListCrewModel.fromMap(Map<dynamic, dynamic> json) => ListCrewModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
