// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.fname,
    this.lname,
    this.email,
    this.pwd,
    this.userType,
  });

  String id;
  String fname;
  String lname;
  String email;
  String pwd;
  String userType;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    fname: json["fname"],
    lname: json["lname"],
    email: json["email"],
    pwd: json["pwd"],
    userType: json["userType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fname": fname,
    "lname": lname,
    "email": email,
    "pwd": pwd,
    "userType": userType,
  };
}
