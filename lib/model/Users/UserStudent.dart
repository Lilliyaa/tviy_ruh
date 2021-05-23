import 'dart:convert';

class UserStudent{
  final String name;
  final String surname;
  final String email;
  final String avatar;
  final bool is_premium;

 const UserStudent({
  this.name,
  this.surname,
  this.email,
  this.avatar,
  this.is_premium});

  factory UserStudent.fromJson(Map<String, dynamic> json) => UserStudent(
    is_premium: int.parse(json["is_premium"]) == 0? false : true,
    name: json["name"],
      surname: json["surname"],
      email: json["email"],
      avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "surname": surname,
        "email": email,
        "avatar": avatar,
        "is_premium": is_premium,
      };
}