
import 'dart:convert';

import 'question.dart';

Answer sightModelFromJson(String str) => Answer.fromJson(json.decode(str));

String sightModelToJson(Answer data) => json.encode(data.toJson());


class Answer{
  int id;
  String text;

  Answer({
    this.id,
    this.text
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    id: int.parse(json["id"]),
    text: json["text"],
  );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "text": text,
      };

}
