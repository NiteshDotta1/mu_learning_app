// To parse this JSON data, do
//
//     final allCourse = allCourseFromJson(jsonString);

import 'dart:convert';

List<AllCourse> allCourseFromJson(String str) => List<AllCourse>.from(json.decode(str).map((x) => AllCourse.fromJson(x)));

String allCourseToJson(List<AllCourse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCourse {
  AllCourse({
    this.id,
    this.name,
    this.image,
    this.teacherId,
    this.catId,
    this.totalClass,
    this.fee,
    this.status,
    this.details,
    this.teacher,
  });

  int id;
  String name;
  String image;
  int teacherId;
  int catId;
  int totalClass;
  int fee;
  String status;
  String details;
  Teacher teacher;

  factory AllCourse.fromJson(Map<String, dynamic> json) => AllCourse(
    id: json["id"],
    name: json["name"],
    image: json["image"] == null ? null : json["image"],
    teacherId: json["teacher_id"],
    catId: json["cat_id"],
    totalClass: json["total_class"],
    fee: json["fee"],
    status: json["status"],
    details: json["details"],
    teacher: Teacher.fromJson(json["teacher"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image == null ? null : image,
    "teacher_id": teacherId,
    "cat_id": catId,
    "total_class": totalClass,
    "fee": fee,
    "status": status,
    "details": details,
    "teacher": teacher.toJson(),
  };
}

class Teacher {
  Teacher({
    this.id,
    this.type,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.token,
    this.image,
    this.city,
    this.country,
    this.postCode,
  });

  int id;
  String type;
  String name;
  String phone;
  String email;
  String password;
  String token;
  dynamic image;
  dynamic city;
  dynamic country;
  dynamic postCode;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    token: json["token"],
    image: json["image"],
    city: json["city"],
    country: json["country"],
    postCode: json["post_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "token": token,
    "image": image,
    "city": city,
    "country": country,
    "post_code": postCode,
  };
}
