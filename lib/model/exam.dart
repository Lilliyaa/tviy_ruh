import 'dart:convert';

class Exam{
  int id;
  String rightAnswers;

  Exam({this.id, this.rightAnswers});

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
      id: int.parse(json["exam_id"]),
      rightAnswers: json["right_answers"]
  );

  String toString() => "id: $id, right answers: $rightAnswers";
}