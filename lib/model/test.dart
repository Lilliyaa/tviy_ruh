
import 'dart:convert';

import 'question.dart';

Test sightModelFromJson(String str) => Test.fromJson(json.decode(str));

String sightModelToJson(Test data) => json.encode(data.toJson());


class Test {
  int id;
  List<Question> questions;

  Test({
    this.id,
    this.questions
  });

  factory Test.fromJson(Map<String, dynamic> json) => Test(
      id: int.parse(json["id"]),
    questions: json["questions"],
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "questions": questions,
      };

}
